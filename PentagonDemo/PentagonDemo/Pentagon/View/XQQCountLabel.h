//
//  XQQCountLabel.h
//  PentagonDemo
//
//  Created by xuqinqiang on 2017/7/6.
//  Copyright © 2017年 Camelot.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XQQCountLabel : UIView

/** 序号 */
@property (nonatomic, assign)  NSInteger   index;
/** 数值 */
@property (nonatomic, copy)    NSString  *  countStr;
/** 名字 */
@property (nonatomic, copy)    NSString  *  nameStr;


@end
