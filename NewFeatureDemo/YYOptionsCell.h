//
//  YYOptionsCell.h
//  NewFeatureDemo
//
//  Created by 于磊 on 14/11/3.
//  Copyright (c) 2014年 于磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYOptionsCell : UITableViewCell

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *detailLabel;

- (void)setData:(NSDictionary *)data;
@end
