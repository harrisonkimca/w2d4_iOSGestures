//
//  PinchViewController.m
//  2w2d4_iOSGestures
//
//  Created by Seantastic31 on 05/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()

// use property to store the recognizer
@property (strong, nonatomic) UIPinchGestureRecognizer *pinchGesture;

@end

@implementation PinchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
    
    // add pinch gesture
    self.pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(viewPinched:)];
    [view addGestureRecognizer:self.pinchGesture];
}

- (void)viewPinched:(UIPinchGestureRecognizer*)sender
{
    CGFloat scale = sender.scale;
    sender.view.transform = CGAffineTransformMakeScale(scale, scale);
    scale = 1.0;
}


@end
