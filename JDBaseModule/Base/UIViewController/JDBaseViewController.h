//
//  JDBaseViewController.h
//  JDBaseModule
//
//  Created by JDragon on 2018/9/17.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QMUIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface JDBaseViewController : QMUICommonViewController




/**
 传值 Arguments
 */
@property (nonatomic,copy) NSDictionary *JDArguments;
@property (nonatomic,assign) NSInteger   page;


/**
 *  添加UINavigationBar的左/右button   -- 添加的是图片
 *
 *  @param imageName <#imageName description#>
 *  @param sel       <#sel description#>
 *  @param location  <#location description#>
 */
- (void)addItemWithImageName:(NSString *)imageName
                      action:(SEL)sel
                      isLeft:(BOOL)location;

- (void)addItemWithBlockTitle:(NSString *)titleStr
                  action:(SEL)sel
                  isLeft:(BOOL)location;
/**
 *  添加UINavigationBar的左/右button -- 添加的是文字
 *
 *  @param titleStr <#titleStr description#>
 *  @param sel      <#sel description#>
 *  @param location <#location description#>
 */
- (void)addItemWithTitle:(NSString *)titleStr
                  action:(SEL)sel
                  isLeft:(BOOL)location;



/**
 *  添加UINavigationBar的左/右button -- 文字 加图片
 *
 *  @param imageName <#imageName description#>
 *  @param title     <#title description#>
 *  @param sel       <#sel description#>
 *  @param location  <#location description#>
 */
- (void)addItemWithImageName:(NSString *)imageName
                       title:(NSString *)title
                      action:(SEL)sel
                      isLeft:(BOOL)location;

/**
 添加UINavigationBars。两个

 @param imageNames <#imageNames description#>
 @param selOne <#selOne description#>
 @param selTwo <#selTwo description#>
 @param location <#location description#>
 */
- (void)addItemWIthImageArray:(NSArray *)imageNames
                       actOne:(SEL)selOne
                       actTwo:(SEL)selTwo
                       isLeft:(BOOL)location;



//-(UIBarButtonItem *)backItem;
/**
 DissMiss 事件

 @param btn btn
 */
-(void)dissMiss:(id)btn;


//子类去实现
-(void)setUIConfig;


-(void)getDataInfo;


///**
//  获取Argument
//
// @return @{}
// */
//-(NSDictionary*)JDArgument;



/**
 <#Description#>

 @param translationY <#translationY description#>
 */
-(void)changeNavigationBarTranslationY:(CGFloat)translationY;



/**
 初始化

 @param arguments 接受arguments
 @return VC
 */
+(instancetype)instanceWithArguments:(NSDictionary*)arguments;



/**
 XIB init

 @param arguments 接受arguments
 @return VC
 */
+(instancetype)nibInstanceWithArguments:(NSDictionary*)arguments;;


/**
 当前WindowVC

 @return UIViewController
 */
+(UIViewController*)JDCurrentWindowVC;

/**
 当前WindowVC NaVC
 
 @return UINavigationController
 */
+(UINavigationController*)JDCurrentNaVC;

/**
 当前WindowVC ViewVC
 
 @return UIViewController
 */
+(UIViewController*)JDCurrentUiVC;

//debug  现实msg

/**
 debug  显示msg

 @param msg NSString
 */
+(void)showMessage:(NSString *)msg;


-(BOOL)showNavSeparatorColorAction;

@end

NS_ASSUME_NONNULL_END
