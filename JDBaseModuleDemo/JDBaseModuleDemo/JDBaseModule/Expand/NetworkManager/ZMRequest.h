//
//  JDRequest.h
//  JDMovie
//
//  Created by JDragon on 2018/8/15.
//  Copyright © 2018 JDragon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDNetwork.h"
#import "JDApiManager.h"
#import "JDNotificationManager.h"
#import "JDResponse.h"
#import "ReactiveObjC.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^JDRequestCompletionBlock)( JDRequest *request);
//typedef void(^JDBatchRequestCompletionBlock)(__kindof JDBatchRequest *request);
typedef void(^JDBatchRequestCompletionBlock)( JDBatchRequest *request);




@interface JDRequest : JDRequest


//HTTP返回接口状态码，其中：200 成功，
//                  600 未登录
//                  500 服务器错误
//                  501 已经存在
//                  502 数据接口为空
//                  400 请求参数有错，
//                  401 非法请求，
//                  1 没有网络
//                  0 服务后台问题，可使用response的statuscode查询具体问题

@property (nonatomic, readonly, assign) NSInteger serverResponseStatusCode;

//返回请求状态码，其中：0正常，其他不正常
@property (nonatomic, readonly, assign) NSInteger serverRequestStatusCode;


@property (nonatomic, strong) NSDictionary *filtResponseObj;

// 返回的提示信息
@property (nonatomic, readonly, copy) NSString *serverResponseMessage;

@property (nonatomic,  copy) NSString *JDRequestUrl;

+(instancetype)startRequestWithUrl:(NSString*)url
               withExtendArguments:(NSDictionary*)Arguments
    withCompletionBlockWithSuccess:(JDRequestCompletionBlock)success;

+(instancetype)startRequestWithUrl:(NSString*)url
               withExtendArguments:(NSDictionary*)Arguments
    withCompletionBlockWithSuccess:(JDRequestCompletionBlock)success
                           failure:(JDRequestCompletionBlock)failure;

+(instancetype)startRequestNewApiWithUrl:(NSString*)url
               withExtendArguments:(NSDictionary*)Arguments
    withCompletionBlockWithSuccess:(JDRequestCompletionBlock)success;

+(instancetype)startRequestNewApiWithUrl:(NSString*)url
                     withExtendArguments:(NSDictionary*)Arguments
          withCompletionBlockWithSuccess:(JDRequestCompletionBlock)success
                                 failure:(JDRequestCompletionBlock)failure;


+(JDChainRequest*)startChainRequestWithUrls:(NSArray*)urls
                             withArgumentsArr:(NSArray<NSDictionary*>*)argumentsArr
                          withRequestDelegate:(id<JDChainRequestDelegate>)delegate;

+(JDBatchRequest*)startBatchRequestWithUrls:(NSArray*)urls
                           withArgumentsArr:(NSArray<NSDictionary*>*)argumentsArr
             withCompletionBlockWithSuccess:(JDBatchRequestCompletionBlock)success
                                    failure:(JDBatchRequestCompletionBlock)failure;

//+ (RACSignal *)rac_requestSignalWithUrl:(NSString*)url withExtendArguments:(NSDictionary*)Arguments;


+(NSDictionary*)publicHead;

@end

NS_ASSUME_NONNULL_END
