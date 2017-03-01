//
//  ViewController.m
//  KSRecordButton
//
//  Created by 康帅 on 17/2/28.
//  Copyright © 2017年 Bujiaxinxi. All rights reserved.
//

#import "ViewController.h"
#import "KSRecordButton.h"

@interface ViewController (){
    BOOL _btnStatue;
}
@property(nonatomic,strong)KSRecordButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _btnStatue=NO;
    
    _btn=[[KSRecordButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    _btn.center=self.view.center;
    [_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
}

-(void)click{
    _btnStatue=!_btnStatue;
    [_btn animationWithStatue:_btnStatue];
}

@end
