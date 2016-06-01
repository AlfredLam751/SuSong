//
//  SusongTest-pch.h
//  SusongTest
//
//  Created by Alfred Lam on 16/5/17.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#ifndef SusongTest_pch_h
#define SusongTest_pch_h

/**
 *  常用宏
 */
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

#define ScaleHeight(h) ( h/667.0 * [[UIScreen mainScreen] bounds].size.height)
#define ScaleWidth(w) ( w/375.0 * [[UIScreen mainScreen] bounds].size.weight)

#define LHRGBColor(r , g , b , a)  [UIColor colorWithRed:(r)/255.0f   green:(g)/255.0f  blue:(b)/255.0f   alpha:(a)];

#define LHRandomColor [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0]

/**
 *  通用头文件
 */
#import "PureLayout.h"

//nslog转换
#ifdef DEBUG //处于调试阶段
#define LHLog(...) NSLog(__VA_ARGS__)
#else //处于发布阶段
#define LHLog(...)
#endif

#endif /* SusongTest_pch_h */
