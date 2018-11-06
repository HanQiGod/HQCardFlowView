//
//  HQImagePageControl.m
//  HQCardFlowView
//
//  Created by Mr_Han on 2018/7/24.
//  Copyright © 2018年 Mr_Han. All rights reserved..
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import "HQImagePageControl.h"

@implementation HQImagePageControl

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    activeImage = [UIImage imageNamed:@"icon_pageWidget_sign"];
    inactiveImage = [UIImage imageNamed:@"icon_pageWidget"] ;
    
    return self;
}

-(void) updateDots
{
    for (int i = 0; i < [self.subviews count]; i++)
    {
        UIView *vi = [self.subviews objectAtIndex:i];
        
        //添加imageView
        if ([vi.subviews count] == 0) {
            UIImageView * view = [[UIImageView alloc]initWithFrame:vi.bounds];
            [vi addSubview:view];
        };
        
        //配置imageView
        UIImageView * view = vi.subviews[0];
        
        if (i == self.currentPage) view.image = activeImage;
        else view.image = inactiveImage;
    }
}

-(void) setCurrentPage:(NSInteger)page
{
    [super setCurrentPage:page];
    //修改图标大小
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
        
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        
        CGSize size;
        
        size.height = 8.5;
        
        size.width = 6.f;
        
        subview.backgroundColor = [UIColor clearColor];
        
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
                                     
                                     size.width,size.height)];
        
    }
    
    
    [self updateDots];
}

@end
