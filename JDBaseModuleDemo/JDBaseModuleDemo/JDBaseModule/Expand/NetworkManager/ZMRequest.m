//
//  JDRequest.m
//  JDMovie
//
//  Created by JDragon on 2018/8/15.
//  Copyright © 2018 JDragon. All rights reserved.
//

#import "JDRequest.h"
#import "NSObject+RACDescription.h"
#import "OpenUDID.h"
#import "JDBaseModuleHeader.h"
#import "MBProgressHUD+JDragon.h"

NSString *const JDUrl_Version = @"1.0.0.3";

static NSString  *JDUrl_Port = @"";//暂时弃用，服务器路由整体调整


typedef NS_ENUM(NSInteger,JDRefreshCacheTimeType)
{
    JDRequestCacheTimeTypeNone=1,
    JDRequestCacheTimeTypeShort=2,
    JDRequestCacheTimeTypeLong=3,
    JDRequestCacheTimeTypeFirstLong=4

};


@interface JDRequest ()


@property (nonatomic, assign)JDRefreshCacheTimeType cacheTimeType;
@property (nonatomic, readwrite, assign) NSInteger serverResponseStatusCode;
@property (nonatomic, readwrite, assign) NSInteger serverRequestStatusCode;
@property (nonatomic, readwrite, copy) NSString *serverResponseMessage;

@property (nonatomic, strong) NSDictionary *argument;
@property (nonatomic, assign) NSInteger firstCacheTime;

@end


@implementation JDRequest
-(id)init
{
    self=[super init];
    if (self) {
        self.cacheTimeType=JDRequestCacheTimeTypeFirstLong;
        self.ignoreCache = true;
    }
    return self;
}
- (NSTimeInterval)requestTimeoutInterval {
    return 10.0;
}
-(NSInteger)cacheTimeInSeconds
{
    NSInteger seconds=-1;
    switch (_cacheTimeType) {
        case JDRequestCacheTimeTypeFirstLong:
            seconds= 60*60*24*30;
            break;
        case JDRequestCacheTimeTypeLong:
            seconds=10*6;
            break;
        case JDRequestCacheTimeTypeShort:
            seconds= 5;
            break;
        case JDRequestCacheTimeTypeNone:
        default:
            break;
    }
    return seconds;
}
- (JDRequestMethod)requestMethod {
//#ifdef DEBUG
//    return ECRequestMethodGET;
//#else
//    return ECRequestMethodPOST;
//#endif
     return JDRequestMethodPOST;
}
- (id)requestArgument
{
    return self.argument;
}
-(NSString*)requestUrl
{
    
    NSString  *url = [NSString stringWithFormat:@"%@%@%@%@",KURL_Base_m,KURL_Base_Api,KURL_Base_Version,self.JDRequestUrl];

    return url;
}
// 如果没有网络 failure同步方式返回
- (void)startWithCompletionBlockWithSuccess:(JDRequestCompletionBlock)success
                                    failure:(JDRequestCompletionBlock)failure {
    if (![JDApiManager isNetworkReachable]) {
        [JDNotificationManager postNoNetworkNotification:@{}];
        if (failure)
        {
            failure(self);
        }
        return;
    }
    //    WS(weakSelf);
    [self setCompletionBlockWithSuccess:success failure:^(__kindof JDRequest * _Nonnull request) {
        if (failure)
        {
            failure(request);
        }
#if DEBUG
    if (!request.responseObject)
        DDLogVerbose(@"解析失败");
#endif
    }];
    [self start];
}
+(instancetype)startRequestWithUrl:(NSString*)url withExtendArguments:(NSDictionary*)Arguments withCompletionBlockWithSuccess:(JDRequestCompletionBlock)success
{
//  JDUrl_Port = @"";
  return  [JDRequest startRequestWithUrl:url withExtendArguments:Arguments withCompletionBlockWithSuccess:success failure:^(__kindof JDRequest * _Nonnull request) {
        
    }];
}
+(instancetype)startRequestNewApiWithUrl:(NSString*)url
                     withExtendArguments:(NSDictionary*)Arguments
          withCompletionBlockWithSuccess:(JDRequestCompletionBlock)success
{
//    JDUrl_Port = @"m/";
    return  [JDRequest startRequestWithUrl:url withExtendArguments:Arguments withCompletionBlockWithSuccess:success failure:^(__kindof JDRequest * _Nonnull request) {
        
    }];
}

+(instancetype)startRequestNewApiWithUrl:(NSString*)url
                     withExtendArguments:(NSDictionary*)Arguments
          withCompletionBlockWithSuccess:(JDRequestCompletionBlock)success
                                 failure:(JDRequestCompletionBlock)failure {
//    JDUrl_Port = @"m/";
    return [JDRequest startRequestWithUrl:url withExtendArguments:Arguments withCompletionBlockWithSuccess:success failure:failure];
}

+(instancetype)startRequestWithUrl:(NSString*)url withExtendArguments:(NSDictionary*)Arguments withCompletionBlockWithSuccess:     (JDRequestCompletionBlock)success failure:
    (JDRequestCompletionBlock)failure
{
    JDRequest  *req  = [[JDRequest  alloc]init];
    [req setJDRequestUrl:url];
    NSMutableDictionary  *dic = [[NSMutableDictionary  alloc]initWithDictionary:Arguments];
    [dic setValue:JDUrl_Version forKey:@"version"];
    [dic setValue:[OpenUDID value] forKey:@"deviceId"];
    [dic setValue:@"15"forKey:@"pageSize"];
    [dic setValue:@"1"forKey:@"sincetime"];
//    req.extendArguments =dic;
    req.argument = dic;
    [req isShowHUDConfig];
    [req setCompletionBlockWithSuccess:^(__kindof JDRequest * _Nonnull request) {
//        [MBProgressHUD hideHUD];
        DDLogVerbose(@"请求成功%@",request.filtResponseObj);
        if([request.filtResponseObj isKindOfClass:[NSNull class]])return;
        success(request);
    } failure:^(__kindof JDBaseRequest * _Nonnull request) {
        NSString  *error = request.error.localizedDescription;
        if (req.serverResponseMessage.length>0) {
            error = req.serverResponseMessage;
        }
        DDLogError(@"返回数据==%@ error==%@",request.responseObject,error);
        if (failure) {
            failure(request);
        }
        [request statusCodeValidator];
    }];
    [req start];
    return req;
}
+(JDChainRequest*)startChainRequestWithUrls:(NSArray*)urls
                           withArgumentsArr:(NSArray<NSDictionary*>*)argumentsArr
                        withRequestDelegate:(id<JDChainRequestDelegate>)delegate
{
    JDUrl_Port = @"";
    JDChainRequest *chainRequest = [[JDChainRequest alloc] init];
    NSMutableArray  *requestArr = [[NSMutableArray alloc]init];
    for (int i=0; i<urls.count; i++) {
        
        JDRequest  *req  = [[JDRequest  alloc]init];
        [req setJDRequestUrl:urls[i]];
        NSMutableDictionary  *dic = [[NSMutableDictionary  alloc]initWithDictionary:argumentsArr[i]];
        [dic setValue:JDUrl_Version forKey:@"version"];
        [dic setValue:[OpenUDID value] forKey:@"deviceId"];
        [dic setValue:@"15"forKey:@"pageSize"];
        [dic setValue:@"1"forKey:@"sincetime"];
        req.argument = dic;
        [requestArr addObject:req];
//        if ([req loadCacheWithError:nil]) {
//             NSDictionary *json = [req responseJSONObject];
//             DDLogVerbose(@"使用缓存数据");
//             req.filtResponseObj = json[@"data"];
//                    // show cached data
//        }
    }
    __block NSInteger  i = 0;
    [chainRequest addRequest:requestArr[i] callback:^(JDChainRequest * _Nonnull chainRequest, JDBaseRequest * _Nonnull baseRequest) {
    
        DDLogVerbose(@"%@",[NSString stringWithFormat:@"*%@请求完成 \n**进入下一个请求%@",NSStringFromClass([baseRequest class]),NSStringFromClass([requestArr[i] class])]);
        if (i<requestArr.count-1) {
            [chainRequest addRequest:requestArr[i+1] callback:nil];
        }
        i+=1;
    }];
    chainRequest.delegate = delegate;
    return chainRequest;
}
//并行请求
+(JDBatchRequest*)startBatchRequestWithUrls:(NSArray*)urls
                           withArgumentsArr:(NSArray<NSDictionary*>*)argumentsArr
             withCompletionBlockWithSuccess:(JDBatchRequestCompletionBlock)success
                                    failure:(JDBatchRequestCompletionBlock)failure
{
    JDUrl_Port = @"";
    NSMutableArray  *requestArr = [[NSMutableArray alloc]init];
    for (int i=0; i<urls.count; i++) {
        
        JDRequest  *req  = [[JDRequest  alloc]init];
        [req setJDRequestUrl:urls[i]];
        NSMutableDictionary  *dic = [[NSMutableDictionary  alloc]initWithDictionary:argumentsArr[i]];
        [dic setValue:JDUrl_Version forKey:@"version"];
        [dic setValue:[OpenUDID value] forKey:@"deviceId"];
        [dic setValue:@"15"forKey:@"pageSize"];
        [dic setValue:@"1"forKey:@"sincetime"];

        req.argument = dic;
        [requestArr addObject:req];
//        if ([req loadCacheWithError:nil]) {
//             NSDictionary *json = [req responseJSONObject];
//             DDLogVerbose(@"使用缓存数据");
//             req.filtResponseObj = json[@"data"];
//                // show cached data
//        }
    }
    JDBatchRequest *batch = [[JDBatchRequest alloc]initWithRequestArray:requestArr];
 
    [batch startWithCompletionBlockWithSuccess:^(JDBatchRequest * _Nonnull batchRequest) {
        DDLogVerbose(@"所有请求完成");
        if (success) {
            success(batchRequest);
        }
        for (JDRequest *request in batchRequest.requestArray) {
            
            if (request.responseObject) {
             
                DDLogVerbose(@"请求成功%@",request.filtResponseObj);
            }
        }
    } failure:^(JDBatchRequest * _Nonnull batchRequest) {
        JDRequest *request = batchRequest.failedRequest;
        DDLogVerbose(@"%@",[NSString stringWithFormat:@"\n**原请求队列: %@。\n请求失败的接口：%@ , 错误是：%@",batchRequest.requestArray,request.requestUrl,request.responseString]);
        [request statusCodeValidator];
        if (failure) {
            failure(batchRequest);
        }
    }];
    return batch;
}
- (NSDictionary *)requestHeaderFieldValueDictionary {
    return [JDRequest publicHead];
}
+(NSDictionary*)publicHead
{
    NSString *token = [JDApiManager getToken];
    NSDictionary   *dic = @{@"authToken": token,
                            @"deviceId":[OpenUDID value],
                            @"mobile":kGetUserMobile?kGetUserMobile:@"",
                        @"phonecode":kGetUserMobileCode?kGetUserMobileCode:@"",
                            };
    
    NSString *json =[dic modelToJSONString];
    //    NSString  *jsonString = [json stringByReplacingOccurrencesOfString:@"\"" withString:@"\'"];
    NSDictionary  *header = @{@"Authorization":json};
    return header;
}
- (BOOL)statusCodeValidator {
    
    DISPATCH_ON_MAIN_THREAD(^{
        [MBProgressHUD hideHUD];
    })
    BOOL isOk = [super statusCodeValidator];
    if (!isOk)//HTTP 错误
    {
        [self showHTTPServerResponseMessageError];
        return isOk;
    }
    if (!self.responseObject)//判断返回responseObject是否为空
    {
        [self.class errorAlertInfo:@"后台数据返回为Null"];
        return NO;
    }
    self.serverResponseStatusCode = self.responseStatusCode;
    self.filtResponseObj = self.responseObject[@"data"];
    self.serverRequestStatusCode = [self.responseObject[@"code"] integerValue];
    self.serverResponseMessage = self.responseObject[@"msg"];
    if (self.serverRequestStatusCode == 0)
    {
        return YES;
    }
    else if (self.serverRequestStatusCode == 90002)
    {
        [self.class errorAlertInfo:self.serverResponseMessage];
        [self loginStateChangeAction];
    }
    else
    {
        [self showServerResponseMessageError];
    }
    return NO;
}
-(void)showHTTPServerResponseMessageError
{
    if (self.responseStatusCode==401) {
        [self loginStateChangeAction];
        return;
    }
    NSDictionary *reObj = self.responseObject;
    NSString  *error =[NSString stringWithFormat:@"错误code:%ld",self.responseStatusCode];
    if ([reObj.allKeys containsObject:@"error"]) {
        error = [NSString stringWithFormat:@"错误code:%ld  错误信息:%@",self.responseStatusCode,reObj[@"error"]];
    }
    [self.class errorAlertInfo:error];
}
-(void)showServerResponseMessageError
{
    if([self.serverResponseMessage isKindOfClass:[NSNull class]]|| self.serverResponseMessage.length<=0)
    {
        [self.class errorAlertInfo:@"msg返回为空"];
    }else
    {
        [self.class errorAlertInfo:self.serverResponseMessage];
    }
}
-(void)loginStateChangeAction
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [kUserManager logout:^(BOOL success, NSString *des) {
            if (success) {
                DISPATCH_ON_MAIN_THREAD(^{
                    KPostNotification(KNotificationLoginStateChange, @NO);
                });
            }
        }];
    });
}
+ (void)errorAlertInfo:(NSString *)title {
    
    DISPATCH_ON_MAIN_THREAD(^{
        [MBProgressHUD hideHUD];
        [MBProgressHUD showErrorMessage:title?title:@"null"];
    })
}
-(void)isShowHUDConfig
{
    UIViewController  *bc = [JDBaseViewController JDCurrentUiVC];
    if ([bc.class isEqual:NSClassFromString(@"JDHomeSearchPage")]) {
        if ([self.JDRequestUrl isEqualToString:URL_Movie_Search_Result]) {
            return;
        }
    }else
    if ([self.JDRequestUrl isEqualToString:URL_Home_movies_log]) {
        return;
    }else
    if ([self.JDRequestUrl isEqualToString:@"activities/mine"]) {
        return;
    } else
    if ([self.JDRequestUrl isEqualToString:@"activities/mine/join"]) {
        return;
    } else
    if ([self.JDRequestUrl isEqualToString:@"activities/nearby"]) {
        return;
    } else
    if ([self.JDRequestUrl isEqualToString:@"activities/cinemas"]){
        return;
    } else
    if ([self.JDRequestUrl isEqualToString:@"account/chat/info"]) {
        return;
    } else
    if ([self.JDRequestUrl isEqualToString:URL_LaunchAD]) {
        return;
    }else
    if ([self.JDRequestUrl isEqualToString:URL_user_info]) {
        return;
    }else
    if ([self.JDRequestUrl isEqualToString:URL_Room_Users]) {
        return;
    }else
    if ([self.JDRequestUrl isEqualToString:URL_Home_Movies]) {
        return;
    } else
    if ([self.JDRequestUrl isEqualToString:URL_Room_List]) {
        return;
    }else
    if ([self.JDRequestUrl isEqualToString:URL_Room_Chat_info]) {
        return;
    }else 
    if ([self.JDRequestUrl isEqualToString:URL_Mine_Coupons]) {
        return;
    }
    if ([self.JDRequestUrl isEqualToString:URL_Mine_Album_Sort]) {
        return;
    }else
    if ([self.JDRequestUrl isEqualToString:URL_user_account_album]) {
        return;
    }else
    if ([self.JDRequestUrl isEqualToString:URL_user_Mine_Photos_album]){
        return;
    }
    if ([self.JDRequestUrl isEqualToString:URL_Room_List]) {
        return;
    }else if ([self.JDRequestUrl isEqualToString:@"subjects/timeline"]) {
        return;
    } else if ([self.JDRequestUrl isEqualToString:@"subjects/praise"]) {
        return;
    } else if ([self.JDRequestUrl isEqualToString:@"subjects/detail"]) {
        return;
    } else if ([self.JDRequestUrl isEqualToString:@"subjects/comments"]) {
        return;
    } else
    {
        DISPATCH_ON_MAIN_THREAD(^{
        [MBProgressHUD showActivityMessageInWindow:@"加载中..."];
        });
    }
}

//- (NSString *)description
//{
//    DDLogError(@"header==%@",self.currentRequest.allHTTPHeaderFields);
//
//    return [super description];
//}

#pragma maek---------------------------RAC Request----------------------------------
//+ (RACSignal *)rac_requestSignalWithUrl:(NSString*)url withExtendArguments:(NSDictionary*)Arguments
//{

//    JDRequest  *req  = [[JDRequest  alloc]init];
//    [req setJDRequestUrl:url];
//    req.extendArguments =Arguments;
//    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//
//        [req startWithCompletionBlockWithSuccess:^(__kindof ECBaseRequest * _Nonnull request) {
//            NSDictionary  *data = request.responseObject[@"data"];
//            [subscriber sendNext:data];
//            [subscriber sendCompleted];
//        } failure:^(__kindof ECBaseRequest * _Nonnull request) {
//           [subscriber sendError:[request error]];
//        }];
//        return [RACDisposable disposableWithBlock:^{
//        if (!req.isCancelled) {
//            [req stop];
//        }
//        }];
//    }];
//    //设置名称 便于调试
//    if (DEBUG) {
//        [signal setNameWithFormat:@"%@ -rac_JDRequest",  RACDescription(req)];
//    }
//    return signal;
    
//        JDRequest  *req  = [[JDRequest  alloc]init];
//        [req setJDRequestUrl:url];
//        req.extendArguments =Arguments;
    
//        return  [req  rac_requestSignalWithUrl:url withExtendArguments:Arguments];
//}
@end
