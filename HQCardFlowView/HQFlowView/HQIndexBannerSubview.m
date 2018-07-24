//
//  HQIndexBannerSubview.m
//  HQCardFlowView
//
//  Created by HQ on 2018/7/24.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "HQIndexBannerSubview.h"

@implementation HQIndexBannerSubview

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubview:self.mainImageView];
        [self addSubview:self.coverView];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleCellTapAction:)];
        [self addGestureRecognizer:singleTap];
    }
    
    return self;
}

- (void)singleCellTapAction:(UIGestureRecognizer *)gesture {
    if (self.didSelectCellBlock) {
        self.didSelectCellBlock(self.tag, self);
    }
}

- (void)setSubviewsWithSuperViewBounds:(CGRect)superViewBounds {
    
    if (CGRectEqualToRect(self.mainImageView.frame, superViewBounds)) {
        return;
    }
    
    self.mainImageView.frame = superViewBounds;
    self.coverView.frame = superViewBounds;
}

- (UIImageView *)mainImageView {
    
    if (_mainImageView == nil) {
        //        _mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(JKWIDTH(2.2), JKHEIGHT(2.5), self.JK_width-JKWIDTH(4.4), self.JK_height-JKHEIGHT(5))];//原来设置
        _mainImageView = [[UIImageView alloc] init];
        _mainImageView.userInteractionEnabled = YES;
    }
    return _mainImageView;
}

- (UIImageView *)iconImage {
    
    if (_iconImage == nil) {
        //        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(-JKWIDTH(2), -JKHEIGHT(2), self.JK_width+JKWIDTH(4), self.JK_height+JKHEIGHT(4))];//图片阴影原来设置
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _iconImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconImage;
}

- (UIView *)coverView {
    if (_coverView == nil) {
        _coverView = [[UIView alloc] init];
        _coverView.backgroundColor = [UIColor blackColor];
    }
    return _coverView;
}


@end
