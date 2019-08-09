#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "JDNetApiManager.h"
#import "JDNetNotificationManager.h"
#import "JDNetRequest.h"
#import "JDNetResponse.h"
#import "JDNetworkManager.h"

FOUNDATION_EXPORT double JDNetWorkManagerVersionNumber;
FOUNDATION_EXPORT const unsigned char JDNetWorkManagerVersionString[];

