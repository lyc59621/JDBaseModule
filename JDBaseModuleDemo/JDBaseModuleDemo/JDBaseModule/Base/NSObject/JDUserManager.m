//
//  JDUserManager.m
//  JDBaseModuleDemo
//
//  Created by JDragon on 2019/8/9.
//  Copyright © 2019 JDragon. All rights reserved.
//

#import "JDUserManager.h"
#import "JDBaseModuleHeader.h"
#import "RACSubject.h"

@implementation JDUserManager

SINGLETON_FOR_CLASS(JDUserManager);

-(instancetype)init{
    self = [super init];
    if (self) {
        //被踢下线
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onKick)
                                                     name:KNotificationOnKick
                                                   object:nil];
        _isLogined = kGetUserAuthToken?true:false;
        _subject = [RACSubject subject];
        [self loadUserInfo];
    }
    return self;
}

#pragma mark ————— 三方登录 —————
-(void)login:(UserLoginType )loginType completion:(loginBlock)completion{
    [self login:loginType params:nil completion:completion];
}
#pragma mark ————— 带参数登录 —————
-(void)login:(UserLoginType )loginType params:(NSDictionary *)params completion:(loginBlock)completion{
//    //友盟登录类型
//    UMSocialPlatformType platFormType;
//
//    if (loginType == kUserLoginTypeQQ) {
//        platFormType = UMSocialPlatformType_QQ;
//    }else if (loginType == kUserLoginTypeWeChat){
//        platFormType = UMSocialPlatformType_WechatSession;
//    }else{
//        platFormType = UMSocialPlatformType_UnKnown;
//    }
//    //第三方登录
//    if (loginType != kUserLoginTypePwd) {
//        [MBProgressHUD showActivityMessageInView:@"授权中..."];
//        [[UMSocialManager defaultManager] getUserInfoWithPlatform:platFormType currentViewController:nil completion:^(id result, NSError *error) {
//            if (error) {
//                [MBProgressHUD hideHUD];
//                if (completion) {
//                    completion(NO,error.localizedDescription);
//                }
//            } else {
//
//                UMSocialUserInfoResponse *resp = result;
//                //
//                //                // 授权信息
//                //                NSLog(@"QQ uid: %@", resp.uid);
//                //                NSLog(@"QQ openid: %@", resp.openid);
//                //                NSLog(@"QQ accessToken: %@", resp.accessToken);
//                //                NSLog(@"QQ expiration: %@", resp.expiration);
//                //
//                //                // 用户信息
//                //                NSLog(@"QQ name: %@", resp.name);
//                //                NSLog(@"QQ iconurl: %@", resp.iconurl);
//                //                NSLog(@"QQ gender: %@", resp.unionGender);
//                //
//                //                // 第三方平台SDK源数据
//                //                NSLog(@"QQ originalResponse: %@", resp.originalResponse);
//
//                //登录参数
//                NSDictionary *params = @{@"openid":resp.openid, @"nickname":resp.name, @"photo":resp.iconurl, @"sex":[resp.unionGender isEqualToString:@"男"]?@1:@2, @"cityname":resp.originalResponse[@"city"], @"fr":@(loginType)};
//
//                self.loginType = loginType;
//                //登录到服务器
//                [self loginToServer:params completion:completion];
//            }
//        }];
//    }else{
//        //账号登录 暂未提供
//    }
}

#pragma mark ————— 手动登录到服务器 —————
-(void)loginToServer:(NSDictionary *)params completion:(loginBlock)completion{
 
    
    
}
#pragma mark ————— 自动登录到服务器 —————
-(void)autoLoginToServer:(loginBlock)completion{

    
}
#pragma mark ————— 登录成功处理 —————
-(void)LoginSuccessAndSaveUserInfoObject:(id )responseObject completion:(loginBlock)completion{
    if (KValidDict(responseObject)) {
            NSDictionary *data = responseObject[@"user"];
            self.curUserInfo = [JDUserObject modelWithDictionary:data];
            self.curUserInfo.userMobile = kGetUserMobile;
            self.curUserInfo.setting = [JDUserSetObject modelWithDictionary:responseObject[@"setting"]];
            self.curUserInfo.accounts = [JDUserObject modelWithDictionary:responseObject].accounts;
            self.curUserInfo.tags = responseObject[@"tags"];
            [self saveUserInfo];
            self.isLogined = YES;
            if (completion) {
                completion(YES,nil);
            }
          KPostNotification(KNotificationLoginStateChange, @YES);
    }else{
        if (completion) {
            completion(NO,@"登录返回数据异常");
        }
//        KPostNotification(KNotificationLoginStateChange, @NO);
    }
}
#pragma mark ————— 获取用户信息 —————
-(void)getUserInfo
{
    [JDRequest startRequestWithUrl:URL_user_info withExtendArguments:@{} withCompletionBlockWithSuccess:^(__kindof JDRequest * _Nonnull request) {
        DDLogVerbose(@"%@",[NSString stringWithFormat:@"*返回的数据:\n %@",request.filtResponseObj]);
        [kUserManager LoginSuccessAndSaveUserInfoObject:request.filtResponseObj completion:^(BOOL success, NSString *des) {
            if (success) {
                DDLogVerbose(@"保存信息成功user==%@",kUserManager.curUserInfo);  
            }
        }];
    }];
}
#pragma mark ————— 储存用户信息 —————
-(void)saveUserInfo{
    if (self.curUserInfo) {
        YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
        NSDictionary *dic = [self.curUserInfo modelToJSONObject];
        NSDictionary *setDic = [self.curUserInfo.setting modelToJSONObject];
        [cache setObject:dic forKey:KUserModelCache];
        [cache setObject:setDic forKey:KUserSettingModelCache];
        [self.subject sendNext:self.curUserInfo];
    }
}
#pragma mark ————— 加载缓存的用户信息 —————
-(BOOL)loadUserInfo{
    YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
    NSDictionary * userDic = (NSDictionary *)[cache objectForKey:KUserModelCache];
    if (userDic.allKeys.count>0) {
        NSDictionary * userSetDic = (NSDictionary *)[cache objectForKey:KUserSettingModelCache];
        self.curUserInfo = [JDUserObject modelWithDictionary:userDic];
        self.curUserInfo.userMobile = kGetUserMobile;
        self.curUserInfo.setting =  [JDUserSetObject modelWithDictionary:userSetDic];
        [self.subject sendNext:self.curUserInfo];
        return YES;
    }
    return NO;
}
#pragma mark ————— 被踢下线 —————
-(void)onKick{
    [self logout:nil];
}
#pragma mark ————— 退出登录 —————
- (void)logout:(void (^)(BOOL, NSString *))completion{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [[UIApplication sharedApplication] unregisterForRemoteNotifications];
    self.curUserInfo = nil;
    self.isLogined = NO;
    [self.subject sendNext:self.curUserInfo];
    kRemoveUserAuthToken;
    //    //移除缓存
    YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
    [cache removeObjectForKey:KUserModelCache];
    [cache removeObjectForKey:KUserSettingModelCache];
    [cache removeAllObjectsWithBlock:^{
        if (completion) {
            completion(YES,nil);
        }
    }];
//    KPostNotification(KNotificationLoginStateChange, @NO);
}
#pragma mark ————— 判断是否存在用户信息，没有去拉取 —————
-(void)verifyUserInfo
{
    if(![kUserManager loadUserInfo]){
        
        [kUserManager getUserInfo];
    }else
    {
//        KPostNotification(KNotificationLoginStateChange, @YES);
    }
}
@end
