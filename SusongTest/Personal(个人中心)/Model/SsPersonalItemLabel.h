//
//  SsPersonalItemLabel.h
//  SusongTest
//
//  Created by Alfred Lam on 16/6/1.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsPersonalItem.h"

@interface SsPersonalItemLabel : SsPersonalItem

@property (nonatomic, strong) NSString *labelText;

+(instancetype)itemWithName:(NSString *)name withIconName:(NSString *)iconName withLabelText:(NSString *)labelText;


@end
