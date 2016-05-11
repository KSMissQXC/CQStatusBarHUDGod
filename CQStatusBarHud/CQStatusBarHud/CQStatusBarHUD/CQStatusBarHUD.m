//
//  CQStatusBarHUD.m
//  CQStatusBarHud
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CQStatusBarHUD.h"
#define KMessageLabelFont [UIFont systemFontOfSize:14]

@implementation CQStatusBarHUD

//定义全局公共变量
static UIWindow *window_;
static NSTimer *timer_;
static CGFloat const KStatusBarHeight = 20;
static CGFloat const KhideBarTimer = 2.0;
static CGFloat const KBarAnimationTime = 0.5;


+(void)showMessage:(NSString *)message image:(UIImage *)image{
    [timer_ invalidate];

    [self widow];
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    messageBtn.titleLabel.font = KMessageLabelFont;
    [messageBtn setTitle:message forState:UIControlStateNormal];
    messageBtn.frame = window_.bounds;
    if (image) {
        [messageBtn setImage:image forState:UIControlStateNormal];
        messageBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [window_ addSubview:messageBtn];
    
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:KhideBarTimer target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+(void)showSucess:(NSString *)sucess{
    [self showMessage:sucess image:[UIImage imageNamed:@"CQStatusBarHUD.bundle/success"]];
 
}

+(void)showError:(NSString *)error{
    [self showMessage:error image:[UIImage imageNamed:@"CQStatusBarHUD.bundle/error"]];
}

+(void)showLoading:(NSString *)loading{
    //UIActivityIndicatorView
    [timer_ invalidate];
    timer_ = nil;
    [self widow];
    
    UILabel *label = [[UILabel alloc]init];
    label.font = KMessageLabelFont;
    label.textColor = [UIColor whiteColor];
    label.text = loading;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    
    CGFloat textWidth = [loading sizeWithAttributes:@{NSFontAttributeName : KMessageLabelFont}].width;
    UIActivityIndicatorView *v = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - textWidth) * 0.5 - KStatusBarHeight;
    v.frame =  CGRectMake(x, 0, KStatusBarHeight, KStatusBarHeight);
    [v startAnimating];
    [window_ addSubview:v];
    [window_ addSubview:label];

}

+(void)hide{
    [UIView animateWithDuration:KBarAnimationTime animations:^{
        window_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, -KStatusBarHeight);
        
    }];
    window_.hidden = YES;
    window_ = nil;
    [timer_ invalidate];
    timer_ = nil;

}

+(void)widow{
    window_.hidden = YES;
    window_ = [[UIWindow alloc]init];
    window_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, -KStatusBarHeight);
    [UIView animateWithDuration:KBarAnimationTime animations:^{
        window_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, KStatusBarHeight);
        
    }];
    window_.backgroundColor = [UIColor orangeColor];
    window_.windowLevel = UIWindowLevelStatusBar;
    window_.hidden = NO;
}


@end
