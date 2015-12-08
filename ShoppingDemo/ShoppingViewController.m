//
//  ShoppingViewController.m
//  ShoppingDemo
//
//  Created by 1 on 15/12/3.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "ShoppingViewController.h"
#import "SQLManager.h"
@interface ShoppingViewController ()

@end

@implementation ShoppingViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"购物车";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _tview = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tview.delegate = self;
    _tview.dataSource = self;
    _tview.rowHeight = 120.0f;
    [_tview registerClass:[ShoppingCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tview];
}
- (void)viewWillAppear:(BOOL)animated
{
    self.dataModels = [SQLManager getDataList];
    [_tview reloadData];
}
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShoppingCell *cell = (ShoppingCell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Products *products = self.dataModels[indexPath.row];
    cell.model = products;
    return cell;
}
@end