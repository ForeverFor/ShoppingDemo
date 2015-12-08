//
//  Brand.m
//
//  Created by   on 15/12/3
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Brand.h"


NSString *const kBrandId = @"id";
NSString *const kBrandTitle = @"title";
NSString *const kBrandLogoUrl = @"logo_url";
NSString *const kBrandTaobaoSellerNick = @"taobao_seller_nick";


@interface Brand ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Brand

@synthesize brandIdentifier = _brandIdentifier;
@synthesize title = _title;
@synthesize logoUrl = _logoUrl;
@synthesize taobaoSellerNick = _taobaoSellerNick;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.brandIdentifier = [self objectOrNilForKey:kBrandId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kBrandTitle fromDictionary:dict];
            self.logoUrl = [self objectOrNilForKey:kBrandLogoUrl fromDictionary:dict];
            self.taobaoSellerNick = [self objectOrNilForKey:kBrandTaobaoSellerNick fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brandIdentifier forKey:kBrandId];
    [mutableDict setValue:self.title forKey:kBrandTitle];
    [mutableDict setValue:self.logoUrl forKey:kBrandLogoUrl];
    [mutableDict setValue:self.taobaoSellerNick forKey:kBrandTaobaoSellerNick];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.brandIdentifier = [aDecoder decodeObjectForKey:kBrandId];
    self.title = [aDecoder decodeObjectForKey:kBrandTitle];
    self.logoUrl = [aDecoder decodeObjectForKey:kBrandLogoUrl];
    self.taobaoSellerNick = [aDecoder decodeObjectForKey:kBrandTaobaoSellerNick];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brandIdentifier forKey:kBrandId];
    [aCoder encodeObject:_title forKey:kBrandTitle];
    [aCoder encodeObject:_logoUrl forKey:kBrandLogoUrl];
    [aCoder encodeObject:_taobaoSellerNick forKey:kBrandTaobaoSellerNick];
}

- (id)copyWithZone:(NSZone *)zone
{
    Brand *copy = [[Brand alloc] init];
    
    if (copy) {

        copy.brandIdentifier = [self.brandIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.logoUrl = [self.logoUrl copyWithZone:zone];
        copy.taobaoSellerNick = [self.taobaoSellerNick copyWithZone:zone];
    }
    
    return copy;
}


@end
