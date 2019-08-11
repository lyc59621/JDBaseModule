//
//  JDURLMacros.h
//  JDBaseModule
//
//  Created by JDragon on 2018/9/17.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#ifndef JDURLMacros_h
#define JDURLMacros_h

/**
 网络监听地址
 
 @return 网络监听地址URL
 */
#define kURL_Reachability_Address @"http://www.baidu.com"


#define K_URL(_STR_) [NSURL URLWithString:_STR_]


//api 接口类型 控制

/**Mock开发服务器*/
#define URL_API_BASE_URI_Mock @"http://rap2api.taobao.org/app"

/**开发服务器*/
#define URL_API_BASE_URI_Dev @"https://app.JDmovie.com/"

/**测试服务器*/
#define URL_API_BASE_URI_TesT @"https://app.JDmovie.com/"

/**生产服务器*/
#define URL_API_BASE_URI_Product @"https://app.JDmovie.com/"


#define KURL_Base_m @""
//url API
#define KURL_Base_Api @""
//内部版本号 每次发版递增
#define KURL_Base_Version @""





#pragma mark - ——————— 详细接口地址 ————————


#define URL_Plaza_Location_Around   @"location/around" //定位


#endif /* JDURLMacros_h */
