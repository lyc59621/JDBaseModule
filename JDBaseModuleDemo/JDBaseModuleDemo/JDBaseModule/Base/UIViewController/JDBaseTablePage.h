//
//  JDBaseTablePage.h
//  JDBaseModuleDemo
//
//  Created by JDragon on 2019/8/9.
//  Copyright © 2019 JDragon. All rights reserved.
//

#import "JDBaseViewController.h"
#import "JDragonTableManager.h"
#import "JDBaseTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JDBaseTablePage : JDBaseViewController

{
    NSInteger currentMaxDisplayedCell; //keep track of the maximum cell index that has been displayed (for the animation, so as we move down the table the cells are animated when they're viewed for the first time - if index is greated than currentMaxDisplayedCell - but then as you scroll back up they're not re-animated.
    NSInteger currentMaxDisplayedSection;
}

@property(nonatomic,strong)JDBaseTableView  *aTableView;
@property(nonatomic,strong)JDragonTableManager  *tabDataSource;

/**  @property cellZoomXScaleFactor
 *   @brief The X Zoom Factor
 *   How much to scale to x axis of the cell before it is animated back to normal size. 1 is normal size. >1 is bigger, <1 is smaller. Default if not set is 1.25 **/
@property (strong, nonatomic) NSNumber* cellZoomXScaleFactor;

/**  @property cellZoomYScaleFactor
 *   @brief The Y Zoom Factor
 *   How much to scale to y axis of the cell before it is animated back to normal size. 1 is normal size. >1 is bigger, <1 is smaller. Default if not set is 1.25 **/
@property (strong, nonatomic) NSNumber* cellZoomYScaleFactor;

/**  @property cellZoomXOffset
 *   @brief Specify an X offset (in pixels) for the animation's initial position
 *   Allows you to specify an X offset (in pixels) for the animation's initial position, so for example if you say -50 this will mean as well as the rest of the animation, the cell also comes in from 50 pixels to the left of the screen. If you say 100 it will come in from 100 pixels to the right of the screen. Combine it with the cellZoomYOffset to get the cell to come in diagonally (see TabThreeViewController in Demo examples). If not set, the default is 0.  **/
@property (strong, nonatomic) NSNumber* cellZoomXOffset;

/**  @property cellZoomYOffset
 *   @brief Specify a Y offset (in pixels). for the animations initial position
 *   Allows you to specify a Y offset (in pixels) for the animation's initial position, so for example if you say -50 this will mean as well as the rest of the animation, the cell also comes in from 50 pixels to the top of the screen. If you say 100 it will come in from 100 pixels to the bottom of the screen. Combine it with the cellZoomXOffset to get the cell to come in diagonally (see TabThreeViewController in Demo examples). If not set, the default is 0.  **/
@property (strong, nonatomic) NSNumber* cellZoomYOffset;

/**  @property cellZoomInitialAlpha
 *   @brief The inital Alpha value of the cell
 *   The initial alpha value of the cell when it starts animation. For example if you set this to be 0 then the cell will begin completely transparent, and will fade into view as well as zooming. Value between 0 and 1. Default if not set is 0.3 **/
@property (strong, nonatomic) NSNumber* cellZoomInitialAlpha;

/**  @property cellZoomAnimationDuration
 *   @brief The Animation Duration
 *   The duration of the animation effect, in seconds. Default if not set is 0.65 seconds **/
@property (strong, nonatomic) NSNumber* cellZoomAnimationDuration;

/*
 Resets the view counter. The animation effect doesnt repeat when you've already seen a cell once, for example if you scroll down past cell #5, then scroll back to the top and down again, the animation won't repeat as you scroll back down past #5. This is by design to make only "new" cells animate as they appear. Call this method to reset the count of which cells have been seen (e.g when you call reload on the table's data)
 */
-(void)resetViewedCells;

-(BOOL)showNavSeparatorColorAction;


@end

NS_ASSUME_NONNULL_END
