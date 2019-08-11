//
//  JDUserMacros.h
//  JDBaseModule
//
//  Created by JDragon on 2018/9/17.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#ifndef JDUserMacros_h
#define JDUserMacros_h


#define kUserAuthToken @"token"


#define KIsLogin [JDUserManager sharedJDUserManager].isLogined
#define kCurrentUser [JDUserManager sharedJDUserManager].curUserInfo
#define kUserManager [JDUserManager sharedJDUserManager]

//带参数macro

#define kGetSafeUserAuthToken  kGetUserAuthToken?kGetUserAuthToken:@""


#define kGetUserAuthToken [[NSUserDefaults standardUserDefaults] objectForKey:kUserAuthToken]
#define kGetUserID [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"]
#define kGetUserCode [[NSUserDefaults standardUserDefaults] objectForKey:@"userCode"]



#define kSaveUserAuthToken(authToken,userId,userCode) \
[[NSUserDefaults standardUserDefaults] setObject:authToken forKey:kUserAuthToken]; \
[[NSUserDefaults standardUserDefaults] setObject:userID forKey:@"userId"]; \
[[NSUserDefaults standardUserDefaults] setObject:userCode forKey:@"userCode"]; \
[[NSUserDefaults standardUserDefaults] synchronize]


//#define kSaveUserMoible(phone) \
//[[NSUserDefaults standardUserDefaults] setObject:phone forKey:@"userMoible"]; \
//[[NSUserDefaults standardUserDefaults] synchronize]

//#define kSaveUserMoibleCode(phoneCode) \
//[[NSUserDefaults standardUserDefaults] setObject:phone forKey:@"MoibleCode"]; \
//[[NSUserDefaults standardUserDefaults] synchronize]



#define kRemoveUserAuthToken \
[[NSUserDefaults standardUserDefaults] removeObjectForKey:kUserAuthToken];\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userId"];\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userCode"];\
[[NSUserDefaults standardUserDefaults] synchronize]






#endif /* JDUserMacros_h */
