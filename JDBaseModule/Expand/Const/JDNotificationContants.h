//
//  JDNotificationContants.h
//  JDBaseModuleDemo
//
//  Created by JDragon on 2019/8/9.
//  Copyright © 2019 JDragon. All rights reserved.
//

#ifndef JDNotificationContants_h
#define JDNotificationContants_h


//发送通知
#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];



#pragma mark - ——————— 网络状态相关 ————————

//网络状态变化
#define KNotificationNetWorkStateChange @"KNotificationNetWorkStateChange"

#pragma mark - ——————— 用户相关 ————————
//登录状态改变通知
#define KNotificationLoginStateChange @"loginStateChange"

//自动登录成功
#define KNotificationAutoLoginSuccess @"KNotificationAutoLoginSuccess"

//被踢下线
#define KNotificationOnKick @"KNotificationOnKick"

//用户信息缓存 名称
#define KUserCacheName @"KUserCacheName"

//用户model缓存
#define KUserModelCache @"KUserModelCache"


//用户setting model缓存
#define KUserSettingModelCache @"KUserSettingModelCache"



#pragma mark - ———————  分享 ————————

// tabbar点击后发送通知
#define KNotificationShareActionKey @"KNotificationShareActionKey"


#endif /* JDNotificationContants_h */
