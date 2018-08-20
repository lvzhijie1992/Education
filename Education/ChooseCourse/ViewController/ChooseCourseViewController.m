//
//  ChooseCourseViewController.m
//  Education
//
//  Created by 锦色年华 on 2018/8/14.
//  Copyright © 2018年 锦色年华. All rights reserved.
//
#define KSegmentedControlViewHei    38
#define KLeftSpaceRecommendTogether 10

#define ScreenHeight   [UIScreen mainScreen].bounds.size.height
#define ScreenWidth    [UIScreen mainScreen].bounds.size.width

#import "ChooseCourseViewController.h"
#import "CourseTableViewController.h"
#import "XLSlideSwitch.h"

@interface ChooseCourseViewController ()<XLSlideSwitchDelegate> {
    XLSlideSwitch *_slideSwitch;
}

@end

@implementation ChooseCourseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

- (void)buildUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    //要显示的标题
    NSArray *titles = @[@"今天",@"是个",@"好日子",@"心想的",@"事儿",@"都能成",@"明天",@"是个",@"好日子"];
    //创建需要展示的ViewController
    NSMutableArray *viewControllers = [NSMutableArray new];
    for (int i = 0 ; i<titles.count; i++) {
        UIViewController *vc = [self viewControllerOfIndex:i];
        [viewControllers addObject:vc];
    }
    //创建滚动视图
    _slideSwitch = [[XLSlideSwitch alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height+44.0, self.view.bounds.size.width, self.view.bounds.size.height - [UIApplication sharedApplication].statusBarFrame.size.height-44.0) Titles:titles viewControllers:viewControllers];
    //设置代理
    _slideSwitch.delegate = self;
    //设置按钮选中和未选中状态的标题颜色
    _slideSwitch.itemSelectedColor = self.navigationController.navigationBar.tintColor;
    _slideSwitch.itemNormalColor = [UIColor darkGrayColor];
    _slideSwitch.hideShadow = true;
    //显示方法
    [_slideSwitch showInNavigationController:self.navigationController];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemSearch) target:self action:@selector(lzj)];
}

#pragma mark -
#pragma mark SlideSwitchDelegate

- (void)slideSwitchDidselectAtIndex:(NSInteger)index {
    NSLog(@"切换到了第 -- %zd -- 个视图",index);
}

#pragma mark -
#pragma mark 自定义方法
- (UIViewController *)viewControllerOfIndex:(NSInteger)index{
    return [CourseTableViewController new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
