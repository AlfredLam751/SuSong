//
//  SsSaveDataTool.h
//  SusongTest
//
//  Created by Alfred Lam on 16/5/25.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SsSaveDataTool : NSObject

+(void)saveValue:(NSString *)value forKey:(NSString *)key;
+(void)saveBool:(BOOL)b forKey:(NSString *)key;

+(BOOL)boolForKey:(NSString *)key;
+(id)valueForKey:(NSString *)key;
@end
