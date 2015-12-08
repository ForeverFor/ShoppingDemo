//
//  Data.h
//
//  Created by   on 15/12/3
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *previousCursor;
@property (nonatomic, strong) NSString *nextCursor;
@property (nonatomic, strong) NSArray *products;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
