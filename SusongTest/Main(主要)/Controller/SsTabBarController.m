//
//  SsTabBarController.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/11.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsTabBarController.h"
#import "SsTabBar.h"
#import "SsMessageController.h"
#import "SVProgressHUD.h"

@interface SsTabBarController ()

@end

@implementation SsTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置tabbar控制器
//    [self.tabBar removeFromSuperview];
    SsTabBar *newTabbar = [[SsTabBar alloc] init];
    newTabbar.frame = self.tabBar.bounds;
    newTabbar.backgroundColor = [UIColor grayColor];
    
    NSInteger count = 3;
    for (int i = 0; i < count; ++i) {
        NSString *normalImage = [NSString stringWithFormat:@"0%d",i + 1];
        NSString *selectImage = [NSString stringWithFormat:@"引导页%d",i + 1
                                 ];
        [newTabbar setWithNormalImage:normalImage withSelectedImage:selectImage];
    }
    
    [newTabbar setSelectBtn:^(NSInteger index) {
        self.selectedIndex = index;
    }];
    
    [self.tabBar addSubview:newTabbar];
    
    //设置导航栏样式
    UINavigationBar *naviBar = [UINavigationBar appearance];
    [naviBar setBackgroundImage:[UIImage imageNamed:@"hk_bg2"] forBarMetrics:UIBarMetricsDefault];
    //设置字体
    NSMutableDictionary *attibite = [NSMutableDictionary dictionary];
    attibite[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    attibite[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [naviBar setTitleTextAttributes:attibite];
    /**
     *  导航栏按钮的颜色
     */
    naviBar.tintColor = [UIColor whiteColor];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
