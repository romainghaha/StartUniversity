//
//  SUMainTabBarController.m
//  StartUniversity
//
//  Created by 苏强 on 2018/6/13.
//  Copyright © 2018年 苏强. All rights reserved.
//

#import "SUMainTabBarController.h"

@interface SUMainTabBarController ()
@property (nonatomic, strong)UIButton *floatingButton;
@end

@implementation SUMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tabBar setHidden:YES];
    
    [self addChildViewControllerWithClassName:@"SUMessageViewController" andImageName:@"" andTitle:@"消息"];
    [self addChildViewControllerWithClassName:@"SUCircleFriendsViewController" andImageName:@"" andTitle:@"朋友圈"];
    [self addChildViewControllerWithClassName:@"SUPersonalCenterViewController" andImageName:@"" andTitle:@"我的"];
    [self addFloatingButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addFloatingButton {
    
    [self.view addSubview:self.floatingButton];
    NSLog(@"走了");
    [self.floatingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-80);
        make.right.offset(-40);
        make.height.equalTo(@80);
        make.width.equalTo(@80);
    }];
    
}

- (void)floatingButtonClickAction{
    NSLog(@"点击了");
}

- (void)addChildViewControllerWithClassName:(NSString *)className andImageName:(NSString *)imageName andTitle:(NSString *)title {
    
    Class vcName = NSClassFromString(className);
    UIViewController *controller = [[vcName alloc] init];
    
    controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *root = [[UINavigationController alloc] initWithRootViewController:controller];
    
    root.tabBarItem.title = title;
    
    [self addChildViewController:root];
}

- (UIButton *)floatingButton {
    if (!_floatingButton) {
        _floatingButton = [[UIButton alloc] init];
        [_floatingButton setTitle:@"按钮" forState:UIControlStateNormal];
        [_floatingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_floatingButton setBackgroundColor:[UIColor redColor]];
        [_floatingButton addTarget:self action:@selector(floatingButtonClickAction) forControlEvents:UIControlEventTouchUpInside];
        _floatingButton.layer.cornerRadius = 40;
        _floatingButton.layer.masksToBounds = YES;
    }
    return _floatingButton;
}

@end
