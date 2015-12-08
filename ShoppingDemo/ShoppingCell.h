//
//  ShoppingCell.h
//  ShoppingDemo
//
//  Created by 1 on 15/12/3.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
#import "UIImageView+WebCache.h"

@interface ShoppingCell : UITableViewCell
{
    UIImageView *contentImage;
    UILabel *numberLabel;
}

@property (nonatomic,strong) Products *model;
@end
