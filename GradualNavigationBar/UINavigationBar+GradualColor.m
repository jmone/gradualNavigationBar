//
//  UINavigationBar+GradualColor.m
//  GradualNavigationBar
//
//  Created by yangyang on 15/9/7.
//  Copyright (c) 2015年 yang. All rights reserved.
//

#import "UINavigationBar+GradualColor.h"
#import <objc/runtime.h>

@implementation UINavigationBar (GradualColor)

static char BGViewKey;

-(UIView *)bgView{
    return objc_getAssociatedObject(self, &BGViewKey);
}

-(void)setBgView:(UIView *)bgView{
    objc_setAssociatedObject(self, &BGViewKey, bgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setNavigationBarBackgroundColor:(UIColor *)color{
    if (!self.bgView) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        self.bgView.userInteractionEnabled = NO;
        [self insertSubview:self.bgView atIndex:0];
    }
    self.bgView.backgroundColor = color;
    

}

@end
