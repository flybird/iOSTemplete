//
//  ViewController.m
//  UIDataPicker
//
//  Created by Neil on 13/2/3.
//  Copyright (c) 2013年 Neil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myDatePicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSTimeInterval oveYearTime = 365*24*60*60;
    NSDate *today = [NSDate date];
    NSDate *oneYearFromToday = [today dateByAddingTimeInterval:oveYearTime];
    NSDate *twoYearFromToday = [today dateByAddingTimeInterval:2*oveYearTime];
	self.view.backgroundColor = [UIColor grayColor];
    self.myDatePicker = [[UIDatePicker alloc] init];
    self.myDatePicker.center = self.view.center;
    self.myDatePicker.datePickerMode = UIDatePickerModeDate;
    self.myDatePicker.minimumDate = oneYearFromToday;
    self.myDatePicker.maximumDate = twoYearFromToday;
    [self.view addSubview:self.myDatePicker];
    [self.myDatePicker addTarget:self action:@selector(datePickerDateChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)datePickerDateChange:(UIDatePicker *)sender
{
    if ([sender isEqual:self.myDatePicker]) {
        NSLog(@"Select data: %@",sender.date);
    }
}

@end
