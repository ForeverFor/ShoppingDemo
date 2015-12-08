//
//  ShoppingViewController.h
//  ShoppingDemo
//
//  Created by 1 on 15/12/3.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "DataModels.h"
#import "ShoppingCell.h"
@interface ShoppingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{

    UITableView *_tview;
}
@property (nonatomic,copy) NSArray *dataModels;
@end
