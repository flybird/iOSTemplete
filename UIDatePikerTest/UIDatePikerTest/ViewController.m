//
//  ViewController.m
//  UIDatePikerTest
//
//  Created by Flybird on 12/3/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize datePicker;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSDate *date = [NSDate new];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //NSDate *maxdate = [dateFormatter dateFromString:@"2012-01-01"];
    NSDate *mindate = [dateFormatter dateFromString:@"1900-01-01"];
    [datePicker setMaximumDate:date];
    [datePicker setMinimumDate:mindate];
    [datePicker setDate:date];
    
    NSLog(@"calender:%@",datePicker.calendar.locale.currentLocale);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
