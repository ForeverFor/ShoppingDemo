//
//  TaobaoItemImgs.h
//
//  Created by   on 15/12/3
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TaobaoItemImgs : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double taobaoItemImgsIdentifier;
@property (nonatomic, assign) double position;
@property (nonatomic, strong) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
