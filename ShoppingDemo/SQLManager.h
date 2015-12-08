//
//  SQLManager.h
//  ShoppingDemo
//
//  Created by 1 on 15/12/3.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "Products.h"
@interface SQLManager : NSObject
+ (void)insertNewData:(Products *)model;
+ (NSArray *)getDataList;

@end
