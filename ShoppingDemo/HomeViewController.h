//
//  HomeViewController.h
//  ShoppingDemo
//
//  Created by 1 on 15/12/3.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "UICollectionViewWaterfallLayout.h"
#import "DataModels.h"
#import "SQLManager.h"
@interface HomeViewController : UIViewController<UICollectionViewDelegateWaterfallLayout,UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *_collectionView ;
}
@property (nonatomic,strong) BaseClass *baseClass;
@end
