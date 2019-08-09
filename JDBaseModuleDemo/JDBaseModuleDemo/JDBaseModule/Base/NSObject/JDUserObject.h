//
//  JDUserObject.h
//  JDBaseModuleDemo
//
//  Created by JDragon on 2019/8/9.
//  Copyright © 2019 JDragon. All rights reserved.
//

#import "JDBaseObject.h"




@interface JDUserObject : JDBaseObject

//{
//    "userId": "klfkmuse-pqie-zevr-hcjv-uwhjbrmcnpuz",
//    "userNickname": "据十的运相",
//    "userHeadimgurlResource": "https://dev.JDmovie.com/static/test/imgs/m1.jpg",
//    "userGender": 1,
//    "userSignature": "办克院最土物",
//    "dateSuccessCount": 1,
//    "followCount": 1,
//    "province": "界百学农八华",
//    "city": "量近七天"
//},
//"setting": {
//    "commentDefendSetting": 0,
//    "commentNotifySetting": 1,
//    "isShowActivityNumber": 1,
//    "messageNotifySetting": 1,
//    "praiseNotifySetting": 1,
//    "timelineNotifySetting": 1
//}

@property(nonatomic,strong) JDUserSetObject   *setting;
@property(nonatomic,strong) NSArray  *accounts;
@property(nonatomic,strong) NSArray  *tags;  //标签


@property(nonatomic,copy) NSString   *userId;
@property(nonatomic,copy) NSString   *userNickname;
@property(nonatomic,copy) NSString   *userMobile;
@property(nonatomic,copy) NSString   *userHeadimgurlResource;
@property(nonatomic,copy) NSString   *userGender;           //0 保密 //1 男 // 2 女


@property(nonatomic,copy) NSString   *birthday;

@property(nonatomic,copy) NSString   *relationType;         //0为互相没关注、1为他关注了我但我没关注他、2为我关注了他但他没关注我，3互相关注

@property(nonatomic,copy) NSString   *userSignature;
@property(nonatomic,copy) NSString   *dateSuccessCount;     //约看成功次数
@property(nonatomic,copy) NSString   *subjectCount;         //发布的话题数量
@property(nonatomic,copy) NSString   *followCount;          //粉丝人数
@property(nonatomic,copy) NSString   *followingCount;       //关注的人数
@property(nonatomic,copy) NSString   *province;             //省份
@property(nonatomic,copy) NSString   *city;                 //市
@property (nonatomic, copy) NSString *chatUserPwd;          // 环信密码
@property (nonatomic, copy) NSString *chatUserId;           // 环信账号
@property (nonatomic, copy) NSString *roomId;               // 我的直播间



@property (nonatomic, copy) NSString *userBalance;
@property (nonatomic, copy) NSString *livePayStatus;           //直播支付状态

@property (nonatomic, copy) NSString *userFullname;           //真实姓名
@property (nonatomic, copy) NSString *userIdcard;           //身份证号

@property (nonatomic, copy) NSString *certificationFlag;      //实名认证状态

@property (nonatomic, copy) NSString *constellation;          // 星座
@property (nonatomic, copy) NSString *group; //90后

@property (nonatomic, copy) NSString *settingStatus; //资料设置完成度：1为完成，0为未完成


@property(nonatomic,strong) NSArray  *photos; //自己的照片墙

@property(nonatomic, copy) NSString *inviteStatus;//邀请码状态




@end
