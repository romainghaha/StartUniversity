//
//  SUPersonalCenterTableView.m
//  StartUniversity
//
//  Created by 苏强 on 2018/6/24.
//  Copyright © 2018年 苏强. All rights reserved.
//

#import "SUPersonalCenterTableView.h"
#import "SUUserCenterHeaderView.h"
#import "SUPersonalCenterCell.h"

@interface SUPersonalCenterTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) SUUserCenterHeaderView *headerView;
@property (nonatomic, strong) NSArray *cellTitleArr;
@property (nonatomic, strong) NSArray *cellIconNameArr;

@end

@implementation SUPersonalCenterTableView
#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.backgroundColor = [UIColor darkGrayColor];
        self.delegate = self;
        self.dataSource = self;
//        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.rowHeight = 44;
        [self registerNib:[UINib nibWithNibName:@"SUPersonalCenterCell" bundle:nil] forCellReuseIdentifier:@"SUPersonalCenterCellID"];
        [self configPageSubviews];
    }
    return self;
}

- (void)configPageSubviews {
    self.tableHeaderView = self.headerView;
    self.tableFooterView = [[UIView alloc] init];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SUPersonalCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SUPersonalCenterCellID"];
    if (indexPath.section == 0) {
        cell.cellTitleString = self.cellTitleArr[indexPath.row];
        cell.iconNameString = self.cellIconNameArr[indexPath.row];
    } else if (indexPath.section == 1) {
        cell.cellTitleString = self.cellTitleArr[indexPath.row + 4];
        cell.iconNameString = self.cellIconNameArr[indexPath.row + 4];
    } else if (indexPath.section == 2) {
        cell.cellTitleString = self.cellTitleArr[indexPath.row + 4 + 1];
        cell.iconNameString = self.cellIconNameArr[indexPath.row + 4 + 1];
    } else {
        
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    } else if (section == 1) {
        return 1;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 10)];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - setter && getter
- (SUUserCenterHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[NSBundle mainBundle] loadNibNamed:@"SUUserCenterHeaderView" owner:nil options:nil].lastObject;
    }
    return _headerView;
}

- (NSArray *)cellTitleArr {
    if (!_cellTitleArr) {
        _cellTitleArr = @[@"相册", @"收藏", @"钱包", @"卡包", @"表情", @"设置"];
    }
    return _cellTitleArr;
}

- (NSArray *)cellIconNameArr {
    if (!_cellIconNameArr) {
        _cellIconNameArr = @[@"MoreMyAlbum", @"MoreMyFavorites", @"MyCardPackageIcon", @"MoreMyBankCard", @"MoreExpressionShops", @"MoreSetting"];
    }
    return _cellIconNameArr;
}

@end
