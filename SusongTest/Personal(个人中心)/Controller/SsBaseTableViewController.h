//
//  SsBaseTableViewController.h
//  SusongTest
//
//  Created by Alfred Lam on 16/5/31.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SsPersonalGroup.h"
#import "SsPersonalCell.h"
#import "SsPersonalItem.h"
#import "SsPersonalItemArrow.h"
#import "SsPersonalItemSwitch.h"

@interface SsBaseTableViewController : UITableViewController
@property (nonatomic, strong, readonly) NSMutableArray *groups;
@end
