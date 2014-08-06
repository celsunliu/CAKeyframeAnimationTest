//
//  KFTestViewController.m
//  CAKeyframeAnimationTest
//
//  Created by Liulexun on 14-8-5.
//  Copyright (c) 2014年 ajk. All rights reserved.
//

#import "KFTestViewController.h"

@interface KFTestViewController ()
@property (nonatomic, strong)UIView *blockView;

@end

@implementation KFTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.blockView = [[UIView alloc] initWithFrame:CGRectMake(130, 200, 40, 40)];
    self.blockView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blockView];
    
    UIButton *moveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [moveButton setFrame:CGRectMake(100, 40, 70, 40)];
    [moveButton setTitle:@"move" forState:UIControlStateNormal];
    [moveButton addTarget:self action:@selector(move) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:moveButton];
    
    UIButton *transformButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [transformButton setFrame:CGRectMake(100, 90, 70, 40)];
    [transformButton setTitle:@"transform" forState:UIControlStateNormal];
    [transformButton addTarget:self action:@selector(transform) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:transformButton];
}

- (void)move
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50.0, 120.0);
    CGPathAddLineToPoint(path, NULL, 60, 130);
    CGPathAddLineToPoint(path, NULL, 70, 140);
    CGPathAddLineToPoint(path, NULL, 80, 150);
    CGPathAddLineToPoint(path, NULL, 90, 160);
    CGPathAddLineToPoint(path, NULL, 100, 170);
    CGPathAddCurveToPoint(path, NULL, 50, 275, 150, 272, 70, 120);
    CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,90.0,120.0);
    CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,110.0,120.0);
    CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,130.0,120.0);
    //以position为关键字，创建实例
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //设置path属性
    [animation setPath:path];
    [animation setDuration:3.0];
    //这句代码表示是否回到原位
    [animation setAutoreverses:YES];
    CFRelease(path);
    [self.blockView.layer addAnimation:animation forKey:NULL];
}

- (void)transform
{
    /*放大缩小*/
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //动画选项设定
    animation.duration = 0.15;
    animation.repeatCount = 2;
    animation.autoreverses = YES;
    //缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:1.0];//开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:1.1];//结束时的倍率
    [self.blockView.layer addAnimation:animation forKey:@"scale-layer"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
