//
//  JDFixBaseView.m
//  JDBaseModuleDemo
//
//  Created by JDragon on 2019/8/9.
//  Copyright © 2019 JDragon. All rights reserved.
//

#import "JDFixBaseView.h"
#import "JDBaseModuleHeader.h"

@interface JDFixBaseView()

@property(nonatomic,strong) UIImageView  *backImg;
@property(nonatomic,strong) UIImageView  *fixImg;
@property(nonatomic,strong) UIImageView  *sliderImg;
@property(nonatomic,strong) UILabel  *tipLab;

@end

@implementation JDFixBaseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UIImageView*)backImg
{
    if (!_backImg) {
        _backImg = [[UIImageView alloc]initWithImage:IMAGE(@"imgBgMaintain")];
    }
    return _backImg;
}
-(UIImageView*)fixImg
{
    if (!_fixImg) {
        _fixImg = [[UIImageView alloc]initWithImage:IMAGE(@"imgMaintain")];
    }
    return _fixImg;
}
-(UIImageView*)sliderImg
{
    if (!_sliderImg) {
        _sliderImg = [[UIImageView alloc]initWithImage:IMAGE(@"imgLoading")];
    }
    return _sliderImg;
}
-(UILabel*)tipLab
{
    if (!_tipLab) {
        
        _tipLab = [[UILabel alloc]init];
        _tipLab.text = @"COMING SOON…";
        _tipLab.textColor = HEXCOLOR(0xb7b7b7);
        _tipLab.textAlignment = NSTextAlignmentCenter;
        _tipLab.font = KJD_FONT_Regular(16);
    }
    return _tipLab;
}

+(instancetype)fixBaseView
{
    JDFixBaseView  *fixV = [[JDFixBaseView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight)];
    return fixV;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUIConfig];
    }
    return self;
}
-(void)setUIConfig
{
    
    [self addSubview:self.backImg];
    [self addSubview:self.fixImg];
    [self addSubview:self.sliderImg];
    [self addSubview:self.tipLab];
    
    [self.backImg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.fixImg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(140);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(160, 160));
    }];
    [self.sliderImg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.fixImg.mas_bottom).mas_offset(20);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(190, 10));
    }];
    [self.tipLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.sliderImg.mas_bottom).mas_offset(10);
        make.centerX.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
    }];
    
    
}

@end
