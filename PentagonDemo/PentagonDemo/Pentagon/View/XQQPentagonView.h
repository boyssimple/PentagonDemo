//
//  XQQPentagonView.h
//  PentagonDemo
//
//  Created by xuqinqiang on 2017/7/6.
//  Copyright © 2017年 Camelot.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XQQPentagonView : UIView

/**
 画雷达图
 
 @param frame frame
 @param graphCount 画几层
 @param maxValue 最大值
 @param stockColorStr 线条颜色
 @param lineWidth 线宽
 @param titleArr 标题数组
 @return 雷达图
 */
- (instancetype)initWithFrame:(CGRect)frame
                   GraphCount:(NSInteger)graphCount
                     MaxValue:(CGFloat)maxValue
                StockColorStr:(NSString*)stockColorStr
                    LineWidth:(CGFloat)lineWidth
                     TitleArr:(NSArray*)titleArr;


/**
 填充值
 
 @param valueArr 值数组
 @param fillColorStr 填充颜色
 @param fillAlpha 填充透明度 (0 - 1)
 @param stockColorStr 线条颜色
 @param lineWidth 线宽
 */
- (void)drawValuePentagonWithValueArr:(NSArray*)valueArr
                         FillColorStr:(NSString*)fillColorStr
                            FillAlpha:(CGFloat)fillAlpha
                        StockColorStr:(NSString*)stockColorStr
                            LineWidth:(CGFloat)lineWidth;


@end
