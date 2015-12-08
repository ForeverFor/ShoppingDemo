//
//  TaobaoItemImgs.m
//
//  Created by   on 15/12/3
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TaobaoItemImgs.h"


NSString *const kTaobaoItemImgsId = @"id";
NSString *const kTaobaoItemImgsPosition = @"position";
NSString *const kTaobaoItemImgsUrl = @"url";


@interface TaobaoItemImgs ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TaobaoItemImgs

@synthesize taobaoItemImgsIdentifier = _taobaoItemImgsIdentifier;
@synthesize position = _position;
@synthesize url = _url;


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
            self.taobaoItemImgsIdentifier = [[self objectOrNilForKey:kTaobaoItemImgsId fromDictionary:dict] doubleValue];
            self.position = [[self objectOrNilForKey:kTaobaoItemImgsPosition fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kTaobaoItemImgsUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.taobaoItemImgsIdentifier] forKey:kTaobaoItemImgsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kTaobaoItemImgsPosition];
    [mutableDict setValue:self.url forKey:kTaobaoItemImgsUrl];

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

    self.taobaoItemImgsIdentifier = [aDecoder decodeDoubleForKey:kTaobaoItemImgsId];
    self.position = [aDecoder decodeDoubleForKey:kTaobaoItemImgsPosition];
    self.url = [aDecoder decodeObjectForKey:kTaobaoItemImgsUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_taobaoItemImgsIdentifier forKey:kTaobaoItemImgsId];
    [aCoder encodeDouble:_position forKey:kTaobaoItemImgsPosition];
    [aCoder encodeObject:_url forKey:kTaobaoItemImgsUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    TaobaoItemImgs *copy = [[TaobaoItemImgs alloc] init];
    
    if (copy) {

        copy.taobaoItemImgsIdentifier = self.taobaoItemImgsIdentifier;
        copy.position = self.position;
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
