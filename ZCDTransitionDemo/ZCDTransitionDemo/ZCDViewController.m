//
//  ZCDViewController.m
//  ZCDTransitionDemo
//
//  Created by ZCD on 2017/7/27.
//  Copyright © 2017年 ZCD. All rights reserved.
//

#import "ZCDViewController.h"
#import "UIViewController+XWTransition.h"
#import "XWDrawerAnimator.h"
@interface ZCDViewController ()

@end

@implementation ZCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    [self setUpShareAlterView];
}
#pragma mark - 弹出弹框
- (void)setUpShareAlterView
{
    XWInteractiveTransitionGestureDirection direction = XWInteractiveTransitionGestureDirectionRight;
    __weak typeof(self)weakSelf = self;
    [self xw_registerBackInteractiveTransitionWithDirection:direction transitonBlock:^(CGPoint startPoint){
        [weakSelf selfViewBack];
    } edgeSpacing:80];
}
#pragma mark - 退出当前View
- (void)selfViewBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
