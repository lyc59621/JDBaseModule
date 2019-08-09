//
//  JDUserManager.h
//  JDBaseModuleDemo
//
//  Created by JDragon on 2019/8/9.
//  Copyright © 2019 JDragon. All rights reserved.
//

#import "JDBaseObject.h"
#import "JDUserObject.h"
#import "JDMacros.h"
#import "RACSubject.h"

typedef NS_ENUM(NSInteger, UserLoginType){
    kUserLoginTypeUnKnow = 0,//未知
    kUserLoginTypeWeChat,//微信登录
    kUserLoginTypeQQ,///QQ登录
    kUserLoginTypePwd,///账号登录
};

typedef void (^loginBlock)(BOOL success, NSString * des);


/**
 包含用户相关服务
 */
@interface JDUserManager : JDBaseObject


//单例
SINGLETON_FOR_HEADER(JDUserManager)

//当前用户
@property (nonatomic, strong) JDUserObject *curUserInfo;
@property (nonatomic, assign) UserLoginType loginType;
@property (nonatomic, assign) BOOL isLogined;

@property (nonatomic, strong)  RACSubject * subject;




#pragma mark - ——————— 登录相关 ————————

/**
 三方登录
 
 @param loginType 登录方式
 @param completion 回调
 */
-(void)login:(UserLoginType )loginType completion:(loginBlock)completion;

/**
 带参登录
 
 @param loginType 登录方式
 @param params 参数，手机和账号登录需要
 @param completion 回调
 */
-(void)login:(UserLoginType )loginType params:(NSDictionary *)params completion:(loginBlock)completion;

/**
 自动登录
 
 @param completion 回调
 */
-(void)autoLoginToServer:(loginBlock)completion;

/**
 登录成功保存获取到的用户信息
 
 @param completion 回调
 */
-(void)LoginSuccessAndSaveUserInfoObject:(id )responseObject completion:(loginBlock)completion;

/**
 判断是否存在用户信息
 
 @param
 */
-(void)verifyUserInfo;
/**
 获取最新用户信息并保存在本地
 
 @param
 */
-(void)getUserInfo;

/**
 加载缓存在本地的用户数据
 
 @return 是否成功
 */
-(BOOL)loadUserInfo;
/**
 手动存储保存信息到本地

 @param completion 手动存储保存信息
 */
-(void)saveUserInfo;

/**
 退出登录
 
 @param completion 回调
 */
- (void)logout:(loginBlock)completion;



@end
