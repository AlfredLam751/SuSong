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
