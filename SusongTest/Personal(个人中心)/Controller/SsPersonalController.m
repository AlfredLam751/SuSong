//
//  SsPersonalController.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/27.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsPersonalController.h"
#import "SsMessageController.h"
#import "SsSettingViewController.h"
#import "SsNavigationController.h"
#import "SsTestViewController.h"

@interface SsPersonalController ()
@end

@implementation SsPersonalController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hk_clock2.png"] style:UIBarButtonItemStylePlain target:self action:@selector(messageItemClick)];
    self.navigationItem.rightBarButtonItem = messageItem;
    
    UIBarButtonItem *settingItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hk_set"] style:UIBarButtonItemStylePlain target:self action:@selector(settingItemClick)];
    self.navigationItem.leftBarButtonItem = settingItem;
    
    [self prepareUI];
}

-(void)prepareUI{

    
//    self.tableView.tableHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"SsPersonalHeaderView" owner:nil options:nil] lastObject];
    
    //第一组
    SsPersonalItem *item11 = [SsPersonalItemSwitch itemWithName:@"申请成为速送员" withIconName:@"hk_icon1_send"];
    SsPersonalGroup *group1 = [SsPersonalGroup groupWithItems:@[item11]];
    //第二组
    SsPersonalItem *item21 = [SsPersonalItemArrow itemWithName:@"我的订单" withIconName:@"hk_icon3_order" withClassName:[SsTestViewController class]];
    SsPersonalItem *item22 = [SsPersonalItemArrow itemWithName:@"价格表" withIconName:@"hk_icon4_price" withClassName:[SsTestViewController class]];
    SsPersonalItem *item23 = [SsPersonalItemArrow itemWithName:@"我的钱包" withIconName:@"hk_icon5_wallet" withClassName:[SsTestViewController class]];
    SsPersonalGroup *group2 = [SsPersonalGroup groupWithItems:@[item21,item22,item23]];
    //第三组
    SsPersonalItem *item31 = [SsPersonalItemArrow itemWithName:@"账单明细" withIconName:@"hk_icon6_bill" withClassName:[SsTestViewController class]];
    SsPersonalItem *item32 = [SsPersonalItemArrow itemWithName:@"关于我们" withIconName:@"hk_icon7_we" withClassName:[SsTestViewController class]];
    SsPersonalItem *item33 = [SsPersonalItemLabel itemWithName:@"测试cell" withIconName:@"hk_icon7_we" withLabelText:@"测试"];
    SsPersonalGroup *group3 = [SsPersonalGroup groupWithItems:@[item31,item32,item33]];
    
    [self.groups addObject:group1];
    [self.groups addObject:group2];
    [self.groups addObject:group3];
}

-(void)messageItemClick{
    SsMessageController *messageVc = [[SsMessageController alloc] init];
    [self.navigationController pushViewController:messageVc animated:YES];
}

-(void)settingItemClick{
    SsSettingViewController *settingVc = [[SsSettingViewController alloc] init];
    SsNavigationController *naviVc = [[SsNavigationController alloc] initWithRootViewController:settingVc];
    [self presentViewController:naviVc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
