//
//  SsPersonalItem.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/31.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsPersonalItem.h"

@implementation SsPersonalItem

+(instancetype)itemWithName:(NSString *)name withIconName:(NSString *)iconName{
    SsPersonalItem *item = [[self alloc] init];
    item.name = name;
    item.iconName = iconName;
    return item;
}

@end
