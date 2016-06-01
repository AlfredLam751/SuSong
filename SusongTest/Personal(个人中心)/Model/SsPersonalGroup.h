//
//  SsPersonalGroup.h
//  SusongTest
//
//  Created by Alfred Lam on 16/5/31.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SsPersonalGroup : NSObject

/**
 *  items数组模型
 */
@property (nonatomic, strong) NSArray *items;
/**
 *  组头文字
 */
@property (nonatomic, strong) NSString *headerString;
/**
 *  组尾文字
 */
@property (nonatomic, strong) NSString *footerString;

+(instancetype)groupWithItems:(NSArray *)items;

@end
