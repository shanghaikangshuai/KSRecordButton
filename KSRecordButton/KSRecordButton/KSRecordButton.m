//
//  KSRecordButton.m
//  KSRecordButton
//
//  Created by 康帅 on 17/2/28.
//  Copyright © 2017年 Bujiaxinxi. All rights reserved.
//

#import "KSRecordButton.h"

const int lineW =3;
const int marginInOut =2;

@interface KSRecordButton()

@property(strong,nonatomic)CAShapeLayer *borderLayer;

@property(strong,nonatomic)CAShapeLayer *animationLayer;

@end

@implementation KSRecordButton
/*
 ** 构造方法
 */
-(instancetype)init{
    self=[super init];
    if (self) {
        [self commonInit];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}
/*
 ** 初始化参数
 */
-(void)commonInit{
    [self.layer addSublayer:self.borderLayer];
    [self.layer addSublayer:self.animationLayer];
}

-(void)animationWithStatue:(BOOL)RecordStatue{
    //从需求可以看出是尺寸和圆角弧度两个属性同时动画，考虑用CAAnimationGroup
    CABasicAnimation *cornerRadiusAni=[CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    CABasicAnimation *boundsAni=[CABasicAnimation animationWithKeyPath:@"bounds"];
    
    cornerRadiusAni.fromValue=@(self.animationLayer.cornerRadius);
    boundsAni.fromValue=[NSValue valueWithCGRect:self.animationLayer.bounds];
    
    CGRect bounds=self.animationLayer.bounds;
    
    CGFloat LINEW=self.bounds.size.width*lineW/100;
    CGFloat MARGININOUT=self.bounds.size.width*marginInOut/100;
    
    if(RecordStatue==RecordStatueBegin){
        cornerRadiusAni.toValue=@(self.bounds.size.width*5/100);
        bounds.size.width=self.bounds.size.width/2;
        bounds.size.height=self.bounds.size.height/2;
        boundsAni.toValue=[NSValue valueWithCGRect:bounds];
        self.animationLayer.cornerRadius=self.bounds.size.width*5/100;
        self.animationLayer.bounds=bounds;
    }else if (RecordStatue==RecordStatueEnd){
        bounds.size.width=self.bounds.size.width-(LINEW+MARGININOUT)*2;
        bounds.size.height=self.bounds.size.height-(LINEW+MARGININOUT)*2;
        boundsAni.toValue=[NSValue valueWithCGRect:bounds];
        cornerRadiusAni.toValue=@(bounds.size.width/2);
        self.animationLayer.cornerRadius=bounds.size.width/2;
        self.animationLayer.bounds=bounds;
    }
    
    CAAnimationGroup *animGroup=[CAAnimationGroup animation];
    animGroup.animations=@[cornerRadiusAni,boundsAni];
    animGroup.duration=self.bounds.size.width*0.3/100;
    
    [self.animationLayer addAnimation:animGroup forKey:nil];
}
#pragma 懒加载
-(CAShapeLayer *)borderLayer{
    if (!_borderLayer) {
        CGFloat LINEW=self.bounds.size.width*lineW/100;
        
        _borderLayer=[CAShapeLayer layer];
        _borderLayer.frame=self.bounds;
        _borderLayer.borderColor=[UIColor grayColor].CGColor;
        _borderLayer.borderWidth=LINEW;
        _borderLayer.cornerRadius=_borderLayer.frame.size.width/2;
    }
    return _borderLayer;
}
-(CAShapeLayer *)animationLayer{
    if (!_animationLayer) {
        CGFloat LINEW=self.bounds.size.width*lineW/100;
        CGFloat MARGININOUT=self.bounds.size.width*marginInOut/100;
        
        _animationLayer=[CAShapeLayer layer];
        _animationLayer.frame=CGRectMake(LINEW+MARGININOUT, LINEW+MARGININOUT, self.bounds.size.width-(LINEW+MARGININOUT)*2, self.bounds.size.height-(LINEW+MARGININOUT)*2);
        _animationLayer.backgroundColor=[UIColor redColor].CGColor;
        _animationLayer.cornerRadius=_animationLayer.frame.size.width/2;
    }
    return _animationLayer;
}
@end
