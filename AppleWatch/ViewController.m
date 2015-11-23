//
//  ViewController.m
//  AppleWatch
//
//  Created by imac on 15/11/23.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIImageView *clockImage;
@property(nonatomic,strong)CALayer *layerSec;
@property(nonatomic,strong)CALayer *layerMin;
@property(nonatomic,strong)CALayer *layerHou;

@property(nonatomic,strong)CADisplayLink *displayLink;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.clockImage];
    [self.clockImage.layer addSublayer:self.layerHou];
    [self.clockImage.layer addSublayer:self.layerMin];
    [self.clockImage.layer addSublayer:self.layerSec];
    [self drawPoint];
    [self timeChange];
    
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
    
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
}

-(void)drawPoint{

    CALayer *layer = [CALayer layer];
    layer.bounds = (CGRect){0,0,16,16};
    layer.position = (CGPoint){3,80};
    layer.cornerRadius = 8;
    layer.backgroundColor = [UIColor colorWithWhite:.7 alpha:1].CGColor;
    [self.layerSec addSublayer:layer];
}

-(void)timeChange{

    CGFloat anglePerSec = M_PI*2/60.0;
    CGFloat anglePermin = M_PI*2/60.0;
    CGFloat anglePerHou = M_PI*2/12.0;
    
    CGFloat angleSec = [[NSCalendar currentCalendar] component:NSCalendarUnitSecond fromDate:[NSDate date]] * anglePerSec;
    CGFloat angleMin = [[NSCalendar currentCalendar] component:NSCalendarUnitMinute fromDate:[NSDate date]] * anglePermin + angleSec/60.0;
    CGFloat angleHou = [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:[NSDate date]] * anglePerHou + anglePermin/12.0;
    
    self.layerSec.transform = CATransform3DMakeRotation(angleSec, 0, 0, 1);
    self.layerMin.transform = CATransform3DMakeRotation(angleMin, 0, 0, 1);
    self.layerHou.transform = CATransform3DMakeRotation(angleHou, 0, 0, 1);
}

-(CALayer*)layerSec{
    if (_layerSec == nil) {
        
        _layerSec = [CALayer layer];
        _layerSec.bounds = (CGRect){0,0,3,80};
        _layerSec.backgroundColor = [UIColor redColor].CGColor;
        _layerSec.position = (CGPoint){self.clockImage.bounds.size.width/2 ,self.clockImage.bounds.size.height/2};
        _layerSec.anchorPoint = (CGPoint){0.5,1};
        _layerSec.cornerRadius = 1.5;
    }
    return _layerSec;
}

-(CALayer*)layerMin{

    if (_layerMin == nil) {
        
        _layerMin = [CALayer layer];
        _layerMin.bounds = (CGRect){0,0,5,70};
        _layerMin.backgroundColor = [UIColor blackColor].CGColor;
        _layerMin.position = (CGPoint){self.clockImage.bounds.size.width/2 ,self.clockImage.bounds.size.height/2};
        _layerMin.anchorPoint = (CGPoint){0.5,1};
        _layerMin.cornerRadius = 10;

    }
    return _layerMin;
}

-(CALayer*)layerHou{

    if (_layerHou == nil) {
        
        _layerHou = [CALayer layer];
        _layerHou.bounds = (CGRect){0,0,7,50};
        _layerHou.backgroundColor = [UIColor blackColor].CGColor;
        _layerHou.position = (CGPoint){self.clockImage.bounds.size.width/2 ,self.clockImage.bounds.size.height/2};
        _layerHou.anchorPoint = (CGPoint){0.5,1};
        _layerHou.cornerRadius = 15;
    }
    return _layerHou;
}

-(UIImageView*)clockImage{
    
    if (_clockImage == nil) {
        
        _clockImage = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
        _clockImage.image = [UIImage imageNamed:@"钟表"];
        
    }
    return _clockImage;
}



@end
