# HQCardFlowView

### 3D卡片轮播，卡片轮播，无限轮播，DIY

### CSDN地址：https://blog.csdn.net/u010960265/article/details/81183843

### 效果如下图：

![效果图](https://github.com/HanQiGod/HQCardFlowView/blob/master/HQCardFlowView/20180724141023415.gif)


###  参考UITableView的UITableViewDataSource和UITableViewDelegate两个方法实现；支持五险轮播，可以加载本地图片，也可以加载网络图片，可以根据自己的需求自定义。

##  HQFlowViewDelegate
```
/**
*  当前显示cell的Size(中间页显示大小)
*
*  @param flowView 
*
*  @return CGSize
*/
- (CGSize)sizeForPageInFlowView:(HQFlowView *)flowView;

/**
*  滚动到了某一列
*
*  @param pageNumber 
*  @param flowView   
*/
- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(HQFlowView *)flowView;

/**
*  点击了第几个cell
*
*  @param subView 点击的控件
*  @param subIndex    点击控件的index
*
*  @return 
*/
- (void)didSelectCell:(HQIndexBannerSubview *)subView withSubViewIndex:(NSInteger)subIndex;
```

##  HQFlowViewDataSource
```
/**
*  返回显示View的个数
*
*  @param flowView 
*
*  @return 
*/
- (NSInteger)numberOfPagesInFlowView:(HQFlowView *)flowView;

/**
*  给某一列设置属性
*
*  @param flowView 
*  @param index    
*
*  @return 
*/
- (HQIndexBannerSubview *)flowView:(HQFlowView *)flowView cellForPageAtIndex:(NSInteger)index;
```
