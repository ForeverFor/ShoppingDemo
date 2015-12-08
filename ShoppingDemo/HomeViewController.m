//
//  HomeViewController.m
//  ShoppingDemo
//
//  Created by 1 on 15/12/3.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "HomeViewController.h"
#import "ImageCell.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.title = @"首页";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UICollectionViewWaterfallLayout *layout = [UICollectionViewWaterfallLayout new];
    layout.columnCount = 2;
    layout.sectionInset = UIEdgeInsetsMake(200, 5, 0, 5);
    layout.itemWidth = 150;
    layout.delegate = self;
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell_1"];

    [_collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"cell_2"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.yuike.com/beautymall/api/1.0/product/quality.php?cursor=0&yk_pid=1&yk_cbv=2.8.4.2&count=40&yk_user_id=2061882&yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&type=choice" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        _baseClass = [BaseClass modelObjectWithDictionary:responseObject];
        [_collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)
    section
{
    return self.baseClass.data.products.count+1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_1" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        return cell;
    }
    ImageCell *cell = (ImageCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell_2" forIndexPath:indexPath];

    cell.model = self.baseClass.data.products[indexPath.row-1];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return;
    }
    Products *products = self.baseClass.data.products[indexPath.row - 1];
    
    [SQLManager insertNewData:products];
    
    
}
#pragma mark - UICollectionViewDelegateWaterfallLayout
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewWaterfallLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 60.0f;
    }
    return 200;
}
@end
