//
//  ViewController.m
//  UISwitch
//
//  Created by Neil on 13/2/3.
//  Copyright (c) 2013年 Neil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize slider;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.slider = [[UISwitch alloc] initWithFrame:CGRectMake(100,100, 100, 100)];
    [self.view addSubview:self.slider];
    
    [self.slider addTarget:self action:@selector(onSwitchIsOn:) forControlEvents:UIControlEventValueChanged];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)onSwitchIsOn:(UISwitch*)sender
{
    NSLog(@"sender is:\n%@",sender);
    
    if (sender.isOn) {
        NSLog(@"on");
    }else
    {
        NSLog(@"off");
    }
}

@end
