//
//  JDThirdMacros.h
//  JDMovie
//
//  Created by Shen Su on 2018/8/14.
//  Copyright © 2018 JDragon. All rights reserved.
//

#ifndef JDThirdMacros_h
#define JDThirdMacros_h

//百度地图SDK的Key
#define  kBaiduMapKey @""

//友盟统计SDK的key
#define kUmengKey @""

//友盟分享
//--微信
#define kSocial_WX_ID @""
#define kSocial_WX_Secret @""
#define kSocial_WX_Url @"http://www.umeng.com/social"
//--QQ
#define kSocial_QQ_ID  @""
#define kSocial_QQ_Secret @""
#define kSocial_QQ_Url @"http://www.umeng.com/social"
//--新浪微博
#define kSocial_Sina_Account @""
#define kSocial_Sina_RedirectURL @"http://sns.whalecloud.com/sina2/callback"


// Bugly
//#define KBuglyID          @"9538e08a3c"
#ifdef DEBUG
#define KBuglyID    @"9538e08a3c"
#else
#define KBuglyID    @"3e1accff05"
#endif

//JSPatch中JS的路径  路径可以增加一个版本的文件夹用来区分不同的版本 （这个文件夹可以APP版本号为区分http://test.qshmall.net:9090/v111/demo.js  版本号(去掉中间的点)宏appMPVersion）
#define kJSPatchServerPath @""


//#define EaseMobAppKey @"1179180709228524#JDmovie"
//#define EaseMobAppDevKey @"1101180810228457#JDmoviedev"
#ifdef DEBUG
#define kAPNSCertName    @"dev_push"
#define kEaseMobAppKey   @"1101180810228457#JDmoviedev"
#else
#define kAPNSCertName    @"dis_push"
#define kEaseMobAppKey   @"1101180810228457#JDmovie"
#endif

#endif /* JDThirdMacros_h */
