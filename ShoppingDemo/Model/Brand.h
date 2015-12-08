//
//  Brand.h
//
//  Created by   on 15/12/3
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Brand : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *brandIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *logoUrl;
@property (nonatomic, strong) NSString *taobaoSellerNick;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
