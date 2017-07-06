//
//  CAShapeLayer+Pentagon.m
//  PentagonDemo
//
//  Created by xuqinqiang on 2017/7/6.
//  Copyright © 2017年 Camelot.com. All rights reserved.
//

#import "CAShapeLayer+Pentagon.h"

@implementation CAShapeLayer (Pentagon)

/**
 画五边形
 
 @param centerPoint 中心店
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
                                   LineWidth:(CGFloat)lineWidth{
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    
    layer.path = [UIBezierPath drawPentagonWithCenterPoint:centerPoint
                                                    length:length];
    layer.fillColor = fillColor.CGColor;
    
    layer.strokeColor = stockColor.CGColor;
    
    layer.lineWidth = lineWidth;
    
    return layer;
}

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
                                        LineWidth:(CGFloat)lineWidth{
   
    CAShapeLayer * layer = [CAShapeLayer layer];
    
    layer.path = [UIBezierPath drawPentagonWithCenterPoint:centerPoint
                                                 LengthArr:lengthArr];
    
    layer.fillColor = fillColor.CGColor;
    
    layer.strokeColor = stockColor.CGColor;
    
    layer.lineWidth = lineWidth;
    
    return layer;
}


@end
