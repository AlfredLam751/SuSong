//
//  SsPersonalItem.h
//  SusongTest
//
//  Created by Alfred Lam on 16/5/31.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SsPersonalItem : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *iconName;

+(instancetype)itemWithName:(NSString *)name withIconName:(NSString *)iconName;

@end
