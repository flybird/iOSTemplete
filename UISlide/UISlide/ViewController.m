//
//  ViewController.m
//  UISlide
//
//  Created by Neil on 13/2/3.
//  Copyright (c) 2013年 Neil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mySlider;

- (void)viewDidLoad
{
    [super viewDidLoad];

    float tw = 200.0f;
    float th = 23.0f;
    float tx = (self.view.frame.size.width - 200)/2;
    float ty = 200;
    self.view.backgroundColor = [UIColor grayColor];
    self.mySlider = [[UISlider alloc] initWithFrame:CGRectMake(tx,ty,tw,th)];
    self.mySlider.minimumValue = 0.0f;
    self.mySlider.maximumValue = 100.0f;
    self.mySlider.value = self.mySlider.maximumValue/2;
    self.mySlider.continuous = NO;
    [self.mySlider setThumbImage:[UIImage imageNamed:@"ThumbNormal.png"] forState:UIControlStateNormal];
    [self.mySlider setThumbImage:[UIImage imageNamed:@"ThumbHighlighted.png"] forState:UIControlStateHighlighted];
    [self.view addSubview:self.mySlider];
    [self.mySlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)sliderValueChanged:(UISwitch*)sender
{
    NSLog(@"sender is:\n%@",sender);
    
    if ([sender isEqual:self.mySlider]) {
        NSLog(@"slider value:%f",self.mySlider.value);
    }
}

@end
