//
//  JDTargetConfigMacros.h
//  JDBaseModule
//
//  Created by JDragon on 2018/9/17.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#ifndef JDTargetConfigMacros_h
#define JDTargetConfigMacros_h


//
//#if PRODUCT  //产品环境
//
////输出转换成DDLog
//#define NSLog(...) DDLogVerbose(__VA_ARGS__)
//#define Log(...) DDLogVerbose(__VA_ARGS__)
//
//#else   //其它环境
//
////输出转换成DDLog
//#define NSLog(...) DDLogVerbose(__VA_ARGS__)
//#define Log(...) DDLogVerbose(__VA_ARGS__)
//
//#endif



//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

#import "CocoaLumberjack.h"

#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelError;
#endif



#endif /* JDTargetConfigMacros_h */
