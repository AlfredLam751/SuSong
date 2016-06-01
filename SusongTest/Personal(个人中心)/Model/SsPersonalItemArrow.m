//
//  SsPersonalItemArrow.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/31.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsPersonalItemArrow.h"

@implementation SsPersonalItemArrow

+(instancetype)itemWithName:(NSString *)name withIconName:(NSString *)iconName withClassName:(Class)className{
    SsPersonalItemArrow *item = [self itemWithName:name withIconName:iconName];
    item.className = className;
    return item;
}

@end
