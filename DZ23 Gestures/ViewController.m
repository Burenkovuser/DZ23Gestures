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
    self.imageView = imageView; //без этого не было движения
    
    
    //чтобы передвигать в место куда сделан клик
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    
    tapGesture.delegate = self;
    
    //двойной клик (убирает картинку - останавливает анимацию)
    
    UITapGestureRecognizer *doubleTapGuesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    doubleTapGuesture.numberOfTapsRequired = 2;
    
    [self.view addGestureRecognizer:doubleTapGuesture];
    
    
   UITapGestureRecognizer *doubleTapTouchGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:
                                                    @selector(handleDoubleTapDoubleTouch:)];
    doubleTapTouchGesture.numberOfTapsRequired = 2; //два клика
    doubleTapTouchGesture.numberOfTouchesRequired = 2; //два тача
    
    [self.view addGestureRecognizer:doubleTapTouchGesture];
    
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRighSwipeGesture:)];
    
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
    
  
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Gestures

//реализация метода передвижения за тэпом
-(void) handleTap :(UITapGestureRecognizer*) tapGesture {
    CGPoint pointCenter = [tapGesture locationInView:self.view];
    [UIView animateWithDuration:0.3
                            delay:0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionBeginFromCurrentState
                            animations:^{
                            self.imageView.center = pointCenter;
                            }
     completion:^(BOOL finished) {
         
                 }];
}
// прерываем анимацию по двойному клику(имя селектора и имя объекта)?? как сделать чтобы анимированая картинка не останваливалась??
-(void)handleDoubleTap:(UITapGestureRecognizer*) doubleTapGuesture {
    self.imageView.center = self.view.center;
    [self.imageView stopAnimating]; //for key останавливать по ключу
}
//двойной клик и два тача переводит картинку в центр
-(void) handleDoubleTapDoubleTouch:(UITapGestureRecognizer*) doubleTapTouchGesture {
    self.imageView.center = self.view.center;
    [self.imageView.layer removeAllAnimations];
}
// поворот по часовой стрелке
-(void) handleRighSwipeGesture:(UISwipeGestureRecognizer*) rightSwipeGesture {
    [self rotateView:self.imageView withRotationDuration:1 andAngle:3.14];
    
}

-(void) rotateView:(UIView*) view withRotationDuration:(int) duration andAngle:(CGFloat) angle {
    CGAffineTransform currentTransform = view.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, angle);;
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         view.transform = newTransform;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:duration
                                               delay:0
                                             options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionBeginFromCurrentState
                                          animations:^{
                                              view.transform =CGAffineTransformRotate(currentTransform, angle);
                                          } completion:^(BOOL finished) {
                                              
                                          }];
                     }];
    
}
// поддержка всех жестов
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
