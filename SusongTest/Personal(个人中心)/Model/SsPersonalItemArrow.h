//
//  SsPersonalItemArrow.h
//  SusongTest
//
//  Created by Alfred Lam on 16/5/31.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsPersonalItem.h"

@interface SsPersonalItemArrow : SsPersonalItem

@property (nonatomic, assign) Class className;

+(instancetype)itemWithName:(NSString *)name withIconName:(NSString *)iconName withClassName:(Class)className;

@end
