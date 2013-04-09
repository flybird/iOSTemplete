//
//  AppDelegate.h
//  UITabBarController
//
//  Created by Neil on 13/4/9.
//  Copyright (c) 2013年 Neil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FirstViewController;
@class SecondViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) UINavigationController *firstNavigation;
@property (nonatomic,strong) FirstViewController *firstView;
@property (nonatomic,strong) UINavigationController *secondNavigation;
@property (nonatomic,strong) SecondViewController *secondView;

@property (nonatomic,strong) UITabBarController *tabBar;

@end

