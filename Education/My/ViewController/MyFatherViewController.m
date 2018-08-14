//
//  MyFatherViewController.m
//  Education
//
//  Created by 锦色年华 on 2018/8/11.
//  Copyright © 2018年 锦色年华. All rights reserved.
//

#import "MyFatherViewController.h"

@interface MyFatherViewController ()

@end

@implementation MyFatherViewController///efefefe回顾huhuhu你今年就不接过一天一天有一天一天

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}


@end
