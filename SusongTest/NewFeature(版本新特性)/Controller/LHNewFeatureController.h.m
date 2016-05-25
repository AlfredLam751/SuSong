//
//  LHNewFeatureController.h
//  SusongTest
//
//  Created by Alfred Lam on 16/5/25.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "LHNewFeatureController.h"

#define LHNewFeatureImageCount 4

@interface LHNewFeatureController ()<UIScrollViewDelegate>
// 分页指示器
@property (strong, nonatomic) UIPageControl *pageControl;

@property (strong, nonatomic) LHNewFeatureController *featureVc;
@end

@implementation LHNewFeatureController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor redColor];
    
    // 添加scrollView
    [self setupScrollView];
    
    // 添加分页指示器
//    [self setupPageControl];
}

/**
 *  创建滚动视图
 */
- (void)setupScrollView {
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    // 创建scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    // 设置代理
    scrollView.delegate = self;
    // 添加到控制器的view
    [self.view addSubview:scrollView];
    
    for (NSInteger index = 0; index < LHNewFeatureImageCount; index ++) {
        // 创建imageView
        UIImageView *imageView = [[UIImageView alloc] init];
        CGFloat imageX = index * width;
        CGFloat imageY = 0;
        // 根据index获得图片名字
        // 如果屏幕高度大于等于568，
         NSString *imageName = nil;
        if ([UIScreen mainScreen].bounds.size.height >= 568) {
            imageName = [NSString stringWithFormat:@"引导页%ld",index + 1];
        } else {
            imageName = [NSString stringWithFormat:@"引导页%ld",index + 1];
        }
        // 设置图片
        imageView.image = [UIImage imageNamed:imageName];
        // 设置frame
        imageView.frame = CGRectMake(imageX, imageY, width, height);
        // 将图片添加到scrollView
        [scrollView addSubview:imageView];
        
        if (index == (LHNewFeatureImageCount - 1)) { // 最后一张图
            // 添加立即体验按钮
            [self setupStartButton:imageView];
        }
    }
    // 设置没有弹簧效果
    scrollView.bounces = NO;
    // 设置分页
    scrollView.pagingEnabled = YES;
    // 设置滚动范围
    scrollView.contentSize = CGSizeMake(LHNewFeatureImageCount * width, 0);
    // 设置滚动条隐藏
    scrollView.showsHorizontalScrollIndicator = NO;
    
    // 不建议：通过index获得scrollView获得最后一个子控件
    
}

/**
 *  创建分页指示器
 */
- (void)setupPageControl{
    // 创建分页指示器
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    // 设置总页数
    pageControl.numberOfPages = LHNewFeatureImageCount;
    // 设置点的颜色
    // 当前页点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    // 设置其他页点的颜色
    pageControl.pageIndicatorTintColor = [UIColor yellowColor];
    
    // 设置frame
    pageControl.frame = CGRectMake(0, 0, 100, 30);
    pageControl.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.95);
    
    // 把指示器添加控制器view
    [self.view addSubview:pageControl];
    
    self.pageControl = pageControl;
}


/**
 *  添加立即体验按钮
 */
- (void)setupStartButton:(UIImageView *)imageView{
    // 开启用户交互
    imageView.userInteractionEnabled = YES;
    // 创建按钮
//    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    // 设置背景
////    [startBtn setBackgroundImage:[UIImage imageNamed:@"angle-mask@3x"] forState:UIControlStateNormal];
//    [startBtn setBackgroundColor:[UIColor blackColor]];
//    // 设置尺寸
//    CGFloat startBtnW = startBtn.currentBackgroundImage.size.width;
//    CGFloat startBtnH = startBtn.currentBackgroundImage.size.height;
//    startBtn.frame  = CGRectMake(0, 0, startBtnW, startBtnH);
//    // 设置中心点
//    startBtn.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.8);
    UIButton * startBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.center.x - 60, self.view.bounds.size.height - 65, 120, 40)];
    startBtn.backgroundColor = [UIColor clearColor];
    // 监听点击
    [startBtn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
    // 将按钮添加到imageView上
    [imageView addSubview:startBtn];
}

/**
 *  监听按钮点击
 */
- (void)startBtnClick{
    self.featureVc = self;

    // 切换主界面
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    [window addSubview:self.view];
    // 执行动画
    CGFloat width = self.featureVc.view.frame.size.width;
    CGFloat height = self.featureVc.view.frame.size.height;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.featureVc.view.frame = CGRectMake(-width, 0, width, height);
    } completion:^(BOOL finished) {
        // 清空新特性控制器
        self.featureVc = nil;
    }];
   
}

#pragma mark - scrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 获得宽度
    CGFloat width = CGRectGetWidth(scrollView.frame);
    // 计算偏移量
    CGFloat offsetX = scrollView.contentOffset.x ;
    // 计算页号
    NSInteger page = offsetX / width + 0.5;
    
    self.pageControl.currentPage = page;
}

- (void)dealloc {
}
@end
