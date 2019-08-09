//
//  JDUserMacros.h
//  JDMovie
//
//  Created by JDragon on 2018/8/21.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#ifndef JDUserMacros_h
#define JDUserMacros_h


#define kUserAuthToken @"authToken"


#define KIsLogin [JDUserManager sharedJDUserManager].isLogined
#define kCurrentUser [JDUserManager sharedJDUserManager].curUserInfo
#define kUserManager [JDUserManager sharedJDUserManager]

//带参数macro

#define kGetSafeUserAuthToken  kGetUserAuthToken?kGetUserAuthToken:@""


#define kGetUserAuthToken [[NSUserDefaults standardUserDefaults] objectForKey:kUserAuthToken]
#define kGetUserMobile [[NSUserDefaults standardUserDefaults] objectForKey:@"userMobile"]
#define kGetUserMobileCode [[NSUserDefaults standardUserDefaults] objectForKey:@"mobileCode"]



#define kSaveUserAuthToken(authToken,mobile,phoneCode) \
[[NSUserDefaults standardUserDefaults] setObject:authToken forKey:kUserAuthToken]; \
[[NSUserDefaults standardUserDefaults] setObject:mobile forKey:@"userMobile"]; \
[[NSUserDefaults standardUserDefaults] setObject:phoneCode forKey:@"mobileCode"]; \
[[NSUserDefaults standardUserDefaults] synchronize]
//#define kSaveUserMoible(phone) \
//[[NSUserDefaults standardUserDefaults] setObject:phone forKey:@"userMoible"]; \
//[[NSUserDefaults standardUserDefaults] synchronize]

//#define kSaveUserMoibleCode(phoneCode) \
//[[NSUserDefaults standardUserDefaults] setObject:phone forKey:@"MoibleCode"]; \
//[[NSUserDefaults standardUserDefaults] synchronize]



#define kRemoveUserAuthToken \
[[NSUserDefaults standardUserDefaults] removeObjectForKey:kUserAuthToken];\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userMobile"];\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"mobileCode"];\
[[NSUserDefaults standardUserDefaults] synchronize]






#endif /* JDUserMacros_h */
