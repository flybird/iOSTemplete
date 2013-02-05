//
//  ViewController.m
//  UIPicker
//
//  Created by Neil on 13/2/3.
//  Copyright (c) 2013年 Neil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myPicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.myPicker = [[UIPickerView alloc] init];
    self.myPicker.center = self.view.center;
    self.myPicker.dataSource = self;
    self.myPicker.delegate = self;
    self.myPicker.showsSelectionIndicator = YES;
    [self.view addSubview:self.myPicker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - implement UIPickerViewDataSource delegate

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSInteger result = 0;
    if ([pickerView isEqual:self.myPicker])
    {
        result = 1;
    }
    return result;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger result = 0;
    
    if ([pickerView isEqual:self.myPicker])
    {
        result = 10;
    }
    return result;
    
}

#pragma mark - implement UIPickerViewDelegate delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *result = nil;
    if ([pickerView isEqual:self.myPicker])
    {
        return [NSString stringWithFormat:@"index:%ld",(long)row+1];
    }
    return result;
}

@end
