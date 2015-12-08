//
//  ImageCell.m
//  UICollectionViewDemo
//
//  Created by 1 on 15/10/26.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "ImageCell.h"
#import "UIImageView+WebCache.h"
@implementation ImageCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        contentImage  = [[UIImageView alloc] init];
        contentImage.frame = CGRectMake(0, 0, 150, 200);
        [self addSubview:contentImage];
        

    }
    return self;
}
- (void)setModel:(Products *)model
{
    _model  = model;
    
    //    float height = 100*[_model.height floatValue]/[_model.width floatValue];
    //    contentImage.frame = CGRectMake(0, 0, 100.0f, height);
    [contentImage sd_setImageWithURL:[NSURL URLWithString:_model.taobaoPicUrl]];
    
}
@end
