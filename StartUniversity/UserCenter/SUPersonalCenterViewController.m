//
//  SUPersonalCenterViewController.m
//  StartUniversity
//
//  Created by 苏强 on 2018/6/13.
//  Copyright © 2018年 苏强. All rights reserved.
//

#import "SUPersonalCenterViewController.h"
#import "SUPersonalCenterTableView.h"

@interface SUPersonalCenterViewController ()

@property (nonatomic, strong) SUPersonalCenterTableView *personalCenterTableView;

@end

@implementation SUPersonalCenterViewController
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    [self.view addSubview:self.personalCenterTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (SUPersonalCenterTableView *)personalCenterTableView {
    if (!_personalCenterTableView) {
        _personalCenterTableView = [[SUPersonalCenterTableView alloc] initWithFrame:self.view.bounds];
    }
    return _personalCenterTableView;
}


@end
