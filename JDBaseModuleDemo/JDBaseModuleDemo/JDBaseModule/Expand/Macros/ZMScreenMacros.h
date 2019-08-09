//
//  JDScreenMacros.h
//  JDMovie
//
//  Created by JDragon on 2018/8/22.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#ifndef JDScreenMacros_h
#define JDScreenMacros_h


#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)


//不同屏幕尺寸字体适配（320，568是因为效果图为IPHONE5 如果不是则根据实际情况修改）
//#define kScreenWidthRatio  (Main_Screen_Width / 320.0)
#define kScreenWidthRatio  (kMainScreenWidth / 360.0)
#define kScreenHeightRatio (kMainScreenHeight / 568.0)
#define KAdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define KAdaptedHeight(x) ceilf((x) * kScreenHeightRatio)

//safeArea Top  适配
#define KSafeAreaLayoutRatio(x)  isIOS11?(x-64):x


//获取屏幕宽高
#define kMainScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define kMainScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kMainScreen_Bounds [UIScreen mainScreen].bounds


/// 高度系数 812.0 是iPhoneX的高度尺寸，667.0表示是iPhone 8 的高度，如果你觉的它会变化，那我也很无奈
#define kHeightCoefficient (kMainScreenWidth == 812.0 ? 667.0/667.0 : kMainScreenHeight/667.0)


//获取View的属性
#define GetViewWidth(view)  view.frame.size.width
#define GetViewHeight(view) view.frame.size.height
#define GetViewX(view)      view.frame.origin.x
#define GetViewY(view)      view.frame.origin.y





#endif /* JDScreenMacros_h */
