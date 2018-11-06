//
//  HQFlowView.h
//  HQCardFlowView
//
//  Created by Mr_Han on 2018/7/24.
//  Copyright © 2018年 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import <UIKit/UIKit.h>
#import "HQIndexBannerSubview.h"

@protocol HQFlowViewDataSource;
@protocol HQFlowViewDelegate;

/******************************
 
 页面滚动的方向分为横向和纵向
 
 Version 1.0:
 目的:实现类似于选择电影票的效果,并且实现无限/自动轮播
 
 特点:1.无限轮播;2.自动轮播;3.电影票样式的层次感;4.非当前显示view具有缩放和透明的特效
 
 问题:考虑到轮播图的数量不会太大,暂时未做重用处理;对设备性能影响不明显,后期版本会考虑添加重用标识模仿tableview的重用
 
 ******************************/

typedef enum{
    HQFlowViewOrientationHorizontal = 0,
    HQFlowViewOrientationVertical
}HQFlowViewOrientation;

@interface HQFlowView : UIView<UIScrollViewDelegate>

/**
 *  默认为横向
 */
@property (nonatomic,assign) HQFlowViewOrientation orientation;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic,assign) BOOL needsReload;
/**
 *  总页数
 */
@property (nonatomic,assign) NSInteger pageCount;

@property (nonatomic,strong) NSMutableArray *cells;
@property (nonatomic,assign) NSRange visibleRange;
/**
 *  如果以后需要支持reuseIdentifier，这边就得使用字典类型了
 */
@property (nonatomic,strong) NSMutableArray *reusableCells;

@property (nonatomic,assign)   id <HQFlowViewDataSource> dataSource;
@property (nonatomic,assign)   id <HQFlowViewDelegate>   delegate;

/**
 *  指示器
 */
@property (nonatomic,retain)  UIPageControl *pageControl;

/**
 *  非当前页的透明比例
 */
@property (nonatomic, assign) CGFloat minimumPageAlpha;

/**
 左右间距,默认20
 */
@property (nonatomic, assign) CGFloat leftRightMargin;

/**
 上下间距,默认30
 */
@property (nonatomic, assign) CGFloat topBottomMargin;

/**
 *  是否开启自动滚动,默认为开启
 */
@property (nonatomic, assign) BOOL isOpenAutoScroll;

/**
 *  是否开启无限轮播,默认为开启
 */
@property (nonatomic, assign) BOOL isCarousel;

/**
 *  当前是第几页
 */
@property (nonatomic, assign, readonly) NSInteger currentPageIndex;

/**
 *  定时器
 */
@property (nonatomic, weak) NSTimer *timer;

/**
 *  自动切换视图的时间,默认是5.0
 */
@property (nonatomic, assign) CGFloat autoTime;

/**
 *  原始页数
 */
@property (nonatomic, assign) NSInteger orginPageCount;

/**
 *  刷新视图
 */
- (void)reloadData;

/**
 *  获取可重复使用的Cell
 *
 *  @return <#return value description#>
 */
- (HQIndexBannerSubview *)dequeueReusableCell;

/**
 *  滚动到指定的页面
 *
 *  @param pageNumber <#pageNumber description#>
 */
- (void)scrollToPage:(NSUInteger)pageNumber;

/**
 *  开启定时器,废弃
 */
//- (void)startTimer;

/**
 *  关闭定时器,关闭自动滚动
 */
- (void)stopTimer;

/**
 调整中间页居中，经常出现滚动卡住一半时调用
 */
- (void)adjustCenterSubview;

@end


@protocol  HQFlowViewDelegate<NSObject>

@optional
/**
 *  当前显示cell的Size(中间页显示大小)
 *
 *  @param flowView <#flowView description#>
 *
 *  @return <#return value description#>
 */
- (CGSize)sizeForPageInFlowView:(HQFlowView *)flowView;

/**
 *  滚动到了某一列
 *
 *  @param pageNumber <#pageNumber description#>
 *  @param flowView   <#flowView description#>
 */
- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(HQFlowView *)flowView;

/**
 *  点击了第几个cell
 *
 *  @param subView 点击的控件
 *  @param subIndex    点击控件的index
 *
 *  @return <#return value description#>
 */
- (void)didSelectCell:(HQIndexBannerSubview *)subView withSubViewIndex:(NSInteger)subIndex;

@end


@protocol HQFlowViewDataSource <NSObject>

/**
 *  返回显示View的个数
 *
 *  @param flowView <#flowView description#>
 *
 *  @return <#return value description#>
 */
- (NSInteger)numberOfPagesInFlowView:(HQFlowView *)flowView;

/**
 *  给某一列设置属性
 *
 *  @param flowView <#flowView description#>
 *  @param index    <#index description#>
 *
 *  @return <#return value description#>
 */
- (HQIndexBannerSubview *)flowView:(HQFlowView *)flowView cellForPageAtIndex:(NSInteger)index;

@end
