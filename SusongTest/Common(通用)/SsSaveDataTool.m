//
//  SsSaveDataTool.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/25.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsSaveDataTool.h"

@implementation SsSaveDataTool

+(void)saveValue:(NSString *)value forKey:(NSString *)key{
    if (key == nil || key.length == 0) {
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:value forKey:key];
    [defaults synchronize];
}

+(void)saveBool:(BOOL)b forKey:(NSString *)key{
    if (key == nil || key.length == 0) {
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:b forKey:key];
    [defaults synchronize];
}

+(BOOL)boolForKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return  [defaults boolForKey:key];
}

+(id)valueForKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return  [defaults valueForKey:key];
}
@end
