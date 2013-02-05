//
//  ViewController.m
//  UIAlert
//
//  Created by Neil on 13/1/30.
//  Copyright (c) 2013年 Neil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize messageTextField1;
@synthesize messageTextField2;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)yesButtonTitle
{
    return @"YES";
}

-(NSString *)noButtonTitle
{
    return @"NO";
}

-(IBAction)onUpInsideNormalAlertButton:(id)sender
{
    alertViewNormal = [[[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:self cancelButtonTitle:[self noButtonTitle] otherButtonTitles:[self yesButtonTitle], nil] autorelease];
    [alertViewNormal show];
}

-(IBAction)onUpInsidePlainTextStyleAlertButton:(id)sender
{
    alertViewPlainTextStyle = [[[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:self cancelButtonTitle:[self noButtonTitle] otherButtonTitles:[self yesButtonTitle], nil] autorelease];
    //[alertViewPlainTextStyle setAlertViewStyle:UIAlertViewStylePlainTextInput];
    //[alertViewPlainTextStyle setAlertViewStyle:UIAlertViewStyleSecureTextInput];
    [alertViewPlainTextStyle setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    
    UITextField *textfield = [alertViewPlainTextStyle textFieldAtIndex:0];
    textfield.keyboardType = UIKeyboardTypeNumberPad;
    [alertViewPlainTextStyle show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"alertView:%@",alertView);
    NSLog(@"alertView:%d",buttonIndex);
    
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([alertView isEqual:alertViewNormal])
    {
        if ([title isEqualToString:[self yesButtonTitle]])
            NSLog(@"Click YES Button");
        else
            NSLog(@"Click NO Button");
    }
    else if ([alertView isEqual:alertViewPlainTextStyle])
    {
        if ([title isEqualToString:[self yesButtonTitle]])
        {
            NSLog(@"Click YES Button");
            UITextField *textfield1 = [alertViewPlainTextStyle textFieldAtIndex:0];
            UITextField *textfield2 = [alertViewPlainTextStyle textFieldAtIndex:1];
            [messageTextField1 setText:textfield1.text];
            [messageTextField2 setText:textfield2.text];
        }
        else
            NSLog(@"Click NO Button");
    }
    
}

@end
