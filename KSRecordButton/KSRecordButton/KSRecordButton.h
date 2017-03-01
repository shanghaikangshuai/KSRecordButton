//
//  KSRecordButton.h
//  KSRecordButton
//
//  Created by 康帅 on 17/2/28.
//  Copyright © 2017年 Bujiaxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(BOOL,RecordStatue) {
    RecordStatueBegin=YES,
    RecordStatueEnd=NO
};

@interface KSRecordButton : UIButton
-(void)animationWithStatue:(BOOL)RecordStatue;
@end
