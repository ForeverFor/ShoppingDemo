//
//  Products.m
//
//  Created by   on 15/12/3
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Products.h"
#import "Brand.h"
#import "TaobaoItemImgs.h"


NSString *const kProductsTaobaoTitle = @"taobao_title";
NSString *const kProductsTaobaoDelistTime = @"taobao_delist_time";
NSString *const kProductsTaobaoSellingPrice = @"taobao_selling_price";
NSString *const kProductsTags = @"tags";
NSString *const kProductsFromTitle = @"from_title";
NSString *const kProductsFromLogoUrl = @"from_logo_url";
NSString *const kProductsFreightPayer = @"freight_payer";
NSString *const kProductsMoneySymbol = @"money_symbol";
NSString *const kProductsBrand = @"brand";
NSString *const kProductsDiscount = @"discount";
NSString *const kProductsTaobaoItemImgs = @"taobao_item_imgs";
NSString *const kProductsCommentsCount = @"comments_count";
NSString *const kProductsFromType = @"from_type";
NSString *const kProductsSharesCount = @"shares_count";
NSString *const kProductsTaobaoPrice = @"taobao_price";
NSString *const kProductsMobileCpsUrl = @"mobile_cps_url";
NSString *const kProductsTaobaoVolume = @"taobao_volume";
NSString *const kProductsLimitDiscountId = @"limit_discount_id";
NSString *const kProductsPcCpsUrl = @"pc_cps_url";
NSString *const kProductsVisitsCount = @"visits_count";
NSString *const kProductsLikesCount = @"likes_count";
NSString *const kProductsTaobaoUrl = @"taobao_url";
NSString *const kProductsTaobaoNumIid = @"taobao_num_iid";
NSString *const kProductsIsDelist = @"is_delist";
NSString *const kProductsTaobaoPromoPrice = @"taobao_promo_price";
NSString *const kProductsTaobaoPicUrl = @"taobao_pic_url";


@interface Products ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Products

@synthesize taobaoTitle = _taobaoTitle;
@synthesize taobaoDelistTime = _taobaoDelistTime;
@synthesize taobaoSellingPrice = _taobaoSellingPrice;
@synthesize tags = _tags;
@synthesize fromTitle = _fromTitle;
@synthesize fromLogoUrl = _fromLogoUrl;
@synthesize freightPayer = _freightPayer;
@synthesize moneySymbol = _moneySymbol;
@synthesize brand = _brand;
@synthesize discount = _discount;
@synthesize taobaoItemImgs = _taobaoItemImgs;
@synthesize commentsCount = _commentsCount;
@synthesize fromType = _fromType;
@synthesize sharesCount = _sharesCount;
@synthesize taobaoPrice = _taobaoPrice;
@synthesize mobileCpsUrl = _mobileCpsUrl;
@synthesize taobaoVolume = _taobaoVolume;
@synthesize limitDiscountId = _limitDiscountId;
@synthesize pcCpsUrl = _pcCpsUrl;
@synthesize visitsCount = _visitsCount;
@synthesize likesCount = _likesCount;
@synthesize taobaoUrl = _taobaoUrl;
@synthesize taobaoNumIid = _taobaoNumIid;
@synthesize isDelist = _isDelist;
@synthesize taobaoPromoPrice = _taobaoPromoPrice;
@synthesize taobaoPicUrl = _taobaoPicUrl;


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
            self.taobaoTitle = [self objectOrNilForKey:kProductsTaobaoTitle fromDictionary:dict];
            self.taobaoDelistTime = [self objectOrNilForKey:kProductsTaobaoDelistTime fromDictionary:dict];
            self.taobaoSellingPrice = [self objectOrNilForKey:kProductsTaobaoSellingPrice fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kProductsTags fromDictionary:dict];
            self.fromTitle = [self objectOrNilForKey:kProductsFromTitle fromDictionary:dict];
            self.fromLogoUrl = [self objectOrNilForKey:kProductsFromLogoUrl fromDictionary:dict];
            self.freightPayer = [self objectOrNilForKey:kProductsFreightPayer fromDictionary:dict];
            self.moneySymbol = [self objectOrNilForKey:kProductsMoneySymbol fromDictionary:dict];
            self.brand = [Brand modelObjectWithDictionary:[dict objectForKey:kProductsBrand]];
            self.discount = [self objectOrNilForKey:kProductsDiscount fromDictionary:dict];
    NSObject *receivedTaobaoItemImgs = [dict objectForKey:kProductsTaobaoItemImgs];
    NSMutableArray *parsedTaobaoItemImgs = [NSMutableArray array];
    if ([receivedTaobaoItemImgs isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTaobaoItemImgs) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTaobaoItemImgs addObject:[TaobaoItemImgs modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTaobaoItemImgs isKindOfClass:[NSDictionary class]]) {
       [parsedTaobaoItemImgs addObject:[TaobaoItemImgs modelObjectWithDictionary:(NSDictionary *)receivedTaobaoItemImgs]];
    }

    self.taobaoItemImgs = [NSArray arrayWithArray:parsedTaobaoItemImgs];
            self.commentsCount = [self objectOrNilForKey:kProductsCommentsCount fromDictionary:dict];
            self.fromType = [self objectOrNilForKey:kProductsFromType fromDictionary:dict];
            self.sharesCount = [self objectOrNilForKey:kProductsSharesCount fromDictionary:dict];
            self.taobaoPrice = [self objectOrNilForKey:kProductsTaobaoPrice fromDictionary:dict];
            self.mobileCpsUrl = [self objectOrNilForKey:kProductsMobileCpsUrl fromDictionary:dict];
            self.taobaoVolume = [self objectOrNilForKey:kProductsTaobaoVolume fromDictionary:dict];
            self.limitDiscountId = [self objectOrNilForKey:kProductsLimitDiscountId fromDictionary:dict];
            self.pcCpsUrl = [self objectOrNilForKey:kProductsPcCpsUrl fromDictionary:dict];
            self.visitsCount = [self objectOrNilForKey:kProductsVisitsCount fromDictionary:dict];
            self.likesCount = [self objectOrNilForKey:kProductsLikesCount fromDictionary:dict];
            self.taobaoUrl = [self objectOrNilForKey:kProductsTaobaoUrl fromDictionary:dict];
            self.taobaoNumIid = [self objectOrNilForKey:kProductsTaobaoNumIid fromDictionary:dict];
            self.isDelist = [[self objectOrNilForKey:kProductsIsDelist fromDictionary:dict] boolValue];
            self.taobaoPromoPrice = [self objectOrNilForKey:kProductsTaobaoPromoPrice fromDictionary:dict];
            self.taobaoPicUrl = [self objectOrNilForKey:kProductsTaobaoPicUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.taobaoTitle forKey:kProductsTaobaoTitle];
    [mutableDict setValue:self.taobaoDelistTime forKey:kProductsTaobaoDelistTime];
    [mutableDict setValue:self.taobaoSellingPrice forKey:kProductsTaobaoSellingPrice];
    [mutableDict setValue:self.tags forKey:kProductsTags];
    [mutableDict setValue:self.fromTitle forKey:kProductsFromTitle];
    [mutableDict setValue:self.fromLogoUrl forKey:kProductsFromLogoUrl];
    [mutableDict setValue:self.freightPayer forKey:kProductsFreightPayer];
    [mutableDict setValue:self.moneySymbol forKey:kProductsMoneySymbol];
    [mutableDict setValue:[self.brand dictionaryRepresentation] forKey:kProductsBrand];
    [mutableDict setValue:self.discount forKey:kProductsDiscount];
    NSMutableArray *tempArrayForTaobaoItemImgs = [NSMutableArray array];
    for (NSObject *subArrayObject in self.taobaoItemImgs) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTaobaoItemImgs addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTaobaoItemImgs addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTaobaoItemImgs] forKey:kProductsTaobaoItemImgs];
    [mutableDict setValue:self.commentsCount forKey:kProductsCommentsCount];
    [mutableDict setValue:self.fromType forKey:kProductsFromType];
    [mutableDict setValue:self.sharesCount forKey:kProductsSharesCount];
    [mutableDict setValue:self.taobaoPrice forKey:kProductsTaobaoPrice];
    [mutableDict setValue:self.mobileCpsUrl forKey:kProductsMobileCpsUrl];
    [mutableDict setValue:self.taobaoVolume forKey:kProductsTaobaoVolume];
    [mutableDict setValue:self.limitDiscountId forKey:kProductsLimitDiscountId];
    [mutableDict setValue:self.pcCpsUrl forKey:kProductsPcCpsUrl];
    [mutableDict setValue:self.visitsCount forKey:kProductsVisitsCount];
    [mutableDict setValue:self.likesCount forKey:kProductsLikesCount];
    [mutableDict setValue:self.taobaoUrl forKey:kProductsTaobaoUrl];
    [mutableDict setValue:self.taobaoNumIid forKey:kProductsTaobaoNumIid];
    [mutableDict setValue:[NSNumber numberWithBool:self.isDelist] forKey:kProductsIsDelist];
    [mutableDict setValue:self.taobaoPromoPrice forKey:kProductsTaobaoPromoPrice];
    [mutableDict setValue:self.taobaoPicUrl forKey:kProductsTaobaoPicUrl];

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

    self.taobaoTitle = [aDecoder decodeObjectForKey:kProductsTaobaoTitle];
    self.taobaoDelistTime = [aDecoder decodeObjectForKey:kProductsTaobaoDelistTime];
    self.taobaoSellingPrice = [aDecoder decodeObjectForKey:kProductsTaobaoSellingPrice];
    self.tags = [aDecoder decodeObjectForKey:kProductsTags];
    self.fromTitle = [aDecoder decodeObjectForKey:kProductsFromTitle];
    self.fromLogoUrl = [aDecoder decodeObjectForKey:kProductsFromLogoUrl];
    self.freightPayer = [aDecoder decodeObjectForKey:kProductsFreightPayer];
    self.moneySymbol = [aDecoder decodeObjectForKey:kProductsMoneySymbol];
    self.brand = [aDecoder decodeObjectForKey:kProductsBrand];
    self.discount = [aDecoder decodeObjectForKey:kProductsDiscount];
    self.taobaoItemImgs = [aDecoder decodeObjectForKey:kProductsTaobaoItemImgs];
    self.commentsCount = [aDecoder decodeObjectForKey:kProductsCommentsCount];
    self.fromType = [aDecoder decodeObjectForKey:kProductsFromType];
    self.sharesCount = [aDecoder decodeObjectForKey:kProductsSharesCount];
    self.taobaoPrice = [aDecoder decodeObjectForKey:kProductsTaobaoPrice];
    self.mobileCpsUrl = [aDecoder decodeObjectForKey:kProductsMobileCpsUrl];
    self.taobaoVolume = [aDecoder decodeObjectForKey:kProductsTaobaoVolume];
    self.limitDiscountId = [aDecoder decodeObjectForKey:kProductsLimitDiscountId];
    self.pcCpsUrl = [aDecoder decodeObjectForKey:kProductsPcCpsUrl];
    self.visitsCount = [aDecoder decodeObjectForKey:kProductsVisitsCount];
    self.likesCount = [aDecoder decodeObjectForKey:kProductsLikesCount];
    self.taobaoUrl = [aDecoder decodeObjectForKey:kProductsTaobaoUrl];
    self.taobaoNumIid = [aDecoder decodeObjectForKey:kProductsTaobaoNumIid];
    self.isDelist = [aDecoder decodeBoolForKey:kProductsIsDelist];
    self.taobaoPromoPrice = [aDecoder decodeObjectForKey:kProductsTaobaoPromoPrice];
    self.taobaoPicUrl = [aDecoder decodeObjectForKey:kProductsTaobaoPicUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_taobaoTitle forKey:kProductsTaobaoTitle];
    [aCoder encodeObject:_taobaoDelistTime forKey:kProductsTaobaoDelistTime];
    [aCoder encodeObject:_taobaoSellingPrice forKey:kProductsTaobaoSellingPrice];
    [aCoder encodeObject:_tags forKey:kProductsTags];
    [aCoder encodeObject:_fromTitle forKey:kProductsFromTitle];
    [aCoder encodeObject:_fromLogoUrl forKey:kProductsFromLogoUrl];
    [aCoder encodeObject:_freightPayer forKey:kProductsFreightPayer];
    [aCoder encodeObject:_moneySymbol forKey:kProductsMoneySymbol];
    [aCoder encodeObject:_brand forKey:kProductsBrand];
    [aCoder encodeObject:_discount forKey:kProductsDiscount];
    [aCoder encodeObject:_taobaoItemImgs forKey:kProductsTaobaoItemImgs];
    [aCoder encodeObject:_commentsCount forKey:kProductsCommentsCount];
    [aCoder encodeObject:_fromType forKey:kProductsFromType];
    [aCoder encodeObject:_sharesCount forKey:kProductsSharesCount];
    [aCoder encodeObject:_taobaoPrice forKey:kProductsTaobaoPrice];
    [aCoder encodeObject:_mobileCpsUrl forKey:kProductsMobileCpsUrl];
    [aCoder encodeObject:_taobaoVolume forKey:kProductsTaobaoVolume];
    [aCoder encodeObject:_limitDiscountId forKey:kProductsLimitDiscountId];
    [aCoder encodeObject:_pcCpsUrl forKey:kProductsPcCpsUrl];
    [aCoder encodeObject:_visitsCount forKey:kProductsVisitsCount];
    [aCoder encodeObject:_likesCount forKey:kProductsLikesCount];
    [aCoder encodeObject:_taobaoUrl forKey:kProductsTaobaoUrl];
    [aCoder encodeObject:_taobaoNumIid forKey:kProductsTaobaoNumIid];
    [aCoder encodeBool:_isDelist forKey:kProductsIsDelist];
    [aCoder encodeObject:_taobaoPromoPrice forKey:kProductsTaobaoPromoPrice];
    [aCoder encodeObject:_taobaoPicUrl forKey:kProductsTaobaoPicUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    Products *copy = [[Products alloc] init];
    
    if (copy) {

        copy.taobaoTitle = [self.taobaoTitle copyWithZone:zone];
        copy.taobaoDelistTime = [self.taobaoDelistTime copyWithZone:zone];
        copy.taobaoSellingPrice = [self.taobaoSellingPrice copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.fromTitle = [self.fromTitle copyWithZone:zone];
        copy.fromLogoUrl = [self.fromLogoUrl copyWithZone:zone];
        copy.freightPayer = [self.freightPayer copyWithZone:zone];
        copy.moneySymbol = [self.moneySymbol copyWithZone:zone];
        copy.brand = [self.brand copyWithZone:zone];
        copy.discount = [self.discount copyWithZone:zone];
        copy.taobaoItemImgs = [self.taobaoItemImgs copyWithZone:zone];
        copy.commentsCount = [self.commentsCount copyWithZone:zone];
        copy.fromType = [self.fromType copyWithZone:zone];
        copy.sharesCount = [self.sharesCount copyWithZone:zone];
        copy.taobaoPrice = [self.taobaoPrice copyWithZone:zone];
        copy.mobileCpsUrl = [self.mobileCpsUrl copyWithZone:zone];
        copy.taobaoVolume = [self.taobaoVolume copyWithZone:zone];
        copy.limitDiscountId = [self.limitDiscountId copyWithZone:zone];
        copy.pcCpsUrl = [self.pcCpsUrl copyWithZone:zone];
        copy.visitsCount = [self.visitsCount copyWithZone:zone];
        copy.likesCount = [self.likesCount copyWithZone:zone];
        copy.taobaoUrl = [self.taobaoUrl copyWithZone:zone];
        copy.taobaoNumIid = [self.taobaoNumIid copyWithZone:zone];
        copy.isDelist = self.isDelist;
        copy.taobaoPromoPrice = [self.taobaoPromoPrice copyWithZone:zone];
        copy.taobaoPicUrl = [self.taobaoPicUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
