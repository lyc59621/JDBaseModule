//
//  JDMacros.h
//  JDBaseModule
//
//  Created by JDragon on 2018/9/17.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#import "JDScreenMacros.h"

#ifndef JDMacros_h
#define JDMacros_h



#define APPLEID @"1436457942"

//获取系统对象
#define kApplication        [UIApplication sharedApplication]
#define kAppWindow          [UIApplication sharedApplication].delegate.window
#define kAppDelegate        [[UIApplication sharedApplication] delegate]
#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]



//App版本号
#define appMPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// 当前版本
#define FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SSystemVersion          ([[UIDevice currentDevice] systemVersion])


//String 转换
#define NSStringFromInteger(value) [NSString stringWithFormat:@"%ld",(long)value]
#define NSStringFromInt(value) [NSString stringWithFormat:@"%d",value]
#define NSStringFromFloatNormal(value) [NSString stringWithFormat:@"%f",value]
#define NSStringFromFloat(value) [NSString stringWithFormat:@"%.f",value]
#define NSStringFromFloat1(value) [NSString stringWithFormat:@"%.1f",value]
#define NSStringFromFloat2(value) [NSString stringWithFormat:@"%.2f",value]

// 是否大于IOS9
#define isIOS9                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=9.0)
// 是否大于IOS10
#define isIOS10                 ([[[UIDevice currentDevice]systemVersion]floatValue] >=10.0)
// 是否大于IOS11
#define isIOS11                 ([[[UIDevice currentDevice]systemVersion]floatValue] >=11.0)


// NavigationBar的高度
#define kNavBarHAbove      (CGFloat)(IS_IPHONEX?(88):(64))

// 是否为iPhone X
//#define IS_IPHONEX           (([[UIScreen mainScreen] bounds].size.height - 812) ? NO : YES)
#define IS_IPHONEX_Max       (([[UIScreen mainScreen] bounds].size.height - 896) ? NO : YES)

#define IS_IPHONEX_All   IS_IPHONEX==YES||IS_IPHONEX_Max==YES?YES:NO

// 是否IS_IPHONEX_All
#define IS_IPHONEX    (kMainScreenHeight == 812 || kMainScreenWidth == 812||kMainScreenHeight == 896 || kMainScreenWidth == 896)


// 沙盒缓存路径
#define kCachesPath        [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, true) firstObject]


// 是否iPad
#define isiPad                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define UNICODETOUTF16(x) (((((x - 0x10000) >>10) | 0xD800) << 16)  | (((x-0x10000)&3FF) | 0xDC00))
#define MULITTHREEBYTEUTF16TOUNICODE(x,y) (((((x ^ 0xD800) << 2) | ((y ^ 0xDC00) >> 8)) << 8) | ((y ^ 0xDC00) & 0xFF)) + 0x10000



//获取当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//获取图片资源
#define ImageWithFile(_pointer) [UIImage imageWithContentsOfFile:([[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@%dx", _pointer, (int)[UIScreen mainScreen].nativeScale] ofType:@"png"])]
#define IMAGE(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

#define MovieholderImg  [UIImage imageNamed:@""]
#define MovieholderImgH [UIImage imageNamed:@""]
#define AvatorHolderImg [UIImage imageNamed:@""]
#define UserHeadHolderImg [UIImage imageNamed:@"imgHeadshotNull"]
#define UserHeadWelcomeImg [UIImage imageNamed:@"imgNoticeRoom"]


#define ImageMoviePloher  @""

//Library/Caches 文件路径
#define FilePath ([[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil])
//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

// 用户偏好设置取值
#define kGetUserDefaults(key)         [[NSUserDefaults standardUserDefaults] valueForKey:key]

// 用户偏好设置存值
#define kSetUserDefaults(key, value)  [[NSUserDefaults standardUserDefaults] setValue:value forKey:key]


//由角度转换弧度
#define kDegreesToRadian(x)      (M_PI * (x) / 180.0)
//由弧度转换角度
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)

//获取一段时间间隔
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime   NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)



// 懒加载
#define JD_LAZY(object, assignment) (object = object ?: assignment)


//在Main线程上运行
#define DISPATCH_ON_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//主线程上Demo
//DISPATCH_ON_MAIN_THREAD(^{
//更新UI
//})

//在Global Queue上运行
#define DISPATCH_ON_GLOBAL_QUEUE_HIGH(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_DEFAULT(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_LOW(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_BACKGROUND(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), globalQueueBlocl);

//Global Queue
//DISPATCH_ON_GLOBAL_QUEUE_DEFAULT(^{
//异步耗时任务
//})


//弱引用/强引用  可配对引用在外面用MPWeakSelf(self)，block用MPStrongSelf(self)  也可以单独引用在外面用MPWeakSelf(self) block里面用weakself
#define MPWeakSelf(type)  __weak typeof(type) weak##type = type;
#define MPStrongSelf(type)  __strong typeof(type) type = weak##type;
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


#define weakify(...) \
ext_keywordify \
metamacro_foreach_cxt(ext_weakify_,, __weak, __VA_ARGS__)
#define strongify(...) \
ext_keywordify \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
metamacro_foreach(ext_strongify_,, __VA_ARGS__) \
_Pragma("clang diagnostic pop")



//上传图片相关
#define kImageCollectionCell_Width floorf((Main_Screen_Width - 10*2- 10*3)/3)
//最大的上传图片张数
#define kupdateMaximumNumberOfImage 12


//打印当前方法名
#define ITTDPRINTMETHODNAME() ITTDPRINT(@"%s", __PRETTY_FUNCTION__)


//extern int ddLogLevel;
//
//int ddLogLevel =
//#ifdef DEBUG
//LOG_LEVEL_VERBOSE;
//#else
//LOG_LEVEL_ERROR;
//#endif


//单例化一个类
#define SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

// 时间线布局相关
#define kTimelineCellMargin    13.0f
#define kTimelineCellPadding   8.0f        

#endif /* JDMacros_h */
