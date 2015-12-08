//
//  SQLManager.m
//  ShoppingDemo
//
//  Created by 1 on 15/12/3.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "SQLManager.h"

@implementation SQLManager
+ (void)insertNewData:(Products *)model
{
    NSString *path =[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/shopping.db"];
    NSLog(@"%@",path);
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    if (![db open]) {
        [db close];
        NSLog(@"NO");
        return;
    }
    
    NSString *sqliteString = @"create  table if not exists shopping (id integer primary key , title text , price text ,picURL text ,count text); ";
    [db executeUpdate:sqliteString];
    
    
    
    [db executeUpdateWithFormat:@"insert into shopping(title,price,picURL) VALUES (%@ ,%@ ,%@ )",model.taobaoTitle,model.taobaoPrice,model.taobaoPicUrl];
    [db close];
    
}
+ (NSArray *)getDataList
{
    NSString *path =[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/shopping.db"];
    NSLog(@"%@",path);
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    if (![db open]) {
        [db close];
        NSLog(@"NO");
        return nil;
    }
    
    NSMutableArray *arr = [NSMutableArray array];
    FMResultSet *s = [db executeQuery:@"SELECT * FROM shopping;"];
    while ([s next]) {
        NSLog(@"-----");
        NSString *title = [s stringForColumnIndex:1];
        NSString *price = [s stringForColumnIndex:2];
        NSString *picURL = [s stringForColumnIndex:3];
        Products *products = [Products new];
        products.taobaoTitle = title;
        products.taobaoPrice = price;
        products.taobaoPicUrl = picURL;
        products.collectionNumber = 1;
        [arr addObject:products];
    }
    [db close];

    return arr;
    
}


@end
