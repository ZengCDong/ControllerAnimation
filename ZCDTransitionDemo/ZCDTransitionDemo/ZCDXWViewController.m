//
//  ZCDXWViewController.m
//  ZCDTransitionDemo
//
//  Created by ZCD on 2017/7/27.
//  Copyright © 2017年 ZCD. All rights reserved.
//

#import "ZCDXWViewController.h"
#import "XWDrawerAnimator.h"
#import "UIViewController+XWTransition.h"
@interface ZCDXWViewController ()

@end

@implementation ZCDXWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    [self setUpFeatureAlterView];
}
#pragma mark - 弹出弹框
- (void)setUpFeatureAlterView
{
    XWInteractiveTransitionGestureDirection direction = XWInteractiveTransitionGestureDirectionDown;
    __weak typeof(self)weakSelf = self;
    [self xw_registerBackInteractiveTransitionWithDirection:direction transitonBlock:^(CGPoint startPoint){
        [weakSelf dismissViewControllerAnimated:YES completion:^{
            [weakSelf dismissFeatureViewControllerWithTag:100];
        }];
    } edgeSpacing:0];
}
#pragma mark - 退出当前界面
- (void)dismissFeatureViewControllerWithTag:(NSInteger)tag
{
    __weak typeof(self)weakSelf = self;
    [weakSelf dismissViewControllerAnimated:YES completion:^{
        
    }];
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
