//
//  BaseClass.h
//
//  Created by   on 15/12/3
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data;

@interface BaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double ret;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) Data *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
