//
//  JDBaseScrollViewVPage.m
//  SX-ZTMFSB
//
//  Created by 姜锦龙 on 2019/8/18.
//  Copyright © 2019 JDragon. All rights reserved.
//

#import "JDBaseScrollViewVPage.h"

@interface JDBaseScrollViewVPage ()<UIScrollViewDelegate>

@end

@implementation JDBaseScrollViewVPage
-(UIScrollView*)aScrollView
{
    return  JD_LAZY(_aScrollView, ({
        
        UIScrollView  *aScrollView = [[UIScrollView  alloc]init];
        aScrollView.showsVerticalScrollIndicator = false;
        aScrollView.showsHorizontalScrollIndicator = false;
        aScrollView.bounces = false;
        aScrollView.delegate = self;
        aScrollView;
    }));
}
-(UIView*)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        //        _contentView.backgroundColor = KWhiteColor;
    }
    return _contentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)setUIConfig
{
    [self.view addSubview:self.aScrollView];
    WS(weakSelf);
    [self.aScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        if (@available(iOS 11.0, *)) {
            make.top.mas_equalTo(weakSelf.view.mas_safeAreaLayoutGuideTop).offset(KSafeAreaLayoutRatio(64));
            make.bottom.mas_equalTo(weakSelf.view.mas_safeAreaLayoutGuideBottom).offset(0);
        } else {
            make.top.mas_equalTo(weakSelf.view.mas_top).offset(KSafeAreaLayoutRatio(64));
            
            make.bottom.mas_equalTo(weakSelf.view.mas_bottom).offset(0);
        }
    }];
    [self.aScrollView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.aScrollView);
        make.width.equalTo(kMainScreenWidth);
    }];
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
