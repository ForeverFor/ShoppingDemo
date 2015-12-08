//
//  Data.m
//
//  Created by   on 15/12/3
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "Products.h"


NSString *const kDataPreviousCursor = @"previous_cursor";
NSString *const kDataNextCursor = @"next_cursor";
NSString *const kDataProducts = @"products";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize previousCursor = _previousCursor;
@synthesize nextCursor = _nextCursor;
@synthesize products = _products;


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
            self.previousCursor = [self objectOrNilForKey:kDataPreviousCursor fromDictionary:dict];
            self.nextCursor = [self objectOrNilForKey:kDataNextCursor fromDictionary:dict];
    NSObject *receivedProducts = [dict objectForKey:kDataProducts];
    NSMutableArray *parsedProducts = [NSMutableArray array];
    if ([receivedProducts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedProducts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedProducts addObject:[Products modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedProducts isKindOfClass:[NSDictionary class]]) {
       [parsedProducts addObject:[Products modelObjectWithDictionary:(NSDictionary *)receivedProducts]];
    }

    self.products = [NSArray arrayWithArray:parsedProducts];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.previousCursor forKey:kDataPreviousCursor];
    [mutableDict setValue:self.nextCursor forKey:kDataNextCursor];
    NSMutableArray *tempArrayForProducts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.products) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProducts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProducts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProducts] forKey:kDataProducts];

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

    self.previousCursor = [aDecoder decodeObjectForKey:kDataPreviousCursor];
    self.nextCursor = [aDecoder decodeObjectForKey:kDataNextCursor];
    self.products = [aDecoder decodeObjectForKey:kDataProducts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_previousCursor forKey:kDataPreviousCursor];
    [aCoder encodeObject:_nextCursor forKey:kDataNextCursor];
    [aCoder encodeObject:_products forKey:kDataProducts];
}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {

        copy.previousCursor = [self.previousCursor copyWithZone:zone];
        copy.nextCursor = [self.nextCursor copyWithZone:zone];
        copy.products = [self.products copyWithZone:zone];
    }
    
    return copy;
}


@end
