//
//  SsTabBar.h
//  SusongTest
//
//  Created by Alfred Lam on 16/5/11.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SsTabBar : UIView
@property (nonatomic, copy) void (^selectBtn)(NSInteger index);


-(void)setWithNormalImage:(NSString *)normalImage withSelectedImage:(NSString *)selectedImage;


@end
