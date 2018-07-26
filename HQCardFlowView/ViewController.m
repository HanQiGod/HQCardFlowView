//
//  ViewController.m
//  HQCardFlowView
//
//  Created by HQ on 2018/7/24.
//  Copyright © 2018年 HQ. All rights reserved.
//

#define JkScreenHeight [UIScreen mainScreen].bounds.size.height
#define JkScreenWidth [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"
#import "HQFlowView.h"
#import "HQImagePageControl.h"

@interface ViewController () <HQFlowViewDelegate,HQFlowViewDataSource>

/**
 *  图片数组
 */
@property (nonatomic, strong) NSMutableArray *advArray;
/**
 *  轮播图
 */
@property (nonatomic, strong) HQImagePageControl *pageC;
@property (nonatomic, strong) HQFlowView *pageFlowView;
@property (nonatomic, strong) UIScrollView *scrollView; // 轮播图容器

@end

@implementation ViewController

- (NSMutableArray *)advArray
{
    if (!_advArray) {
        _advArray = [NSMutableArray arrayWithObjects:@"1",@"22",@"33",@"44",@"55",@"66",@"77",@"88",@"99", nil];
    }
    return _advArray;
}

#pragma mark -- 轮播图
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, JkScreenWidth, 200)];
        _scrollView.backgroundColor = [UIColor clearColor];
    }
    return _scrollView;
}

- (HQFlowView *)pageFlowView
{
    if (!_pageFlowView) {
        
        _pageFlowView = [[HQFlowView alloc] initWithFrame:CGRectMake(0, 0, JkScreenWidth, 200)];
        _pageFlowView.delegate = self;
        _pageFlowView.dataSource = self;
        _pageFlowView.minimumPageAlpha = 0.3;
        _pageFlowView.leftRightMargin = 15;
        _pageFlowView.topBottomMargin = 20;
        _pageFlowView.orginPageCount = _advArray.count;
        _pageFlowView.isOpenAutoScroll = YES;
        _pageFlowView.autoTime = 3.0;
        _pageFlowView.orientation = HQFlowViewOrientationHorizontal;
        
    }
    return _pageFlowView;
}

- (HQImagePageControl *)pageC
{
    if (!_pageC) {
        
        //初始化pageControl
        if (!_pageC) {
            _pageC = [[HQImagePageControl alloc]initWithFrame:CGRectMake(0, self.scrollView.frame.size.height - 15, self.scrollView.frame.size.width, 7.5)];
        }
        [self.pageFlowView.pageControl setCurrentPage:0];
        self.pageFlowView.pageControl = _pageC;
        
    }
    return _pageC;
}

#pragma mark JQFlowViewDelegate
- (CGSize)sizeForPageInFlowView:(HQFlowView *)flowView
{
    return CGSizeMake(JkScreenWidth-2*30, self.scrollView.frame.size.height-2*3);
}

- (void)didSelectCell:(UIView *)subView withSubViewIndex:(NSInteger)subIndex
{
    NSLog(@"点击第%d个广告",subIndex);
}
#pragma mark JQFlowViewDatasource
- (NSInteger)numberOfPagesInFlowView:(HQFlowView *)flowView
{
    return self.advArray.count;
}
- (HQIndexBannerSubview *)flowView:(HQFlowView *)flowView cellForPageAtIndex:(NSInteger)index
{
    HQIndexBannerSubview *bannerView = (HQIndexBannerSubview *)[flowView dequeueReusableCell];
    if (!bannerView) {
        bannerView = [[HQIndexBannerSubview alloc] initWithFrame:CGRectMake(0, 0, self.pageFlowView.frame.size.width, self.pageFlowView.frame.size.height)];
        bannerView.layer.cornerRadius = 5;
        bannerView.layer.masksToBounds = YES;
        bannerView.coverView.backgroundColor = [UIColor darkGrayColor];
    }
    //在这里下载网络图片
//    [bannerView.mainImageView sd_setImageWithURL:[NSURL URLWithString:self.advArray[index]] placeholderImage:nil];
    //加载本地图片
    bannerView.mainImageView.image = [UIImage imageNamed:self.advArray[index]];
    
    return bannerView;
}

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(HQFlowView *)flowView
{
    [self.pageFlowView.pageControl setCurrentPage:pageNumber];
}
#pragma mark --旋转屏幕改变JQFlowView大小之后实现该方法
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id)coordinator
{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
        [coordinator animateAlongsideTransition:^(id context) { [self.pageFlowView reloadData];
        } completion:NULL];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)dealloc
{
    self.pageFlowView.delegate = nil;
    self.pageFlowView.dataSource = nil;
    [self.pageFlowView stopTimer];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.pageFlowView];
    [self.pageFlowView addSubview:self.pageC];
    
    [self.pageFlowView reloadData];//刷新轮播
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
