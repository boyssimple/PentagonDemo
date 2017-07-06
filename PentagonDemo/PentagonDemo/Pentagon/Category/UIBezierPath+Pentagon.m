//
//  UIBezierPath+Pentagon.m
//  PentagonDemo
//
//  Created by xuqinqiang on 2017/7/6.
//  Copyright © 2017年 Camelot.com. All rights reserved.
//

#import "UIBezierPath+Pentagon.h"

@implementation UIBezierPath (Pentagon)

/**
 画五边形
 
 @param centerPoint 中心点
 @param length 半径长
 @return 五边形
 */
+ (CGPathRef)drawPentagonWithCenterPoint:(CGPoint)centerPoint
                                  length:(CGFloat)length{
    
    NSArray * array = @[@(length),@(length),@(length),@(length),@(length)];
    
    return [self drawPentagonWithCenterPoint:centerPoint
                                   LengthArr:array];
}


/**
 画不规则图形
 
 @param centerPoint 中心点
 @param lengthArr 值数组 (需要判断最大)
 @return 不规则图形
 */
+ (CGPathRef)drawPentagonWithCenterPoint:(CGPoint)centerPoint
                               LengthArr:(NSArray*)lengthArr{
    
    NSArray *coordinates = [self converCoordinateFromLength:lengthArr
                                                     Center:centerPoint];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    for (int i = 0; i < coordinates.count; i++) {
        
        CGPoint point = [[coordinates objectAtIndex:i] CGPointValue];
        
        if (i == 0) {
            
            [bezierPath moveToPoint:point];
            
        } else {
            
            [bezierPath addLineToPoint:point];
            
        }
    }
    
    [bezierPath closePath];
    
    return bezierPath.CGPath;
}

/**
 获取图形的五个点
 
 @param lengthArray 长度数组
 @param center 中心点
 @return 点数组
 */
+ (NSArray *)converCoordinateFromLength:(NSArray *)lengthArray
                                 Center:(CGPoint)center{
    
    NSMutableArray *coordinateArray = @[].mutableCopy;
    
    for (int i = 0; i < lengthArray.count; i++) {
        
        double length = [[lengthArray objectAtIndex:i] doubleValue];
        
        CGPoint point = CGPointZero;
        
        if (i == 0) {
            point = CGPointMake(center.x - length * cos(M_PI / 10.0),
                                center.y - length * sin(M_PI / 10.0));
        } else if (i == 1) {
            point = CGPointMake(center.x,
                                center.y - length);
        } else if (i == 2) {
            point = CGPointMake(center.x + length * cos(M_PI / 10.0),
                                center.y - length * sin(M_PI / 10.0));
            
        } else if (i == 3) {
            point = CGPointMake(center.x + length * sin(M_PI / 5.0),
                                center.y + length * cos(M_PI / 5.0));
        } else {
            point = CGPointMake(center.x - length * sin(M_PI / 5.0),
                                center.y + length * cos(M_PI / 5.0));
        }
        
        //尖头朝下
//        if (i == 0) {
//            point =  CGPointMake(center.x - length * sin(M_PI / 5.0),
//                                 center.y - length * cos(M_PI / 5.0));
//        } else if (i == 1) {
//            point = CGPointMake(center.x + length * sin(M_PI / 5.0),
//                                center.y - length * cos(M_PI / 5.0));
//        } else if (i == 2) {
//            point = CGPointMake(center.x + length * cos(M_PI / 10.0),
//                                center.y + length * sin(M_PI / 10.0));
//        } else if (i == 3) {
//            point = CGPointMake(center.x,
//                                center.y +length);
//        } else {
//            point = CGPointMake(center.x - length * cos(M_PI / 10.0),
//                                center.y + length * sin(M_PI / 10.0));
//        }
        [coordinateArray addObject:[NSValue valueWithCGPoint:point]];
    }
    return coordinateArray;
}

@end
