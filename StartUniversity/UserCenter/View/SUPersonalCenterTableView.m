//
//  SUPersonalCenterTableView.m
//  StartUniversity
//
//  Created by 苏强 on 2018/6/24.
//  Copyright © 2018年 苏强. All rights reserved.
//

#import "SUPersonalCenterTableView.h"
#import "SUUserCenterHeaderView.h"

@interface SUPersonalCenterTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) SUUserCenterHeaderView *headerView;

@end

@implementation SUPersonalCenterTableView
#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.backgroundColor = [UIColor darkGrayColor];
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.rowHeight = 40;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
        [self configPageSubviews];
    }
    return self;
}

- (void)configPageSubviews {
    self.tableHeaderView = self.headerView;
    self.tableFooterView = [[UIView alloc] init];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 1 ? 0 : 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 10)];
    return view;
}

#pragma mark - setter && getter
- (SUUserCenterHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[NSBundle mainBundle] loadNibNamed:@"SUUserCenterHeaderView" owner:nil options:nil].lastObject;
    }
    return _headerView;
}

@end
