//
//  AppDelegate.m
//  ShoppingDemo
//
//  Created by 1 on 15/12/3.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "ShoppingViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    HomeViewController *homeVC = [HomeViewController new];
    ShoppingViewController *shoppingVC = [ShoppingViewController new];
    
    UITabBarController *tabBarVC = [UITabBarController  new];
    tabBarVC.viewControllers = @[homeVC,shoppingVC];
    self.window.rootViewController = tabBarVC;
    
    return YES;
}

@end
