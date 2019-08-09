//
//  JDBaseViewController.m
//  JDBaseModuleDemo
//
//  Created by JDragon on 2019/8/9.
//  Copyright © 2019 JDragon. All rights reserved.
//

#import "JDBaseViewController.h"
#import "JDBaseWhitePage.h"
#import "JDBaseModuleHeader.h"
//#import "TSMessage+JDHelp.h"


@interface JDBaseViewController ()<QMUIKeyboardManagerDelegate>
{
    CGFloat navigationY;
    CGFloat navBarY;
    CGFloat verticalY;
    BOOL _isShowMenu;
}
@property  CGFloat original_height;
@property (nonatomic,weak) YYReachability *hostReach;
@property (nonatomic,strong) UIBarButtonItem *backItem;
//@property (nonatomic,copy) NSDictionary *arguments;
@property(nonatomic, strong) QMUIKeyboardManager *keyboardManager;
@property(nonatomic, strong) UITapGestureRecognizer  *qmuiKeyboardTap;
@end
@implementation JDBaseViewController

-(UIBarButtonItem *)backItem
{
    if (_backItem==nil) {
        
//        UIImage  *backImage = IMAGE(@"icBackNavWhite");
        UIImage *backImage = [[UIImage imageNamed:@"icBackNavWhite"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _backItem = [[UIBarButtonItem  alloc]initWithImage:backImage style:UIBarButtonItemStylePlain target:self action:@selector(dissMiss:)];
    }
    return _backItem ;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self keyBoardManagerConfig];
//    [TSMessage dismissActiveNotification];
    Class   class  = NSClassFromString(@"TSMessage");
    [class performSelector:@selector(dismissActiveNotification) withObject:@""];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.page = 1;
    self.view.backgroundColor = KBaseViewBgColor;
    self.extendedLayoutIncludesOpaqueBars=YES;
    if (self.navigationController.viewControllers.count > 1) {
        [self showLeftNaigationBtn];
        self.rt_disableInteractivePop = NO;
    }else
    {
        self.rt_disableInteractivePop = YES;
    }
    [self setUIConfig];
//    [self configNetWorkStateAction];
    self.keyboardManager = [[QMUIKeyboardManager alloc] initWithDelegate:self];
    // 设置键盘只接受 self.textView 的通知事件，如果当前界面有其他 UIResponder 导致键盘产生通知事件，则不会被接受
//    [self.keyboardManager addTargetResponder:self.view];
//    self.keyboardManager.delegateEnabled = YES;
    if ([self showNavSeparatorColorAction]) {
        [self.navigationController.navigationBar setShadowImage:[UIImage qmui_imageWithColor:HEXCOLOR(0x323436) size:CGSizeMake(0.5, 0.5) cornerRadius:0]];
    }
    [self setNavigationBarConfig];
}
-(void)setNavigationBarConfig
{
    [self.navigationController.navigationBar  setTintColor:KNavBgFontColor];
    [self.navigationController.navigationBar  setTitleTextAttributes:@{NSForegroundColorAttributeName :KNavBgFontColor,NSFontAttributeName : KJD_FONT_Regular(18)}];
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithColor:KNavBarColor] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    self.view.backgroundColor = KBaseViewBgColor;
}
/**
 *  键盘已经显示
 */
- (void)keyboardWillShowWithUserInfo:(QMUIKeyboardUserInfo *)keyboardUserInfo
{
    return;
    if (!self.qmuiKeyboardTap.view) {
        self.qmuiKeyboardTap = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            [self.view endEditing:true];
            [self.navigationController.view endEditing:true];
            
        }];
        [self.view addGestureRecognizer:self.qmuiKeyboardTap];
    }
}

/**
 *  键盘已经隐藏
 */
- (void)keyboardWillHideWithUserInfo:(QMUIKeyboardUserInfo *)keyboardUserInfo
{
     return;
    if (self.qmuiKeyboardTap.view) {
        [self.view removeGestureRecognizer:self.qmuiKeyboardTap];
    }
}
//子类去实现
-(void)setUIConfig
{
    
}
//子类实现
-(void)getDataInfo
{
    
}
- (BOOL)prefersStatusBarHidden
{
    return false;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(BOOL)showNavSeparatorColorAction
{
    return false;
}
//- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
//    return UIStatusBarAnimationNone;
//}
- (BOOL)shouldHideKeyboardWhenTouchInView:(UIView *)view {
    // 表示点击空白区域都会降下键盘
    return YES;
}

- (void)showLeftNaigationBtn {
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:[UIButton buttonWithType:UIButtonTypeCustom]];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
//    negativeSpacer.width = -10;
    if (self.backItem == nil) {
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:[UIButton buttonWithType:UIButtonTypeCustom]];
        self.navigationItem.leftBarButtonItems = @[item, item1];
    }else {
        self.navigationItem.leftBarButtonItems = @[self.backItem, item1];
    }
}
-(void)dissMiss:(id)btn
{
    [self.view endEditing:YES];
        for (UIViewController *child in self.childViewControllers) {
        [child removeFromParentViewController];
    }
    if (self.navigationController.viewControllers.count<=1&&self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark - 添加barButton
- (void)addItemWithImageName:(NSString *)imageName
                      action:(SEL)sel
                      isLeft:(BOOL)location {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    button.frame = CGRectMake(0, 0, image.size.width<40?40:image.size.width, image.size.height);
    [button setImage:image forState:UIControlStateNormal];
    //    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:sel  forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (location) {
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//(需要何值请参看API文档)
        
        self.navigationItem.leftBarButtonItem = barBtn;
        //        self.navigationItem.backBarButtonItem = barBtn;
    }else {
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;//(需要何值请参看API文档)
        if([imageName isEqualToString:@"icSearchWhite"])
        {
            return;
        }
        self.navigationItem.rightBarButtonItem = barBtn;
    }
}
#pragma mark - 添加barButton
- (void)addItemWithImageName:(NSString *)imageName
                       title:(NSString *)title
                      action:(SEL)sel
                      isLeft:(BOOL)location {
    
    QMUIButton *button = [QMUIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:HEXCOLOR(0xffffff) forState:UIControlStateNormal];
    button.titleLabel.font = KJD_FONT_Medium(15);
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    button.imagePosition = QMUIButtonImagePositionRight;
    button.frame = CGRectMake(0, 0, image.size.width + title.length*15 , 40);
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:sel  forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (location) {
        self.navigationItem.leftBarButtonItem = barBtn;
        //        self.navigationItem.backBarButtonItem = barBtn;
    }else {
        self.navigationItem.rightBarButtonItem = barBtn;
    }
}
- (void)addItemWithBlockTitle:(NSString *)titleStr
                       action:(SEL)sel
                       isLeft:(BOOL)location
{
    QMUIButton *button = [QMUIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:titleStr forState:UIControlStateNormal];
    [button setTitleColor:HEXCOLOR(0x2a2a2a) forState:UIControlStateNormal];
    button.frame = CGRectMake(18, 0, titleStr.length*17, 30);
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    [button addTarget:self action:sel  forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    if (location) {
        self.navigationItem.leftBarButtonItem = barBtn;
        //        self.navigationItem.backBarButtonItem = barBtn;
    }else {
        self.navigationItem.rightBarButtonItem = barBtn;
    }
}
//添加UINavigationBar的左/右button -- 添加的是文字
- (void)addItemWithTitle:(NSString *)titleStr
                  action:(SEL)sel
                  isLeft:(BOOL)location {
    QMUIButton *button = [QMUIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:titleStr forState:UIControlStateNormal];
    [button setTitleColor:HEXCOLOR(0xe8e8e8) forState:UIControlStateNormal];
    button.frame = CGRectMake(18, 0, titleStr.length*17, 30);
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    [button addTarget:self action:sel  forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (self.superclass ==[JDBaseWhitePage class] ) {
        UIColor  *color = [self barButtonTextColor];
        [button setTitleColor:color?color:location?HEXCOLOR(0x2a2a2a):HEXCOLOR(0x4a90e2) forState:UIControlStateNormal];
    }
    if (location) {
        self.navigationItem.leftBarButtonItem = barBtn;
        //        self.navigationItem.backBarButtonItem = barBtn;
    }else {
        [button setTitleColor:HEXCOLOR(0xbe3f8b) forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem = barBtn;
    }
}

- (void)addItemWIthImageArray:(NSArray *)imageNames
                       actOne:(SEL)selOne
                       actTwo:(SEL)selTwo
                       isLeft:(BOOL)location {
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < imageNames.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:imageNames[i]];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        button.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        [button setImage:image forState:UIControlStateNormal];
        //    button.backgroundColor = [UIColor yellowColor];
        [button addTarget:self action:i == 0 ? selOne : selTwo forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
        [mArray addObject:barBtn];
    }
    
    if (location) {
        self.navigationItem.leftBarButtonItems = mArray;
        //        self.navigationItem.backBarButtonItem = barBtn;
    }else {
        self.navigationItem.rightBarButtonItems = mArray;
    }
}
-(UIColor*)barButtonTextColor
{
    return nil;
}

#pragma mark --- init Arguments;
+(instancetype)instanceWithArguments:(NSDictionary*)arguments
{
    JDBaseViewController  *VC  = [[self class] new];
    VC.JDArguments = arguments;
    return VC;
}
#pragma mark --- NibNew
+(instancetype)nibInstanceWithArguments:(NSDictionary*)arguments
{
    JDBaseViewController  *VC  = [[[self class] alloc]initWithNibName:NSStringFromClass(self) bundle:nil];
    VC.JDArguments = arguments;
    return VC;
}
#pragma mark --- NORMAl
-(void)set_Title:(NSMutableAttributedString *)title
{
    UILabel *navTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 44)];
    navTitleLabel.numberOfLines=0;//可能出现多行的标题
    [navTitleLabel setAttributedText:title];
    navTitleLabel.textAlignment = NSTextAlignmentCenter;
    navTitleLabel.backgroundColor = [UIColor clearColor];
    navTitleLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleClick:)];
    [navTitleLabel addGestureRecognizer:tap];
    self.navigationItem.titleView = navTitleLabel;
}
-(void)titleClick:(UIGestureRecognizer*)Tap
{
    UIView *view = Tap.view;
    if ([self respondsToSelector:@selector(title_click_event:)]) {
//        [self title_click_event:view];
    }
}
-(void)changeNavigationBarHeight:(CGFloat)offset
{
    [UIView animateWithDuration:0.3f animations:^{
        self.navigationController.navigationBar.frame  = CGRectMake(
                                                                    self.navigationController.navigationBar.frame.origin.x,
                                                                    navigationY,
                                                                    self.navigationController.navigationBar.frame.size.width,
                                                                    offset
    );
    }];
    
}
-(void)changeNavigationBarTranslationY:(CGFloat)translationY
{
    self.navigationController.navigationBar.transform = CGAffineTransformMakeTranslation(0, translationY);
}

//找查到Nav底部的黑线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}
#pragma mark --- keyboard Manager-------
-(void)keyBoardManagerConfig
{
//    [[MLInputDodger dodger]  registerDodgeView:self.view];
//    self.view.shiftHeightAsDodgeViewForMLInputDodger = 50.0f;
//    [self.view registerAsDodgeViewForMLInputDodgerWithOriginalY:self.view.frame.origin.y];
//    self.view.dontUseDefaultRetractViewAsDodgeViewForMLInputDodger = NO; //for all subviews of self.view
//    self.view.dontUseDefaultRetractViewAsFirstResponderForMLInputDodger = NO;
//    self.view.shiftHeightAsDodgeViewForMLInputDodger = 50.0f;
//    [self.navigationController.view registerAsDodgeViewForMLInputDodgerWithOriginalY:self.view.frame.origin.y];
}
#pragma mark --- 监听网络变化
//监听网络变化
-(void)configNetWorkStateAction
{

    [YYReachability reachability].notifyBlock = ^(YYReachability * _Nonnull reachability) {
        
        switch (reachability.status) {
            case 0:
            {
                Class   class  = NSClassFromString(@"MBProgressHUD");
                [class performSelector:@selector(showTipMessageInView:) withObject:@"请检查网络连接"];
            }
                break;
            case 1:
                DDLogVerbose(@"WWAN");
                break;
            case 2:
                DDLogVerbose(@"wifi");
                break;
            default:
                break;
        }
    };
}


#pragma mark --- 获取当前Window试图---------
//获取当前屏幕显示的viewcontroller
+(UIViewController*)JDCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到它
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    id nextResponder = nil;
    UIViewController *appRootVC = window.rootViewController;
    //1、通过present弹出VC，appRootVC.presentedViewController不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        //2、通过navigationcontroller弹出VC
//        NSLog(@"subviews == %@",[window subviews]);
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    return nextResponder;
}

+(UINavigationController*)JDCurrentNaVC
{
    
    UIViewController  *viewVC = (UIViewController*)[ self JDCurrentWindowVC ];
    UINavigationController  *naVC;
    if ([viewVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController  *tabbar = (UITabBarController*)viewVC;
        naVC = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        if (naVC.presentedViewController) {
            while (naVC.presentedViewController) {
                naVC = (UINavigationController*)naVC.presentedViewController;
            }
        }
    }else
        if ([viewVC isKindOfClass:[UINavigationController class]]) {
            
            naVC  = (UINavigationController*)viewVC;
            if (naVC.presentedViewController) {
                while (naVC.presentedViewController) {
                    naVC = (UINavigationController*)naVC.presentedViewController;
                }
            }
        }else
            if ([viewVC isKindOfClass:[UIViewController class]])
            {
                if (viewVC.navigationController) {
                    return viewVC.navigationController;
                }
                return  viewVC;
            }
    return naVC;
}
+(UIViewController*)JDCurrentUiVC
{
    UIViewController   *cc;
    UINavigationController  *na = (UINavigationController*)[[self class] JDCurrentNaVC];
    if ([na isKindOfClass:[UINavigationController class]]) {
        cc =  na.viewControllers.lastObject;
        
        if (cc.childViewControllers.count>0) {
            
            cc = [[self class] getSubUIVCWithVC:cc];
        }
    }else
    {
        cc = (UIViewController*)na;
    }
    return cc;
}
+(UIViewController *)getSubUIVCWithVC:(UIViewController*)vc
{
    UIViewController   *cc;
    cc =  vc.childViewControllers.lastObject;
    if (cc.childViewControllers>0) {

        return cc.childViewControllers.lastObject;
    }else
    {
        return cc;
    }
    return cc;
}


+(void)showTipLibMessage:(NSString *)msg {
    //    CGFloat padding = 10;
    //
    //    YYLabel *label = [YYLabel new];
    //    label.text = msg;
    //    label.font = [UIFont systemFontOfSize:16];
    //    label.textAlignment = NSTextAlignmentCenter;
    //    label.textColor = [UIColor whiteColor];
    //    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:0.730];
    //    label.width = kMainScreenWidth;
    //    label.jk_top = 0;
    //    label.textContainerInset = UIEdgeInsetsMake(padding, padding, padding, padding);
    //    label.height = [msg heightForFont:label.font width:label.jk_width] + 2 * padding;
    //
    //    [[self JDCurrentUiVC].view addSubview:label];
    //
    //    [UIView animateWithDuration:0.3 animations:^{
    //        label.top = (kiOS7Later ? kTopHeight : 0);
    //    } completion:^(BOOL finished) {
    //        [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
    //            label.bottom = (kiOS7Later ? kTopHeight : 0);
    //        } completion:^(BOOL finished) {
    //            [label removeFromSuperview];
    //        }];
    //    }];
}
+(void)showMessage:(NSString *)msg {

//    [TSMessage showInfoMessageWithMsg:msg];
    Class   class  = NSClassFromString(@"TSMessage");
    [class performSelector:@selector(showInfoMessageWithMsg:) withObject:msg];
}

-(void)dealloc
{
    //移除通知
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
