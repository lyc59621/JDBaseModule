//
//  JDURLMacros.h
//  JDMovie
//
//  Created by Shen Su on 2018/8/15.
//  Copyright © 2018 JDragon. All rights reserved.
//

#ifndef JDURLMacros_h
#define JDURLMacros_h

/**
 网络监听地址
 
 @return 网络监听地址URL
 */
#define kURL_Reachability_Address @"http://www.baidu.com"


#define K_URL(_STR_) [NSURL URLWithString:_STR_]


//api 接口类型 控制

/**Mock开发服务器*/
#define URL_API_BASE_URI_Mock @"http://rap2api.taobao.org/app/mock/21537/"

/**开发服务器*/
#define URL_API_BASE_URI_Dev @"https://dev.JDmovie.com/"

/**测试服务器*/
#define URL_API_BASE_URI_TesT @"https://dev.JDmovie.com/"

/**生产服务器*/
#define URL_API_BASE_URI_Product @"https://app.JDmovie.com/"


#define KURL_Base_m @"m/"
//url API
#define KURL_Base_Api @"api/"
//内部版本号 每次发版递增
#define KURL_Base_Version @"v1/"





#pragma mark - ——————— 详细接口地址 ————————

#pragma mark - ——————— 详细接口地址 ————————







#pragma mark - ——————— AD 广告相关 ————————


/**
 广告
 
 @return 广告
 */
#define URL_LaunchAD @"ads/show"


#pragma mark - ——————— 首页相关 ————————


/**
 首页轮播图
 
 @return 首页轮播图
 */
#define URL_Home_column_contents @"movies/column/contents"

/**
 首页推荐
 
 @return 首页推荐
 */
#define URL_Home_recommend @"movies/recommend"
/**
 首页专栏
 
 @return 首页专栏
 */
#define URL_Home_special @"movies/special"
/**
 首页热门
 
 @return 首页热门
 */
#define URL_Home_Movies_hot @"movies/hot"

/**
 首页大家都在看
 
 @return 首页大家都在看
 */
#define URL_Home_Movies_now @"movies/now"

/**
 首页系列推荐
 
 @return 首页系列推荐
 */
#define URL_Home_Movies_relations @"movies/relations"


/**
 全部影片影片属性字段集合
 
 @return 全部影片影片属性字段集合
 */
#define URL_Home_Movies_fields @"movies/fields"

/**
 全部影片
 
 @return 全部影片页面
 */
#define URL_Home_Movies @"movies"


/**
 影片详情
 
 @return 影片详情
 */
#define URL_Home_Movies_detail @"movies/detail"


/**
 观影历史记录
 
 @return 观影记录
 */
#define URL_Home_Movies_history  @"mine/movies/history" //@"movies/mine/history"




/**
 影片列表
 
 @return 影片列表
 */
#define URL_Home_movies @"movies"


/**
 影片属性集合
 
 @return 影片属性集合
 */
#define URL_Home_movies_fields @"movies/fields"

/**
 影片详情
 
 @return 影片详情
 */
#define URL_Home_movies_details @"movies/detail"


/**
影片log 回传
 
 @return 影片log 回传
 */
#define URL_Home_movies_log @"movies/log"


/**
 影片收藏
 
 @return 影片收藏
 */
#define URL_movies_fav @"account/addToFav"//movies 变为account


#pragma mark - ——————— 搜索相关 ————————

/**
 搜索历史记录
 
 @return 搜索历史记录
 */
#define URL_Movie_Search_history @"movies/search/keywords/history"
#define URL_Room_Search_history @"live/search/keywords/history"

/**
 搜索热门搜索关键词
 
 @return 搜索热门搜索关键词
 */
#define URL_Movie_Search_hot @"movies/search/keywords/hot"
#define URL_Room_Search_hot @"live/search/keywords/hot"


/**
 搜索结果
 
 @return 搜索结果
 */
#define URL_Movie_Search_Result @"movies/search/results"
#define URL_Room_Search_Result @"live/search/results"


/**
 搜索历史删除
 
 @return 搜索历史删除
 */
#define URL_Movie_history_delete @"movies/search/history"
#define URL_Room_history_delete @"live/search/history/delete"


#pragma mark - ——————— 支付相关 ————————


/**
 订单支付
 
 @return 微信订单
 */
#define URL_pay_wechat @"pay/wechat"

/**
 订单支付
 
 @return 支付宝订单
 */
#define URL_pay_alipay @"pay/alipay"


/**
 订单支付
 
 @return IAP订单
 */
#define URL_pay_IAP @"pay/iap"

#pragma mark - ——————— 点播订单相关 ————————

/**
 订单详情
 
 @return 订单详情
 */
#define URL_movies_order_detail @"mine/orders/detail"




#pragma mark - ——————— 约看相关 ————————


/**
 附近约看
 
 @return 附近约看
 */
#define URL_Meet_home @"activities/nearby"

/**
 最新约看
 
 @return 最新约看
 */
#define URL_Meet_Newest  @"activities/newest"


#pragma mark - ——————— 用户相关 ————————

/**
 省市选择
 
 @return 省市选择
 */
#define URL_Profile_citys @"profile/cities"

/**
 手机验证码

 @return 手机验证码URL
 */
#define URL_verify_code @"account/mobile/verify"
//#define URL_verify_code @"account/mobile/verifyForIOS"



/**
 国家Code

 @return 国家Code URL
 */
#define URL_account_code @"account/mobile/countries"



/**
 判断是否需要邀请码
 
 @return
 */
#define URL_user_Verify_need_invite @"account/mobileView/next"

/**
 验证邀请码
 
 @return
 */
#define URL_user_Verify_invite @"account/invite/check"


/**
 快速登录

 @return 登录URL
 */
#define URL_user_login @"account/login/mobile"

/**
 第三方登录
 
 @return 第三方登录URL
 */
#define URL_user_third_login @"account/login/union"

/**
 第三方登录绑定

 @return 第三方登录绑定URL
 */
#define URL_user_thirdLogin_bind @"account/mobile/binding"

/**
 第三方绑定
 
 @return 第三方账号绑定URL
 */
#define URL_user_third_bind @"account/union/binding"
/**
 第三方登录取消绑定
 
 @return 第三方账户取消绑定URL
 */
#define URL_user_third_unbind @"account/union/unbind"

/**
 他人用户信息
 
 @return
 */
#define URL_Account_info @"account/info"

/**
 他人用户信息
 
 @return
 */
#define URL_Account_info_Bu_N @"account/infoByNickname"

/**
 用户信息

 @return 用户信息URL
 */
#define URL_user_info @"mine/info"



/**
 修改头像
 
 @return 修改头像
 */
#define URL_user_modify_avatar @"profile/modify/avatar"

/**
 更改手机号
 
 @return 更改手机号URL
 */
#define URL_user_modify_Phone @"profile/modify/mobile"


/**
 更改用户信息
 
 @return 更改用户信息
 */
#define URL_user_modify_Info @"profile/modify"


/**
 更改用户设置信息
 
 @return 更改用户设置信息
 */
#define URL_user_modify_Setting @"setting/modify"


/**
 获取标签
 
 @return 获取标签
 */
#define URL_user_profile_tags @"profile/tags"


/**
  保存标签
 
 @return 保存标签
 */
#define URL_user_profile_save @"profile/tag/save"



/**
 添加自定义标签
 
 @return 添加自定义标签
 */
#define URL_user_profile_add @"profile/tag/add"


/**
   关注
 
 @return 关注
 */
#define URL_user_Follow @"account/follow"


/**
 用户关注的所有人
 
 @return 用户关注的所有人
 */
#define URL_user_Following @"account/following"

/**
 某用户的粉丝
 
 @return 某用户的粉丝
 */
#define URL_user_Followers @"account/followers"



/**
 用户收藏
 
 @return 用户收藏影片
 */
#define URL_user_Collect @"mine/favorites"


/**
 用户订单
 
 @return 用户订单
 */
#define URL_user_Order @"mine/orders"

/**
 我发起的约看
 
 @return 我发起的约看
 */
#define URL_user_Mine_Init_meet @"mine/activities" //@"activities/mine"

/**
 我参加的约看
 
 @return 我参加的
 */
#define URL_user_Mine_Join_meet @"mine/activities/join" //@"activities/mine/join"


/**
 我的相册
 
 @return 我的相册
 */
#define URL_user_Mine_Photos @"account/album"

/**
 我的照片墙
@return 我的照片墙
*/
#define URL_user_Mine_Photos_album @"mine/album"


/**
 用户照片墙
 @return 用户照片墙
 */
#define URL_user_account_album @"account/album"

/**
 相册上传图片
 
 @return
 */
#define URL_Mine_Photo_Upload @"mine/album/upload"

/**
 相册删除图片
 
 @return
 */
#define URL_Mine_Photo_Delete @"mine/album/delete"

/**
 我的照片墙 排序
 
 @return
 */
#define URL_Mine_Album_Sort @"mine/album/sort"


/**
 我创建的影厅
 
 @return 我创建的影厅
 */
#define URL_user_Mine_Live @"live/mine"


/**
 我参与的影厅
 
 @return 我参与的影厅
 */
#define URL_user_Mine_Live_Join @"live/mine/join"




/**
 拉黑某人
 
 @return 拉黑某人
 */
#define URL_user_add_blacklist @"account/blacklist"


/**
 黑名单列表
 
 @return 黑名单列表
 */
#define URL_user_blacklist @"account/blacklists"


#pragma mark - ——————— Coupon相关 ————————

/**
 兑换优惠卷
 
 @return 兑换优惠卷
 */
#define URL_user_Coupon_exchange @"cdkey/exchange"

/**
 兑换历史
 
 @return 兑换历史
 */
#define URL_user_Coupon_minecdkey @"mine/cdkey"


/**
 可用优惠卷
 
 @return 可用优惠卷
 */
#define URL_user_Coupon_order @"order/coupons"


/**
 优惠券支付请求
 
 @return 优惠券支付请求
 */
#define URL_user_Coupon_pay @"pay/coupons"



#define URL_user_pay @"pay"

#pragma mark - ——————— Room相关 ————————



/**
 开房列表
 
 @return Room  开房列表
 */
#define URL_Room_List @"live/rooms"
/**
 Room 详情
 
 @return Room 详情
 */
#define URL_Room_Detail @"live/room"


/**
 获取放映详情
 
 @return
 */
#define URL_Room_Presentation_Info @"presentation"





/**
 Room Users
 
 @return Room Users
 */
#define URL_Room_Users @"live/room/users"


/**
 room enter
 
 @return room enter
 */
#define URL_Room_Enter @"live/room/enter"


/**
 * 开房价格
 *
 * @return room price
 */
#define URL_Room_Price @"live/room/price"


/**
 * 发起开房
 *
 * @return room open
 */
#define URL_Room_Open  @"live/room/open"

/**
 * 获取用户信息
 *
 * @return account/chat/info
 */
#define URL_Room_Chat_info  @"account/chat/info"

#pragma mark - ——————— 优惠卷相关 ————————

// MARK: - 优惠券相关

/**
 * 我的优惠券
 *
 * @return mine coupons
 */
#define URL_Mine_Coupons   @"mine/coupons"



#pragma mark - ——————— 广场相关 ————————


#define URL_Plaza_Location_Around   @"location/around" //定位

#define URL_Plaza_Location_search   @"location/search"//搜索位置

#define URL_Plaza_Create   @"subjects/create" //创建

#define URL_Plaza_Relay   @"subjects/relay" //转发

#define URL_Plaza_Report   @"report" //举报


#endif /* JDURLMacros_h */
