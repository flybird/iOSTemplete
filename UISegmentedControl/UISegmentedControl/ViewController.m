//
//  ViewController.m
//  UISegmentedControl
//
//  Created by Neil on 13/2/3.
//  Copyright (c) 2013年 Neil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mySegmentedControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"iPad.png"];
    
    self.view.backgroundColor = [UIColor grayColor];
    NSArray *segments = [[NSArray alloc] initWithObjects:@"iPhone",@"iPad",@"iPod",@"iMac",image, nil];
    self.mySegmentedControl = [[UISegmentedControl alloc] initWithItems:segments];
    //self.mySegmentedControl.momentary = YES;
    self.mySegmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
    self.mySegmentedControl.selectedSegmentIndex = 2;
    [self.mySegmentedControl addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.mySegmentedControl];
    
    
    CGRect segmentSize = self.mySegmentedControl.frame;
    segmentSize.size.height = 64.f;
    segmentSize.size.width = 300;
    self.mySegmentedControl.frame = segmentSize;
    self.mySegmentedControl.center = self.view.center;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)segmentChanged:(UISegmentedControl*)sender
{
    if ([sender isEqual:self.mySegmentedControl])
    {
        NSInteger index = [sender selectedSegmentIndex];
        NSString *selectSegmentString = [sender titleForSegmentAtIndex:index];
        NSLog(@"segment index:%d,and Tiltle:%@",index,selectSegmentString);
    }
}


@end
