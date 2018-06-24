//
//  SUPersonalCenterCell.m
//  StartUniversity
//
//  Created by 苏强 on 2018/6/25.
//  Copyright © 2018年 苏强. All rights reserved.
//

#import "SUPersonalCenterCell.h"

@interface SUPersonalCenterCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;


@end

@implementation SUPersonalCenterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -  setter && getter
- (void)setCellTitleString:(NSString *)cellTitleString {
    _cellTitleString = cellTitleString;
    self.titleLabel.text = cellTitleString;
}

- (void)setIconNameString:(NSString *)iconNameString {
    _iconNameString = iconNameString;
    self.iconImageView.image = [UIImage imageNamed:iconNameString];
}

@end
