//
//  ViewController.m
//  Hide iOS Password
//
//  Created by Tim Herbig on 11/01/14.
//  Copyright (c) 2014 Tim Herbig. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGSize hideShowSize = [@"SHOWX" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}];
    UIButton *hideShow = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, hideShowSize.width, self.password.frame.size.height)];
    [hideShow.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [hideShow setTitle:@"HIDE" forState:UIControlStateNormal];
    [hideShow setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.password.rightView = hideShow;
    self.password.rightViewMode = UITextFieldViewModeAlways;
    [hideShow addTarget:self action:@selector(hideShow:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)hideShow:(id)sender
{
    UIButton *hideShow = (UIButton *)self.password.rightView;
    if (!self.password.secureTextEntry)
    {
        self.password.secureTextEntry = YES;
        [hideShow setTitle:@"SHOW" forState:UIControlStateNormal];
    }
    else
    {
        self.password.secureTextEntry = NO;
        [hideShow setTitle:@"HIDE" forState:UIControlStateNormal];
    }
    [self.password becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
