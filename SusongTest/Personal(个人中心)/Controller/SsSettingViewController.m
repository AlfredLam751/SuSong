//
//  SsSettingViewController.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/27.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsSettingViewController.h"
#import "RETableViewManager.h"
#import "SsTestViewController.h"


@interface SsSettingViewController ()
@property (nonatomic, strong) UIButton *footBtn;
@end

@implementation SsSettingViewController

-(instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}

-(UIButton *)footBtn{
    if (_footBtn == nil) {
        _footBtn = [[UIButton alloc] init];
        _footBtn.frame = CGRectMake(0, 0, ScreenWidth, 44);
        [_footBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_footBtn addTarget:self action:@selector(footBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_footBtn setBackgroundColor:LHRandomColor];
    }
    return _footBtn;
}

-(void)footBtnClick:(UIButton *)btn{
    LHLog(@"点击了退出");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hk_back_white"] style:UIBarButtonItemStylePlain target:self action:@selector(backView)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    

    [self prepareUI];
}

-(void)prepareUI{
    
    self.title = @"退出登录";

    self.tableView.sectionHeaderHeight = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(-38, 0, 0, 0);
    self.tableView.bounces  = NO;
    self.tableView.tableFooterView = self.footBtn;
    
    SsPersonalItem *item11 = [SsPersonalItemArrow itemWithName:@"绑定银行卡" withIconName:nil withClassName:[SsTestViewController class]];
    SsPersonalItem *item21 = [SsPersonalItemArrow itemWithName:@"意见反馈" withIconName:nil withClassName:[SsTestViewController class]];
    SsPersonalItem *item31 = [SsPersonalItemArrow itemWithName:@"修改密码" withIconName:nil withClassName:[SsTestViewController class]];
    SsPersonalGroup *group1 = [SsPersonalGroup groupWithItems:@[item11,item21,item31]];
    [self.groups addObject:group1];
    
}

-(void)backView{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
