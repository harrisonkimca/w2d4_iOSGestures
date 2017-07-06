//
//  TapViewController.m
//  2w2d4_iOSGestures
//
//  Created by Seantastic31 on 05/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // create box
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    
    // add tap gesture
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(colorChanged:)];
    [view addGestureRecognizer:tapGesture];
}

- (void)colorChanged:(UITapGestureRecognizer*)sender
{
    UIColor *defaultColor = sender.view.backgroundColor;
    UIColor *newColor = [defaultColor isEqual:[UIColor yellowColor]] ? [UIColor blueColor] : [UIColor yellowColor];
    sender.view.backgroundColor = newColor;
}


@end
