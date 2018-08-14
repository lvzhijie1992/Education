//
//  TabBarController.m
//  Education
//
//  Created by 锦色年华 on 2018/8/14.
//  Copyright © 2018年 锦色年华. All rights reserved.
//

#import "TabBarController.h"
#import "PlusAnimate.h"
#import "PublishViewController.h"

@interface TabBarController ()<CYTabBarDelegate>

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabbar.delegate = self;
}


/**
 * 设置中间按钮
 * @param Controller          需管理的子控制器
 * @param title               底部文字
 * @param imageName           未选中的图片名
 * @param selectedImageName   选中的图片名
 */
//- (void)addCenterController:(id)Controller
//                      bulge:(BOOL)bulge
//                      title:(NSString *)title
//                  imageName:(NSString *)imageName
//          selectedImageName:(NSString *)selectedImageName;
#pragma mark - CYTabBarDelegate
//中间按钮点击
- (void)tabbar:(CYTabBar *)tabbar clickForCenterButton:(CYCenterButton *)centerButton{
   //[PlusAnimate standardPublishAnimateWithView:centerButton];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[PublishViewController new]];
//    [self.navigationController presentViewController:nav animated:YES completion:nil];
//    [self addCenterController:[PublishViewController new] bulge:YES title:@"选课" imageName:nil selectedImageName:nil];
}
//是否允许切换
- (BOOL)tabBar:(CYTabBar *)tabBar willSelectIndex:(NSInteger)index{
        NSLog(@"将要切换到---> %ld",index);
    return YES;
}
//通知切换的下标
- (void)tabBar:(CYTabBar *)tabBar didSelectIndex:(NSInteger)index{
        NSLog(@"切换到---> %ld",index);
}

@end
