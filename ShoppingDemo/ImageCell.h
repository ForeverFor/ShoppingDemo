//
//  ImageCell.h
//  UICollectionViewDemo
//
//  Created by 1 on 15/10/26.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
@interface ImageCell : UICollectionViewCell
{
    UIImageView *contentImage;

}
@property (nonatomic,strong) Products *model;
@end
