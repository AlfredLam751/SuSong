//
//  SsPersonalItemLabel.m
//  SusongTest
//
//  Created by Alfred Lam on 16/6/1.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsPersonalItemLabel.h"

@implementation SsPersonalItemLabel

+(instancetype)itemWithName:(NSString *)name withIconName:(NSString *)iconName withLabelText:(NSString *)labelText{
    SsPersonalItemLabel *item = [self itemWithName:name withIconName:iconName];
    item.labelText = labelText;
    return item;
}

@end
