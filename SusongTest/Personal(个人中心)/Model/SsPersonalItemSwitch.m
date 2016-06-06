//
//  SsPersonalItemSwitch.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/31.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsPersonalItemSwitch.h"

@implementation SsPersonalItemSwitch

-(void)setName:(NSString *)name{
    self.isOn = [SsSaveDataTool boolForKey:name];
    [super setName:name];
}

-(void)setIsOn:(BOOL)isOn{
    _isOn = isOn;
    [SsSaveDataTool saveBool:_isOn forKey:self.name];
}

@end
