//
//  ViewController.m
//  DZ23 Gestures
//
//  Created by Vasilii on 23.01.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

@property(weak,nonatomic) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"walk a.png"],[UIImage imageNamed:@"walk b.png"], [UIImage imageNamed:@"walk c.png"], [UIImage imageNamed:@"walk d.png"], nil];
    
    imageView.animationDuration = 1/2.f;
    [imageView startAnimating];
    
    imageView.autoresizingMask=  UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
   
    [self.view addSubview:imageView];
    self.imageView = imageView; //без этого не двигалось
    
    
#pragma mark - Gestures

    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    
    tapGesture.delegate = self;
  
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) handleTap :(UITapGestureRecognizer*) tapGesture {
    CGPoint pointCenter = [tapGesture locationInView:self.view];
    [UIView animateWithDuration:0.3
     
                        animations:^{
                            //self.imageView.center = [tapGesture locationInView:self.view];
                            self.imageView.center = pointCenter;
                        }];
    

}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
