//
//  SsTabBar.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/11.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsTabBar.h"
#import "SsTabbarButton.h"

@interface SsTabBar()

@property (nonatomic, strong) SsTabbarButton *selectButton;

@end

@implementation SsTabBar



-(void)btnClcik:(SsTabbarButton *)btn{
    self.selectButton.selected = NO;
    self.selectButton = btn;
    self.selectButton.selected = YES;
    if (self.selectBtn) {
        self.selectBtn(btn.tag);
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat Y = 0;
    CGFloat W = CGRectGetWidth(self.frame) / self.subviews.count;
    CGFloat H = CGRectGetHeight(self.frame);
    
    for (int i = 0; i < self.subviews.count; ++i) {
        SsTabbarButton *btn = self.subviews[i];
        btn.frame = CGRectMake(W * i, Y, W, H);
    }
}

-(void)setWithNormalImage:(NSString *)normalImage withSelectedImage:(NSString *)selectedImage{
    
    SsTabbarButton *tabbarBtn = [[SsTabbarButton alloc] init];
    [tabbarBtn setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [tabbarBtn setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    [tabbarBtn addTarget:self action:@selector(btnClcik:) forControlEvents:UIControlEventTouchUpInside];
    
    tabbarBtn.tag = self.subviews.count;
    
    if (self.subviews.count == 0) {
        [self btnClcik:tabbarBtn];
    }

    [self addSubview:tabbarBtn];
}


@end
