//
//  AppDelegate.m
//  Education
//
//  Created by 锦色年华 on 2018/8/10.
//  Copyright © 2018年 锦色年华. All rights reserved.
//

#define KFNavBarColor [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:1.0f]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#import "AppDelegate.h"
#import "TabBarController.h"
#import "MainViewController.h"
#import "MyViewController.h"
#import "PublishViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 继承CYTabBar的控制器， 你可以自定定义 或 不继承直接使用
    TabBarController * tabbar = [[TabBarController alloc]init];
    // 配置
    [CYTabBarConfig shared].selectedTextColor = [UIColor orangeColor];
    [CYTabBarConfig shared].textColor = [UIColor grayColor];
    [CYTabBarConfig shared].backgroundColor = [UIColor whiteColor];
    [CYTabBarConfig shared].selectIndex = 0;
    [CYTabBarConfig shared].centerBtnIndex = 1;
    [CYTabBarConfig shared].HidesBottomBarWhenPushedOption = HidesBottomBarWhenPushedAlone;
    // 样式
    switch (0) {
        case 0:
            // 中间按钮突出 ， 设为按钮 , 底部有文字 ， 闲鱼
            [self style1:tabbar];
            break;
        case 1:
            // 中间按钮不突出 ， 设为控制器 ,底部无文字  , 微博
            //[self style2:tabbar];
            break;
        default:
            //无中间按钮 ，普通样式
           // [self style3:tabbar];
            break;
    }
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    [self configAppearance];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)style1:(CYTabBarController *)tabbar {
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"Main_ID"]];
    [tabbar addChildController:nav1 title:@"发现" imageName:@"Btn01" selectedImageName:@"SelectBtn01"];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:[MyViewController new]];
    [tabbar addChildController:nav2 title:@"我的" imageName:@"Btn01" selectedImageName:@"SelectBtn01"];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:[PublishViewController new]];
     [tabbar addCenterController:nav3 bulge:YES title:@"选课" imageName:@"post_normal" selectedImageName:@"post_normal"];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)configAppearance {
    //NavigationBar默认样式
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    //[navigationBarAppearance setTranslucent:NO];
    navigationBarAppearance.barTintColor = KFNavBarColor;
    navigationBarAppearance.tintColor = [UIColor whiteColor];
    navigationBarAppearance.barStyle = UIBarStyleBlack;
    [UITabBar appearance].tintColor = KFNavBarColor;
}

@end
