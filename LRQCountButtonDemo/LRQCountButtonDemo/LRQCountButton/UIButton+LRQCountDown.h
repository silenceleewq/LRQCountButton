//
//  UIButton+LRQCountDown.h
//  UITest
//
//  Created by lirenqiang on 2018/3/10.
//  Copyright © 2018年 lirenqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString *(^LRQButtonPerAction)(NSUInteger time, BOOL finished);

@interface UIButton (LRQCountDown)

- (void)lrq_actionTimes:(NSUInteger)times ForPerTimeAction:(LRQButtonPerAction)perAction;

- (void)lrq_stop;

@end
