//
//  JDNotificationContants.h
//  JDMovie
//
//  Created by Shen Su on 2018/8/14.
//  Copyright © 2018 JDragon. All rights reserved.
//

#ifndef JDNotificationContants_h
#define JDNotificationContants_h


//发送通知
#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];



#pragma mark - ——————— 网络状态相关 ————————

//网络状态变化
#define KNotificationNetWorkStateChange @"KNotificationNetWorkStateChange"

#pragma mark - ——————— 用户相关 ————————
//登录状态改变通知
#define KNotificationLoginStateChange @"loginStateChange"

//自动登录成功
#define KNotificationAutoLoginSuccess @"KNotificationAutoLoginSuccess"

//被踢下线
#define KNotificationOnKick @"KNotificationOnKick"

//用户信息缓存 名称
#define KUserCacheName @"KUserCacheName"

//用户model缓存
#define KUserModelCache @"KUserModelCache"


//用户setting model缓存
#define KUserSettingModelCache @"KUserSettingModelCache"


// 发起约看选择影院影片后的通知
#define kAppointmentFinishedChoiceMovieAndCinemaNotificationKey  @"AppointmentFinishedChoiceMovieAndCinemaNotificationKey"

// tabbar点击后发送通知
#define KNotificationTabBarSelectIndexKey @"KNotificationTabBarSelectIndexKey"


#pragma mark - ———————  鉴赏厅 ————————

// tabbar点击后发送通知
#define KNotificationInitateLiveSuccess @"kInitateLiveNotifictionKey"

#define KNotificationLiveTabSelectKey @"KNotificationLiveTabSelectKey"


#pragma mark - ———————  约看 ————————

#define KNotificationDateTabSelecttKey @"KNotificationDateTabSelecttKey"

#pragma mark - ———————  分享 ————————

// tabbar点击后发送通知
#define KNotificationShareActionKey @"KNotificationShareActionKey"

// 创建新的约看成功后发送通知
#define kReleaseNewDatingFinishedNotificationKey    @"ReleaseNewDatingFinishedNotificationKey"

// 发送消息以及收到消息后刷新会话列表的通知名称
#define kRefreshConversationNotificationKey         @"RefreshConversationNotificationKey"

// 时间线相关
#define kTimelineCellMoreBtnClickedNotificationKey          @"TimelineCellMoreBtnClickedNotificationKey"
#define kTimelineCellChatBtnClickedNotificationKey          @"TimelineCellChatBtnClickedNotificationKey"
#define kTimelineCellRetweeteBtnClickedNotificationKey      @"TimelineCellRetweeteBtnClickedNotificationKey"
#define kTimelineCellCommentBtnClickedNotificationKey       @"TimelineCellCommentBtnClickedNotificationKey"
#define kTimelineCellLikeBtnClickedNotificationKey          @"TimelineCellLikeBtnClickedNotificationKey"

// 富文本链接的key
#define kTimelineLinkText                           @"TimelineLinkText"
#define kTimelineLinkKey                            @"TimelineLinkKey"
#define kTimelineLinkDidSelectedNotification        @"TimelineLinkDidSelectedNotification"
#endif /* JDNotificationContants_h */
