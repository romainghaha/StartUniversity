//
//  SUMainTabBarController.m
//  StartUniversity
//
//  Created by 苏强 on 2018/6/13.
//  Copyright © 2018年 苏强. All rights reserved.
//

#import "SUMainTabBarController.h"

@interface SUMainTabBarController ()

@end

@implementation SUMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewControllerWithClassName:@"SUMessageViewController" andImageName:@"" andTitle:@"消息"];
    [self addChildViewControllerWithClassName:@"SUCircleFriendsViewController" andImageName:@"" andTitle:@"朋友圈"];
    [self addChildViewControllerWithClassName:@"SUPersonalCenterViewController" andImageName:@"" andTitle:@"我的"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.tabBar setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildViewControllerWithClassName:(NSString *)className andImageName:(NSString *)imageName andTitle:(NSString *)title {
    
    Class vcName = NSClassFromString(className);
    UIViewController *controller = [[vcName alloc] init];
    
    controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *root = [[UINavigationController alloc] initWithRootViewController:controller];
    
    root.tabBarItem.title = title;
    
    [self addChildViewController:root];
}

@end
