//
//  UIButton+LRQCountDown.m
//  UITest
//
//  Created by lirenqiang on 2018/3/10.
//  Copyright © 2018年 lirenqiang. All rights reserved.
//

#import "UIButton+LRQCountDown.h"
#import <objc/runtime.h>
@interface UIButton ()
@property (strong, nonatomic) NSTimer *timer;
@property (copy, nonatomic) LRQButtonPerAction perAction;
@property (assign, nonatomic) NSUInteger times;
@end

@implementation UIButton (LRQCountDown)

- (void)lrq_actionTimes:(NSUInteger)times ForPerTimeAction:(LRQButtonPerAction)perAction {
    self.perAction = perAction;
    self.times = times;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeState) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
    //modify
}

- (void)changeState {
    NSString *title;
    if (self.times > 1) {
        self.times--;
        title = self.perAction(self.times, NO);
    } else {
        title = self.perAction(0, YES);
        [self lrq_stop];
    }
    
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)lrq_stop {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)setTimes:(NSUInteger)times {
    objc_setAssociatedObject(self, @selector(times), @(times), OBJC_ASSOCIATION_ASSIGN);
}

- (NSUInteger)times {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setTimer:(NSTimer *)timer {
    objc_setAssociatedObject(self, @selector(timer), timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimer *)timer {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setPerAction:(LRQButtonPerAction)perAction {
    objc_setAssociatedObject(self, @selector(perAction), perAction, OBJC_ASSOCIATION_COPY);
}

- (LRQButtonPerAction)perAction {
    return objc_getAssociatedObject(self, _cmd);
}

@end
