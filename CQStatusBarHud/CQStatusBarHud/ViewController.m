//
//  ViewController.m
//  CQStatusBarHud
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "CQStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)message:(id)sender {
    [CQStatusBarHUD showMessage:@"没有什么事!!!!" image:[UIImage imageNamed:@"check"]];
}

- (IBAction)hide:(id)sender {
    [CQStatusBarHUD hide];
}

- (IBAction)loading:(id)sender {
    [CQStatusBarHUD showLoading:@"正在加载中..."];
}

- (IBAction)error:(id)sender {
    [CQStatusBarHUD showError:@"加载失败!"];
}

- (IBAction)success:(id)sender {
    [CQStatusBarHUD showSucess:@"加载成功!"];
}



@end
