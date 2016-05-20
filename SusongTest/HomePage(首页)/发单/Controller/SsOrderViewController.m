//
//  SsOrderViewController.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/20.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsOrderViewController.h"

@interface SsOrderViewController ()

@end

@implementation SsOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    self.title = @"抢单";
    // Do any additional setup after loading the view from its nib.
}

-(void)prepareUI{
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, 2000);
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
