//
//  ViewController.m
//  ZCDTransitionDemo
//
//  Created by ZCD on 2017/7/27.
//  Copyright © 2017年 ZCD. All rights reserved.
//

#import "ViewController.h"
#import "XWDrawerAnimator.h"
#import "UIViewController+XWTransition.h"
#import "ZCDViewController.h"
#import "ZCDXWViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back1)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back2)];
}
#pragma mark 方式一
-(void)back1{
       [self setUpAlterViewControllerWith:[ZCDViewController alloc] WithDistance:[UIScreen mainScreen].bounds.size.width * 0.7];
}
#pragma mark 方式二
-(void)back2{
    [self setUpAlterViewControllerWith:[ZCDXWViewController alloc] WithDistance:[UIScreen mainScreen].bounds.size.height * 0.8 WithDirection:XWDrawerAnimatorDirectionBottom WithParallaxEnable:YES WithFlipEnable:YES];
}
#pragma mark - 转场动画弹出控制器
- (void)setUpAlterViewControllerWith:(UIViewController *)vc WithDistance:(CGFloat)distance
{
    XWDrawerAnimatorDirection direction = XWDrawerAnimatorDirectionLeft;
    XWDrawerAnimator *animator = [XWDrawerAnimator xw_animatorWithDirection:direction moveDistance:distance];
    animator.parallaxEnable = YES;
    [self xw_presentViewController:vc withAnimator:animator];
    __weak typeof(self)weakSelf = self;
    [animator xw_enableEdgeGestureAndBackTapWithConfig:^{
        [weakSelf selfAlterViewback];
    }];
}

#pragma 退出界面
- (void)selfAlterViewback{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}




#pragma mark - 转场动画弹出控制器
- (void)setUpAlterViewControllerWith:(UIViewController *)vc WithDistance:(CGFloat)distance WithDirection:(XWDrawerAnimatorDirection)vcDirection WithParallaxEnable:(BOOL)parallaxEnable WithFlipEnable:(BOOL)flipEnable
{
    XWDrawerAnimatorDirection direction = vcDirection;
    XWDrawerAnimator *animator = [XWDrawerAnimator xw_animatorWithDirection:direction moveDistance:distance];
    animator.parallaxEnable = parallaxEnable;
    animator.flipEnable = flipEnable;
    [self xw_presentViewController:vc withAnimator:animator];
    __weak typeof(self)weakSelf = self;
    [animator xw_enableEdgeGestureAndBackTapWithConfig:^{
        [weakSelf selfAlterViewback];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
