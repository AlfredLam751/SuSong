//
//  SsPersonalViewControllerTwo.m
//  SusongTest
//
//  Created by Alfred Lam on 16/6/7.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsPersonalViewControllerTwo.h"
#import "SsSettingViewController.h"
#import "SsNavigationController.h"
#import "SsMessageController.h"

@interface SsPersonalViewControllerTwo ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIButton *headViewBtn;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UITableView *listTableView;

@end

@implementation SsPersonalViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"个人中心";
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hk_clock2.png"] style:UIBarButtonItemStylePlain target:self action:@selector(messageItemClick)];
    self.navigationItem.rightBarButtonItem = messageItem;
    
    UIBarButtonItem *settingItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hk_set"] style:UIBarButtonItemStylePlain target:self action:@selector(settingItemClick)];
    self.navigationItem.leftBarButtonItem = settingItem;
    
    [self prepareUI];
}

-(void)prepareUI{
    [self.view addSubview:self.backView];
    [self.view addSubview:self.listTableView];
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



-(void)headViewBtnClcik:(UIButton *)btn{
    LHLog(@"点击了头像");
}

#pragma mark - 数据源方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}


#pragma mark 懒加载
-(UIView *)backView{
    if (_backView == nil) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0,64,ScreenWidth, 200)];
        _backView.backgroundColor = LHRandomColor;
    }
    [_backView addSubview:self.headViewBtn];
    [_backView addSubview:self.nameLabel];
    
    return _backView;
}

-(UIButton *)headViewBtn{
    if (_headViewBtn == nil) {
        _headViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headViewBtn.frame = CGRectMake(ScreenWidth/2 - 50, 20, 100, 100);
        [_headViewBtn setImage:[UIImage imageNamed:@"user"] forState:UIControlStateNormal];
        [_headViewBtn addTarget:self action:@selector(headViewBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headViewBtn;
}

-(UIButton *)loginBtn{
    if (_loginBtn == nil) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _loginBtn.frame = CGRectMake(ScreenWidth/2 - 40, CGRectGetMaxY(self.headViewBtn.frame) + 20, 80, 40);
        [_loginBtn setTitle:@"马上登陆" forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(headViewBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
        [_loginBtn.layer setCornerRadius:5];
        [_loginBtn setBackgroundColor:LHRandomColor];
    }
    return _loginBtn;
}

-(UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.text = @"未登录";
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.frame = CGRectMake(ScreenWidth/2 - 50, CGRectGetMaxY(self.headViewBtn.frame) + 10, 100, 40);
        [_nameLabel.layer setCornerRadius:5];
    }
    return _nameLabel;
}

-(UITableView *)listTableView{
    if (_listTableView == nil) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.backView.frame), ScreenWidth, ScreenHeight- 99 - 200 ) style:UITableViewStyleGrouped];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.backgroundColor = LHRandomColor;
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _listTableView;
}


@end
