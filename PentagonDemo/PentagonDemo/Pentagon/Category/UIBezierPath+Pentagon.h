//
//  UIBezierPath+Pentagon.h
//  PentagonDemo
//
//  Created by xuqinqiang on 2017/7/6.
//  Copyright © 2017年 Camelot.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (Pentagon)


/**
 画不规则图形

 @param centerPoint 中心点
 @param lengthArr 值数组 (需要判断最大)
 @return 不规则图形
 */
+ (CGPathRef)drawPentagonWithCenterPoint:(CGPoint)centerPoint
                               LengthArr:(NSArray*)lengthArr;


/**
 画五边形

 @param centerPoint 中心点
 @param length 半径长
 @return 五边形
 */
+ (CGPathRef)drawPentagonWithCenterPoint:(CGPoint)centerPoint
                                  length:(CGFloat)length;


/**
 获取图形的五个点

 @param lengthArray 长度数组
 @param center 中心点
 @return 点数组
 */
+ (NSArray *)converCoordinateFromLength:(NSArray *)lengthArray
                                 Center:(CGPoint)center;

@end
