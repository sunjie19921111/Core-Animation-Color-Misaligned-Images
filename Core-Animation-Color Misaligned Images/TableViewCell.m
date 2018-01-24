//
//  TableViewCell.m
//  Core-Animation-Color Misaligned Images
//
//  Created by sxmaps on 2018/1/24.
//  Copyright © 2018年 sxmaps. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _bigImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_bigImageView];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat bigFrameX = 10.f;
    CGFloat bigFrameY = 10.f;
    _bigImageView.frame = CGRectMake(bigFrameX, bigFrameY, 0, 0);
    
    CGFloat titleFrameX = CGRectGetMaxX(_bigImageView.frame) + 10.f;
    CGFloat titleFrameY = _bigImageView.center.y;
    _titleLabel.frame = CGRectMake(titleFrameX, titleFrameY, 0, 0);
}

@end
