//
//  YYOptionsCell.m
//  NewFeatureDemo
//
//  Created by 于磊 on 14/11/3.
//  Copyright (c) 2014年 于磊. All rights reserved.
//

#import "YYOptionsCell.h"


@implementation YYOptionsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.titleLabel];
        
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.detailLabel.numberOfLines = 0;
        self.detailLabel.tintColor = [UIColor darkTextColor];
        self.detailLabel.font = [UIFont systemFontOfSize:14.f];
        [self.contentView addSubview:self.detailLabel];
    }
    return self;
}

- (void)layoutSubviews {
    self.titleLabel.frame = (CGRect){10, 10, self.frame.size.width - 30, 20};
    
    self.detailLabel.frame = (CGRect){10, self.titleLabel.bottom + 5, self.frame.size.width - 40, self.frame.size.height - 40};
    [super layoutSubviews];
}
- (void)setData:(NSDictionary *)data
{
    self.titleLabel.text = data[@"title"];
    self.detailLabel.text = data[@"description"];
}
- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
