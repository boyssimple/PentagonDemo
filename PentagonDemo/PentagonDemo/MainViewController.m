//
//  MainViewController.m
//  PentagonDemo
//
//  Created by xuqinqiang on 2017/7/6.
//  Copyright © 2017年 Camelot.com. All rights reserved.
//

#import "MainViewController.h"
#import "XQQPentagonView.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XQQPentagonView * view = [[XQQPentagonView alloc]initWithFrame:CGRectMake(0, 68, iPhoneWidth, 400) GraphCount:4 MaxValue:120 StockColorStr:@"ABABAB" LineWidth:1 TitleArr:@[@"债券",@"基金",@"基金",@"理财",@"现金"]];
    
    [self.view addSubview:view];
    
    [view drawValuePentagonWithValueArr:@[@69,@64,@110,@45,@87] FillColorStr:@"96CCF4" FillAlpha:.4 StockColorStr:@"96CCF4" LineWidth:1];
    
}

@end
