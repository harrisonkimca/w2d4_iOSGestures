//
//  RotationViewController.m
//  2w2d4_iOSGestures
//
//  Created by Seantastic31 on 05/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

// set properties for width & height to allow rotation
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.width = 100;
    self.height = 100;
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - self.width/2, CGRectGetMidY(self.view.bounds) - self.height/2, self.width, self.height)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    // add rotation gesture
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc]
                                            initWithTarget:self
                                                    action:@selector(viewRotated:)];
    [redView addGestureRecognizer:rotationGesture];
}

- (void)viewRotated:(UIRotationGestureRecognizer*)sender
{
    sender.view.transform = CGAffineTransformMakeRotation(sender.rotation);
}

@end
