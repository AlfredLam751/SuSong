//
//  SsPersonalCell.h
//  SusongTest
//
//  Created by Alfred Lam on 16/5/31.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SsPersonalItem;

@interface SsPersonalCell : UITableViewCell
@property (nonatomic, strong)  SsPersonalItem *item;
@property (nonatomic, assign) BOOL hidenLine;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
