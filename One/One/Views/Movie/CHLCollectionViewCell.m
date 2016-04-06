//
//  CHLCollectionViewCell.m
//  One
//
//  Created by 陈亮 on 16/4/5.
//  Copyright © 2016年 陈亮. All rights reserved.
//

#import "CHLCollectionViewCell.h"
#import "CHLMovieCellModel.h"
#import <UIImageView+WebCache.h>

@interface CHLCollectionViewCell ()
@property (nonatomic, strong) UIImageView * imgView;
@end

@implementation CHLCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:frame];
        [self.contentView addSubview:imageView];
        self.imgView = imageView;
    }
    return self;
}
-(void)setModel:(CHLMovieCellModel *)model
{
    _model = model;
    NSURL * url =  [NSURL URLWithString:model.cover];
    [self.imgView sd_setImageWithURL:url];
}
-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
}
@end
