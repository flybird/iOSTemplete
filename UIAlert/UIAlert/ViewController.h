//
//  ViewController.h
//  UIAlert
//
//  Created by Neil on 13/1/30.
//  Copyright (c) 2013年 Neil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>
{
@private
    UIAlertView *alertViewNormal;
    UIAlertView *alertViewPlainTextStyle;
    IBOutlet UITextField *messageTextField1;
    IBOutlet UITextField *messageTextField2;
}

@property(nonatomic,retain) UITextField *messageTextField1;
@property(nonatomic,retain) UITextField *messageTextField2;

-(NSString *)yesButtonTitle;
-(NSString *)noButtonTitle;
-(IBAction)onUpInsideNormalAlertButton:(id)sender;
-(IBAction)onUpInsidePlainTextStyleAlertButton:(id)sender;

@end
