//
//  SwipeViewController.m
//  2w2d4_iOSGestures
//
//  Created by Seantastic31 on 05/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@property (nonatomic) BOOL centered;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 380;
    CGFloat height = 50;
    
    UIView *backview = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - width/2, width, height)];
    backview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:backview];
    backview.clipsToBounds = YES;
    
    UIView *frontview = [[UIView alloc]initWithFrame:backview.bounds];
    frontview.backgroundColor = [UIColor yellowColor];
    [backview addSubview:frontview];
    
    // add swipe gesture
    UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc]
                                          initWithTarget:self
                                                  action:@selector(viewSwiped:)];
    // add recognizer to frontview
    swipeGestureLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [frontview addGestureRecognizer:swipeGestureLeft];
    
    UISwipeGestureRecognizer *swipeGestureRight = [[UISwipeGestureRecognizer alloc]
                                          initWithTarget:self
                                                  action:@selector(viewSwiped:)];
    // add recognizer to frontview
    swipeGestureRight.direction = UISwipeGestureRecognizerDirectionRight;
    [frontview addGestureRecognizer:swipeGestureRight];
    
    self.centered = YES;
    
}

- (void)viewSwiped:(UISwipeGestureRecognizer*)sender
{
    // set switch for direction
    switch (sender.direction) {
        // left swipe to move frontView to left if swipe past center of bar
        case UISwipeGestureRecognizerDirectionLeft:
        {
            if (self.centered == YES)
            {
                sender.view.transform = CGAffineTransformMakeTranslation(-200, 0);
                self.centered = NO;
            }
            else
            {
                sender.view.transform = CGAffineTransformMakeTranslation(0, 0);
                self.centered = YES;
            }
            break;
        }
            
        // right swipe to move frontView to left if swipe past center of bar
        case UISwipeGestureRecognizerDirectionRight:
        {
            if (self.centered == YES)
            {
                sender.view.transform = CGAffineTransformMakeTranslation(200, 0);
                self.centered = NO;
            }
            else
            {
                sender.view.transform = CGAffineTransformMakeTranslation(0, 0);
                self.centered = YES;
            }
            break;
        }
        default:
            NSLog(@"Error");
    }
}


@end
