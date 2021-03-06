//
//  ViewController.m
//  UINavigationController
//
//  Created by Neil on 13/2/5.
//  Copyright (c) 2013年 Neil. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"first view controller";
    
    UISwitch *uiswitch = [[UISwitch alloc] init];
    uiswitch.on = YES;
    [uiswitch addTarget:self action:@selector(switchIsChanged:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:uiswitch];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self performSelector:@selector(pushSecondViewController) withObject:nil afterDelay:2.0f];
}

- (void)switchIsChanged:(id*)sender
{
    NSLog(@"ViewController switchIsChanged fun");
}

- (void)pushSecondViewController
{
    SecondViewController *view = [[SecondViewController alloc] initWithNibName:nil bundle:NULL];
    [self.navigationController pushViewController:view animated:YES];
}
@end
