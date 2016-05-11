//
//  CQStatusBarHUD.h
//  CQStatusBarHud
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CQStatusBarHUD : NSObject
+(void)showMessage:(NSString *)message image:(UIImage *)image;

+(void)showSucess:(NSString *)sucess;

+(void)showError:(NSString *)error;

+(void)showLoading:(NSString *)loading;

+(void)hide;


@end
