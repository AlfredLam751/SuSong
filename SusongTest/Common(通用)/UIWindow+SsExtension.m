//
//  UIWindow+SsExtension.m
//  SusongTest
//
//  Created by Alfred Lam on 16/6/15.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "UIWindow+SsExtension.h"
#import "LHNewFeatureController.h"

@implementation UIWindow (SsExtension)

+(void)switchRootViewController{
    //判断是否是版本新特性
    NSString *version = @"Version";
    NSString *oldVersion = [SsSaveDataTool valueForKey:version];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if ([oldVersion isEqualToString:currentVersion]) {
        window.rootViewController =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    }else{
        LHNewFeatureController *newFeature = [[LHNewFeatureController alloc] init];
        window.backgroundColor = [UIColor whiteColor];
        window.rootViewController = newFeature;
        [SsSaveDataTool saveValue:currentVersion forKey:version];
    }
}

@end
