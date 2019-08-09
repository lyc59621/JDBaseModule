//
//  JDUserObject.m
//  JDBaseModuleDemo
//
//  Created by JDragon on 2019/8/9.
//  Copyright © 2019 JDragon. All rights reserved.
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
    return @{@"setting" : [JDUserSetObject class],
              @"accounts":[JDUserThirdObject class]
             };
}
#pragma mark------------------BGFMDB-----------------------
+(NSDictionary *)bg_objectClassForCustom{
    return @{@"setting":[JDUserSetObject class],
             @"accounts":[JDUserThirdObject class]
             };
}
+(NSArray *)bg_uniqueKeys{
    return @[@"userId"];
}

- (id)copyWithZone:(NSZone *)zone{
    return [self modelCopy];
}

@end
