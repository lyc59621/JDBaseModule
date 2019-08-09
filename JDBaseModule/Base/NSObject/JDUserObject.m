//
//  JDUserObject.m
//  JDBaseModule
//
//  Created by JDragon on 2018/9/17.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#import "JDUserObject.h"
#import "YYKit.h"



@implementation JDUserObject

-(instancetype)init
{
    if (self=[super init]) {
        _userId = @"";
        _userNickname = @"";
        _userMobile = @"";
        _userHeadimgurlResource =@"";
        _userGender = @"";
        _relationType = @"";
        _userSignature = @"";
        _dateSuccessCount = @"";
        _subjectCount = @"";
        _followCount = @"";
        _followingCount = @"";
        _province = @"";
        _city = @"";
    }
    return self;
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{};
}
#pragma mark------------------BGFMDB-----------------------
+(NSDictionary *)bg_objectClassForCustom{
    return @{};
}
+(NSArray *)bg_uniqueKeys{
    return @[@"userId"];
}

- (id)copyWithZone:(NSZone *)zone{
    return [self modelCopy];
}

@end
