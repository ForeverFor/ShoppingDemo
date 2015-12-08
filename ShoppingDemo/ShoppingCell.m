//
//  ShoppingCell.m
//  ShoppingDemo
//
//  Created by 1 on 15/12/3.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "ShoppingCell.h"

@implementation ShoppingCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        contentImage  = [[UIImageView alloc] init];
        contentImage.frame = CGRectMake(0, 10, 100, 100);
        [self addSubview:contentImage];
        
        numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 20, 80, 40.0f)];
        numberLabel.text = @"1";
        [self addSubview:numberLabel];
        
        
        UIButton *delButton = [UIButton buttonWithType:UIButtonTypeCustom];
        delButton.frame = CGRectMake(120.0f, 20.0f, 40.0f, 40.0f);
        delButton.backgroundColor = [UIColor redColor];
        delButton.tag = 101;
        [delButton setTitle:@"-" forState:UIControlStateNormal];
        [delButton addTarget:self action:@selector(buttonTouch:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:delButton];
        
        UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        addButton.frame = CGRectMake(260.0f, 20.0f, 40.0f, 40.0f);
        addButton.tag = 102;
        [addButton setTitle:@"+" forState:UIControlStateNormal];
        addButton.backgroundColor = [UIColor redColor];
        [addButton addTarget:self action:@selector(buttonTouch:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:addButton];
    }
    return self;
}
- (void)buttonTouch:(UIButton *)sender{
    if (sender.tag == 101) {
        self.model.collectionNumber --;
    }else{
        self.model.collectionNumber ++;
    }
    self.model = self.model;
    
    
}


- (void)setModel:(Products *)model
{
    _model  = model;
    
    numberLabel.text =  [NSString stringWithFormat:@"%d",model.collectionNumber];
    [contentImage sd_setImageWithURL:[NSURL URLWithString:_model.taobaoPicUrl]];
    
}

@end
