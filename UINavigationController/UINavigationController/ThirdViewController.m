//
//  ThirdViewController.m
//  UINavigationController
//
//  Created by Neil on 13/2/6.
//  Copyright (c) 2013年 Neil. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor redColor];
    self.title = @"third view controller";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //[self performSelector:@selector(goBack) withObject:nil afterDelay:3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)add:(id*)sender
{
    NSLog(@"ThirdViewController add function");
}

- (void)goBack
{
    NSLog(@"goBack 1.view controller:%d",[self.navigationController.viewControllers count]);
    NSArray *array = self.navigationController.viewControllers;
    NSMutableArray *newControllerArray = [NSMutableArray arrayWithArray:array];
    [newControllerArray removeLastObject];
    [self.navigationController setViewControllers:newControllerArray animated:YES];
    NSLog(@"goBack 2.view controller:%d",[self.navigationController.viewControllers count]);
}
@end
