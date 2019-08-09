//
//  JDBaseTableView.m
//  JDBaseModuleDemo
//
//  Created by JDragon on 2019/8/9.
//  Copyright © 2019 JDragon. All rights reserved.
//

#import "JDBaseTableView.h"

@implementation JDBaseTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        
        [self setUIConfig];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setUIConfig];
    }
    return self;
}
-(void)setUIConfig
{
//    self.delaysContentTouches = NO;
    self.delaysContentTouches = YES;
    self.canCancelContentTouches = YES;
    self.estimatedRowHeight = 41;
    self.rowHeight = UITableViewAutomaticDimension;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.backgroundColor = [UIColor clearColor];
    if (@available(iOS 11.0, *)) {
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
    }
    self.tableHeaderView = [UIView new];
    self.tableFooterView = [UIView new];
    //    UIView *wrapView = self.subviews.firstObject;
    //
    //    if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
    //        for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
    //
    //            if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"] ) {
    //                gesture.enabled = NO;
    //                break;
    //            }
    //        }
    //    }
    //    if (@available(iOS 11.0, *)){
    //
    //        self.estimatedRowHeight = 0;
    //        self.estimatedSectionHeaderHeight = 0;
    //        self.estimatedSectionFooterHeight = 0;
    //    }
}
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    if (self.tableHeaderView && CGRectContainsPoint(self.tableHeaderView.frame, point)) {
//        return NO;
//    }
//    return [super pointInside:point withEvent:event];
//}

//- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
//    if ( [view isKindOfClass:[UIControl class]]) {
//        return YES;
//    }
//    return [super touchesShouldCancelInContentView:view];
//}
/// 是否支持多手势触发，返回YES，则可以多个手势一起触发方法，返回NO则为互斥
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return YES;
//}

@end
