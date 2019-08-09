//
//  SMKViewProtocol.h
//  SUIMVVMDemo
//
//  Created by yuantao on 16/3/5.
//  Copyright © 2016年 lovemo. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol SMKViewProtocol <NSObject>

@optional

/**
 *  将view中的事件通过代理传递出去
 *
 *  @param view   view自己
 *  @param events 所触发事件的一些描述信息
 */
- (void)smk_view:(__kindof UIView *)view withEvents:(NSDictionary *)events;


@end

