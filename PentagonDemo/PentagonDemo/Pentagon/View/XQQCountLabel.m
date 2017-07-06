//
//  XQQCountLabel.m
//  PentagonDemo
//
//  Created by xuqinqiang on 2017/7/6.
//  Copyright © 2017年 Camelot.com. All rights reserved.
//

#import "XQQCountLabel.h"

@interface XQQCountLabel ()

/** 名称label */
@property (nonatomic, strong)  UILabel  *  nameLabel;
/** 数值 */
@property (nonatomic, strong)  UILabel  *  countLabel;

@end

@implementation XQQCountLabel

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height*.5)];
        
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        
        _nameLabel.font = [UIFont systemFontOfSize:15];
        
        _nameLabel.textColor = [UIColor grayColor];
        
        _countLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _nameLabel.bottom, _nameLabel.width, _nameLabel.height)];
        
        _countLabel.textAlignment = NSTextAlignmentCenter;
        
        _countLabel.textColor = [UIColor kds_colorWithHexString:@"96CCF4"];
        
        _countLabel.font = [UIFont systemFontOfSize:13];
        
//        _nameLabel.backgroundColor = [UIColor yellowColor];
//        _countLabel.backgroundColor = [UIColor orangeColor];
        
        [self addSubview:_nameLabel];
        [self addSubview:_countLabel];
    }
    return self;
}

- (void)setCountStr:(NSString *)countStr{
    _countStr = countStr;
    _countLabel.text = _countStr;
}

- (void)setNameStr:(NSString *)nameStr{
    _nameStr = nameStr;
    
    _nameLabel.text = nameStr;
}


@end
