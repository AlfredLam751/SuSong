//
//  SsPersonalGroup.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/31.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsPersonalGroup.h"

@implementation SsPersonalGroup

+(instancetype)groupWithItems:(NSArray *)items{
    SsPersonalGroup *group = [[self alloc] init];
    group.items = items;
    return group;
}

@end
