//
//  JDBaseNavigationController.m
//  JDBaseModule
//
//  Created by JDragon on 2018/9/17.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#import "JDBaseNavigationController.h"
#import "JDColorMacros.h"
#import "JDFontMacros.h"
#import "YYKit.h"


@interface JDBaseNavigationController ()

@end

@implementation JDBaseNavigationController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    self.view.shiftHeightAsDodgeViewForMLInputDodger = 50.0f;
//    [self.view registerAsDodgeViewForMLInputDodgerWithOriginalY:self.view.frame.origin.y];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [JDBaseNavigationController initialize];
//    [self setNavigationBarAction];
}
+ (void)initialize
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setTranslucent:NO];
    [navBar setHidden:NO];
    //导航栏主题 title文字属性
    [navBar setTintColor:KNavBgFontColor];
    //这里有问题
//    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName :KNavBgFontColor,
//                                     NSFontAttributeName : KJD_FONT_Regular(18)}];
    
    //设置bar+statusbar背景颜色
//     [navBar setBarTintColor:KNavBarColor];
//    导航栏背景图
    [navBar setBackgroundImage:[UIImage imageWithColor:KNavBarColor] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    //去掉阴影线
    [navBar setShadowImage:[UIImage new]];
    
//    [navBar lt_setBackgroundColor:KNavBarColor];
}
-(void)setNavigationBarAction
{
    
    //导航栏主题 title文字属性
//    [self.navigationBar setBarTintColor:KNavBarColor];
//    [self.navigationBar setTintColor:KNavBgFontColor];
//    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :KNavBgFontColor, NSFontAttributeName : KJD_FONT_Medium(18)}];
//    [self.navigationBar setShadowImage:[UIImage new]];//去掉阴影线

//    [self.navigationBar lt_setBackgroundColor:KNavBarColor];
//    [self.navigationBar jk_setBackgroundColor:KNavBarColor];
    
    
//    [TSMessage setDefaultViewController]

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        //第二级则隐藏底部Tab
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
/**
 设置状态栏背景颜色
 
 @param color 设置颜色
 */
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)shouldForceEnableInteractivePopGestureRecognizer
{
    return true;
}
@end
