//
//  SsNavigationController.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/13.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsNavigationController.h"

@interface SsNavigationController ()

@end

@implementation SsNavigationController

+(void)initialize{
    if (self == [SsNavigationController class]) {
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
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  拦截push操作
 *
 *  @param viewController <#viewController description#>
 *  @param animated       <#animated description#>
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
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
