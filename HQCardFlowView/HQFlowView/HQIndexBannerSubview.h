//
//  HQIndexBannerSubview.h
//  HQCardFlowView
//
//  Created by Mr_Han on 2018/7/24.
//  Copyright © 2018年 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//


/******************************
 
 可以根据自己的需要继承HQIndexBannerSubview
 
 ******************************/

#import <UIKit/UIKit.h>

@interface HQIndexBannerSubview : UIView

/**
 *  主图
 */
@property (nonatomic, strong) UIImageView *mainImageView;

/**
 *  阴影
 */
@property (nonatomic, strong) UIImageView *iconImage;

/**
 *  用来变色的view
 */
@property (nonatomic, strong) UIView *coverView;

@property (nonatomic, copy) void (^didSelectCellBlock)(NSInteger tag, HQIndexBannerSubview *cell);

/**
 设置子控件frame,继承后要重写
 
 @param superViewBounds <#superViewBounds description#>
 */
- (void)setSubviewsWithSuperViewBounds:(CGRect)superViewBounds;



@end
