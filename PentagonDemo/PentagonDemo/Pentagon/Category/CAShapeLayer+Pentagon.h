//
//  CAShapeLayer+Pentagon.h
//  PentagonDemo
//
//  Created by xuqinqiang on 2017/7/6.
//  Copyright © 2017年 Camelot.com. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAShapeLayer (Pentagon)


/**
 画五边形

 @param centerPoint 中心点
 @param length 半径
 @param fillColor 中间填充颜色
 @param stockColor 线条颜色
 @param lineWidth 线宽
 @return 五边形layer
 */
+ (CAShapeLayer*)drawPentagonWithCenterPoint:(CGPoint)centerPoint
                                      Length:(CGFloat)length
                                   FillColor:(UIColor*)fillColor
                                  StockColor:(UIColor*)stockColor
                                   LineWidth:(CGFloat)lineWidth;

/**
 画值

 @param centerPoint 中心点
 @param lengthArr 长度数组
 @param fillColor 填充颜色
 @param stockColor 线条颜色
 @param lineWidth 线宽
 @return 值
 */
+ (CAShapeLayer*)drawValuePentagonWithCenterPoint:(CGPoint)centerPoint
                                        LengthArr:(NSArray*)lengthArr
                                        fillColor:(UIColor*)fillColor
                                       StockColor:(UIColor*)stockColor
                                        LineWidth:(CGFloat)lineWidth;



@end
