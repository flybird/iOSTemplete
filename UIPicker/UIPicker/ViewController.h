//
//  ViewController.h
//  UIPicker
//
//  Created by Neil on 13/2/3.
//  Copyright (c) 2013年 Neil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong)UIPickerView *myPicker;
@end
