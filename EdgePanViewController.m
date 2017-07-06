//
//  EdgePanViewController.m
//  2w2d4_iOSGestures
//
//  Created by Seantastic31 on 05/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "EdgePanViewController.h"

@interface EdgePanViewController () <UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIView *sideRectangle;
@property (nonatomic) CGRect frameOrigin;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

// create properties for recognizers since will need to store (also using two similar ones)
@property (strong, nonatomic) UIScreenEdgePanGestureRecognizer *edgePanRecognizer;
@property (strong, nonatomic) UIPanGestureRecognizer *panBack;

@end

@implementation EdgePanViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _width = 500;
        _height = 300;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.width = 500;
    self.height = 300;
    
    self.frameOrigin = CGRectMake(400, CGRectGetMidY(self.view.bounds) - self.height/2, self.width, self.height);
    self.sideRectangle = [[UIView alloc]initWithFrame:self.frameOrigin];
    self.sideRectangle.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.sideRectangle];
    
    // add screen pan gesture recognizer
    self.edgePanRecognizer = [[UIScreenEdgePanGestureRecognizer alloc]
                                            initWithTarget:self
                                                    action:@selector(viewEdgePanned:)];
    self.edgePanRecognizer.edges = UIRectEdgeRight;
    self.edgePanRecognizer.delegate = self;
    
    [self.sideRectangle addGestureRecognizer:self.edgePanRecognizer];
    
    // *** add panback here now (will need to add and then remove)
    self.panBack = [[UIPanGestureRecognizer alloc]
                                    initWithTarget:self
                                            action:@selector(panBackToEdge:)];
}

- (void)viewEdgePanned:(UIScreenEdgePanGestureRecognizer*)sender
{
    if (sender.state == UIGestureRecognizerStateChanged)
    {
        CGPoint locationInView = [sender translationInView:sender.view];
        CGPoint oldCenter = sender.view.center;
        CGPoint newCenter = CGPointMake(oldCenter.x + locationInView.x, oldCenter.y);
        
        [sender setTranslation:CGPointZero inView:self.view];
        sender.view.center = newCenter;
    }
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        if (self.sideRectangle.frame.origin.x > 300)
        {
            self.sideRectangle.frame = self.frameOrigin;
        }
        else
        {
            CGRect newOrigin = CGRectMake(100, CGRectGetMidY(self.view.bounds) - self.height/2, self.width, self.height);
            self.sideRectangle.frame = newOrigin;
            
            
            [self.sideRectangle addGestureRecognizer:self.panBack];
        }
    }
}


- (void)panBackToEdge:(UIPanGestureRecognizer*)sender
{
    CGPoint locationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + locationInView.x, oldCenter.y);
    
    if (self.sideRectangle.frame.origin.x > 200)
    {
        self.sideRectangle.frame = self.frameOrigin;
        // remove the panback recognizer to not confuse the edgepan recognizer
        [self.sideRectangle removeGestureRecognizer:self.panBack];
    }
    else
    {
        [sender setTranslation:CGPointZero inView:self.view];
        sender.view.center = newCenter;
    }
}
    
    
@end
