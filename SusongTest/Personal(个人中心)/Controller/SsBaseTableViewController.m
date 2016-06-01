//
//  SsBaseTableViewController.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/31.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsBaseTableViewController.h"

@interface SsBaseTableViewController ()

@property (nonatomic, strong) NSMutableArray *groups;

@end

@implementation SsBaseTableViewController

-(instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark懒加载
-(NSMutableArray *)groups{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionHeaderHeight = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark tableView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    SsPersonalGroup *group = self.groups[section];
    return group.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SsPersonalCell *cell = [SsPersonalCell cellWithTableView:tableView];
    SsPersonalGroup *group = self.groups[indexPath.section];
    SsPersonalItem *item = group.items[indexPath.row];
    cell.item = item;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SsPersonalGroup *group = self.groups[indexPath.section];
    SsPersonalItem *item = group.items[indexPath.row];
    
    if ([item isKindOfClass:[SsPersonalItemArrow class]]) {
        SsPersonalItemArrow *itemArrow = (SsPersonalItemArrow *)item;
        Class desVcClass = itemArrow.className;
        UIViewController *desVc = [[desVcClass alloc] init];
        desVc.title = item.name;
        [self.navigationController pushViewController:desVc animated:YES];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    SsPersonalGroup *group = self.groups[section];
    return group.headerString;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    SsPersonalGroup *group = self.groups[section];
    return group.footerString;
}

@end
