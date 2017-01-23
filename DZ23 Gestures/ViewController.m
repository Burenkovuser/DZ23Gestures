//
//  ViewController.m
//  DZ23 Gestures
//
//  Created by Vasilii on 23.01.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"walk a.png"],[UIImage imageNamed:@"walk b.png"], [UIImage imageNamed:@"walk c.png"], [UIImage imageNamed:@"walk d.png"], nil];
    
    imageView.animationDuration = 1/2.f;
    [imageView startAnimating];
   
    [self.view addSubview:imageView];
    
  
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
