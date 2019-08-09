//
//  JDBaseTablePage.m
//  JDBaseModule
//
//  Created by JDragon on 2018/9/17.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#import "JDBaseTablePage.h"
#import "JDBaseModuleHeader.h"

@interface JDBaseTablePage ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JDBaseTablePage

-(UITableViewStyle)tabStyle
{
    return UITableViewStylePlain;
}
- (JDBaseTableView *)aTableView
{
    WS(weakSelf);
    return JD_LAZY(_aTableView, ({
        
        JDBaseTableView *tableView = [[JDBaseTableView alloc] initWithFrame:self.view.bounds style:[self tabStyle]];
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [weakSelf.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            if (@available(iOS 11.0, *)) {
                make.top.mas_equalTo(weakSelf.view.mas_safeAreaLayoutGuideTop).offset(KSafeAreaLayoutRatio(64));
                make.bottom.mas_equalTo(weakSelf.view.mas_safeAreaLayoutGuideBottom).offset(0);
            } else {
                make.top.mas_equalTo(weakSelf.view.mas_top).offset(0);
                make.bottom.mas_equalTo(weakSelf.view.mas_bottom).offset(0);
            }
        }];
        tableView;
    }));
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@synthesize cellZoomXScaleFactor = _xZoomFactor;
@synthesize cellZoomYScaleFactor = _yZoomFactor;
@synthesize cellZoomAnimationDuration = _animationDuration;
@synthesize cellZoomInitialAlpha = _initialAlpha;


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ((indexPath.section == 0 && currentMaxDisplayedCell == 0) || indexPath.section > currentMaxDisplayedSection){ //first item in a new section, reset the max row count
        currentMaxDisplayedCell = -1; //-1 because the check for currentMaxDisplayedCell has to be > rather than >= (otherwise the last cell is ALWAYS animated), so we need to set this to -1 otherwise the first cell in a section is never animated.
    }
    
    if (indexPath.section >= currentMaxDisplayedSection && indexPath.row > currentMaxDisplayedCell){ //this check makes cells only animate the first time you view them (as you're scrolling down) and stops them re-animating as you scroll back up, or scroll past them for a second time.
        
        //now make the image view a bit bigger, so we can do a zoomout effect when it becomes visible
        cell.contentView.alpha = self.cellZoomInitialAlpha.floatValue;
        
        CGAffineTransform transformScale = CGAffineTransformMakeScale(self.cellZoomXScaleFactor.floatValue, self.cellZoomYScaleFactor.floatValue);
        CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(self.cellZoomXOffset.floatValue, self.cellZoomYOffset.floatValue);
        
        cell.contentView.transform = CGAffineTransformConcat(transformScale, transformTranslate);
        
        [self.aTableView bringSubviewToFront:cell.contentView];
        [UIView animateWithDuration:self.cellZoomAnimationDuration.floatValue
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             cell.contentView.alpha = 1;
                             //clear the transform
                             cell.contentView.transform = CGAffineTransformIdentity;
                         } completion:nil];
        
        
        currentMaxDisplayedCell = indexPath.row;
        currentMaxDisplayedSection = indexPath.section;
    }
}

-(void)resetViewedCells{
    currentMaxDisplayedSection = 0;
    currentMaxDisplayedCell = 0;
}

#pragma -mark Setters for four customisable variables
-(void)setCellZoomXScaleFactor:(NSNumber *)xZoomFactor{
    _xZoomFactor = xZoomFactor;
}
-(void)setCellZoomYScaleFactor:(NSNumber *)yZoomFactor{
    _yZoomFactor = yZoomFactor;
}
-(void)setCellZoomAnimationDuration:(NSNumber *)animationDuration{
    _animationDuration = animationDuration;
}
-(void)setCellZoomInitialAlpha:(NSNumber *)initialAlpha{
    _initialAlpha = initialAlpha;
}

#pragma -mark Getters for four customisable variable. Provide default if not set.
-(NSNumber *)cellZoomXScaleFactor{
    if (_xZoomFactor == nil){
        _xZoomFactor = [NSNumber numberWithFloat:1.07];//1.25
    }
    return _xZoomFactor;
}
-(NSNumber *)cellZoomXOffset{
    if (_cellZoomXOffset == nil){
        _cellZoomXOffset = [NSNumber numberWithFloat:0];
    }
    return _cellZoomXOffset;
}
-(NSNumber *)cellZoomYOffset{
    if (_cellZoomYOffset == nil){
        _cellZoomYOffset = [NSNumber numberWithFloat:0];
    }
    return _cellZoomYOffset;
}
-(NSNumber *)cellZoomYScaleFactor{
    if (_yZoomFactor == nil){
        _yZoomFactor = [NSNumber numberWithFloat:1.07];//1.25
    }
    return _yZoomFactor;
}
-(NSNumber *)cellZoomAnimationDuration{
    if (_animationDuration == nil){
        _animationDuration = [NSNumber numberWithFloat:0.5];//0.65
    }
    return _animationDuration;
}
-(NSNumber *)cellZoomInitialAlpha{
    if (_initialAlpha == nil){
        _initialAlpha = [NSNumber numberWithFloat:0.3];
    }
    return _initialAlpha;
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
