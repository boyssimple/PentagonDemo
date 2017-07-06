//
//  XQQPentagonView.m
//  PentagonDemo
//
//  Created by xuqinqiang on 2017/7/6.
//  Copyright © 2017年 Camelot.com. All rights reserved.
//

#import "XQQPentagonView.h"
#import "XQQCountLabel.h"
#import "XQQPentagonModel.h"

@interface XQQPentagonView ()

/** 中心点 */
@property (nonatomic, assign)  CGPoint   centerPoint;
/** 线条颜色 */
@property (nonatomic, copy)    NSString  *  stockColorStr;
/** 线宽 */
@property (nonatomic, assign)  CGFloat   lineWidth;
/** 标题数组 */
@property (nonatomic, strong)  NSArray  *  titleArr;
/** 存储标题label */
@property (nonatomic, strong)  NSMutableArray<XQQCountLabel*>  *  countLabelArr;

@end

@implementation XQQPentagonView

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
                     TitleArr:(NSArray*)titleArr{
    
    if (self = [super initWithFrame:frame]) {
        
        CGPoint centerPoint = CGPointMake(self.bounds.origin.x + self.bounds.size.width*.5, self.bounds.origin.y + self.bounds.size.height*.5);
        
        _centerPoint = centerPoint;
        
        _lineWidth = lineWidth;
        
        _stockColorStr = stockColorStr;
        
        _titleArr = titleArr;
        
        //算出间距
        CGFloat board = maxValue / graphCount;
        
        //画五边形
        for (NSInteger i = 0; i < graphCount; i ++) {
            
            CAShapeLayer * layer = [CAShapeLayer drawPentagonWithCenterPoint:centerPoint
                                                                      Length:i * board + board
                                                                   FillColor:[UIColor clearColor]
                                                                  StockColor:[UIColor kds_colorWithHexString:stockColorStr]
                                                                   LineWidth:lineWidth];
            
            [self.layer addSublayer:layer];
        }
        
        //画圆心到五个点的射线
        NSArray * pointArr = [UIBezierPath converCoordinateFromLength:@[@(maxValue),@(maxValue),@(maxValue),@(maxValue),@(maxValue)] Center:centerPoint];
        
        [self drawRadial:pointArr];
        
       //画五个label
        [self drawCountLabelWithPointArr:pointArr];
        
    }
    return self;
}

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
                            LineWidth:(CGFloat)lineWidth{
    
    CAShapeLayer * valueLayer = [CAShapeLayer drawValuePentagonWithCenterPoint:self.centerPoint
                                                                     LengthArr:valueArr
                                                                     fillColor:[UIColor kds_colorWithHexString:fillColorStr andAlpha:fillAlpha]
                                                                    StockColor:[UIColor kds_colorWithHexString:stockColorStr]
                                                                     LineWidth:lineWidth];

    [self.layer addSublayer:valueLayer];
    
    //填充值label
    
    for (NSInteger i = 0; i < valueArr.count; i ++) {
        
        XQQCountLabel * label = [self.countLabelArr objectAtIndex:i];
        
        label.countStr = [NSString stringWithFormat:@"%.2f",[valueArr[i] floatValue]];
        
    }
    
}

#pragma mark - activity

/**
 画五个数值label

 @param pointArr 点数组
 */
- (void)drawCountLabelWithPointArr:(NSArray*)pointArr{
    
    CGFloat labelBoard = 0;    //label距离图形的间距
    CGFloat labelWidth = 60;    //label的宽
    CGFloat labelHeight = 40;   //label的高
    
    for (NSInteger i = 0; i < pointArr.count; i ++) {
        
        XQQCountLabel * label = [[XQQCountLabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
        
        CGPoint point = [pointArr[i] CGPointValue];
        
        CGPoint labelCenter = CGPointZero;
        
        if (i == 0) {
            
            labelCenter.y = point.y;
            
            labelCenter.x = point.x - labelWidth*.5 - labelBoard;
            
        } else if (i == 1) {
            
            labelCenter.y = point.y - labelBoard - labelHeight *.5;
            
            labelCenter.x = point.x;
            
        } else if (i == 2) {
            
            labelCenter.y = point.y;
            
            labelCenter.x = point.x + labelBoard + labelWidth*.5;
            
        } else if (i == 3) {
            
            labelCenter.y = point.y + labelBoard + labelHeight *.5;
            
            labelCenter.x = point.x + labelBoard + labelWidth*.5;
            
        } else {
            
            labelCenter.y = point.y + labelBoard + labelHeight *.5;
            
            labelCenter.x = point.x - labelBoard - labelWidth*.5;
        }
        
        label.center = labelCenter;
        
        label.nameStr = self.titleArr[i];
        
        [self addSubview:label];
        
        [self.countLabelArr addObject:label];
    }
}

/**
 画圆心到五个点的射线

 @param pointArr 最大值点的数组
 */
- (void)drawRadial:(NSArray*)pointArr{
    
    for (NSInteger i = 0; i < pointArr.count; i ++) {
        
        UIBezierPath * path = [UIBezierPath bezierPath];
        
        [path moveToPoint:_centerPoint];
        
        [path addLineToPoint:[pointArr[i] CGPointValue]];
        
        CAShapeLayer * layer = [CAShapeLayer layer];
        
        layer.path = path.CGPath;
        
        layer.strokeColor = [UIColor kds_colorWithHexString:_stockColorStr].CGColor;
        
        layer.lineWidth = _lineWidth;
        
        [self.layer addSublayer:layer];
    }
}

#pragma mark - get

-(NSMutableArray<XQQCountLabel *> *)countLabelArr{
    if (!_countLabelArr) {
        _countLabelArr = @[].mutableCopy;
    }
    return _countLabelArr;
}


@end
