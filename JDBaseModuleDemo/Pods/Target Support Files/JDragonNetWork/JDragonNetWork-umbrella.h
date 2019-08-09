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

#import "JDBaseRequest.h"
#import "JDBatchRequest.h"
#import "JDBatchRequestAgent.h"
#import "JDChainRequest.h"
#import "JDChainRequestAgent.h"
#import "JDNetwork.h"
#import "JDNetworkAgent.h"
#import "JDNetworkConfig.h"
#import "JDNetworkPrivate.h"
#import "JDRequest.h"

FOUNDATION_EXPORT double JDragonNetWorkVersionNumber;
FOUNDATION_EXPORT const unsigned char JDragonNetWorkVersionString[];

