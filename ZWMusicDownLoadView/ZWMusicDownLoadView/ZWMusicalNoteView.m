//
//  ZWMusicalNoteView.m
//  ZWMusicDownLoadView
//
//  Created by 流年划过颜夕 on 2018/3/16.
//  Copyright © 2018年 liunianhuaguoyanxi. All rights reserved.
//

#import "ZWMusicalNoteView.h"
#import <QuartzCore/QuartzCore.h>
#define ZWDistance 1.5
#define ZWDistanceX 1.5
#define ZWDistanceY 1.5
#define Color(r,g,b,a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]
#define r 100
@implementation ZWMusicalNoteView

-(void)drawRect:(CGRect)rect
{
    
    //    //An opaque type that represents a Quartz 2D drawing environment.
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, self.scaleSize ,self.scaleSize);

    //设置单双音符
    if (self.isSingleOne) {
        drawSingleBody1(context,rect,self.musicalColor);
        drawSingleBody2(context,rect,self.musicalColor);
        drawSingleBody3(context,rect,self.musicalColor);
    }else
    {
        
        drawDoulbeBody1(context,rect,self.musicalColor);
        drawDoulbeBody2(context,rect,self.musicalColor);
        drawDoulbeBody3(context,rect,self.musicalColor);
    }
    
    
    
}
void drawSingleBody1(CGContextRef context,CGRect rect,UIColor *musicalColor)
{
    UIColor*aColor = musicalColor?musicalColor:Color(236, 93, 78, 1);
    CGContextSetLineWidth(context, 1);
    CGContextMoveToPoint(context, 8, 0);
    CGContextAddLineToPoint(context, 16, 3);
    CGContextAddLineToPoint(context, 16, 9);
    CGContextAddLineToPoint(context, 8, 6);
    CGContextSetRGBStrokeColor(context,248, 168, 42, 0);//画笔线的颜色
    
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    CGContextClosePath(context);
    
    
    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextSaveGState(context);
    
}

void drawSingleBody2 (CGContextRef context,CGRect rect,UIColor *musicalColor)
{
    
    
    
    
    CGFloat startX = 8;
    CGFloat startY = 0;
    CGContextMoveToPoint(context, startX, startY);
    CGContextSetLineWidth(context, 2);
    
    CGFloat endX = 8;
    CGFloat endY = 20;
    CGContextAddLineToPoint(context, endX, endY);
    
    [musicalColor?musicalColor:Color(236, 93, 78, 1) set];
    
    CGContextStrokePath(context);
}

void drawSingleBody3 (CGContextRef context,CGRect rect,UIColor *musicalColor)
{
    
    [musicalColor?musicalColor:Color(236, 93, 78, 1) set];
    CGContextAddArc(context, 6, 20,  4, 0, M_PI * 2, 1);
    CGContextFillPath(context);
    
    
    
    
}

void drawDoulbeBody1(CGContextRef context,CGRect rect,UIColor *musicalColor)
{
    UIColor*aColor = musicalColor?musicalColor:Color(236, 93, 78, 1);
    CGContextSetLineWidth(context, 1);
    CGContextMoveToPoint(context, 8, 6);
    CGContextAddLineToPoint(context, 24, 0);
    CGContextAddLineToPoint(context, 24, 6);
    CGContextAddLineToPoint(context, 8, 12);
    CGContextSetRGBStrokeColor(context,248, 168, 42, 0);//画笔线的颜色
    
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    CGContextClosePath(context);
    
    
    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextSaveGState(context);
    
}

void drawDoulbeBody2 (CGContextRef context,CGRect rect,UIColor *musicalColor)
{
    
    
    
    
    CGFloat startX = 8;
    CGFloat startY = 6;
    CGContextMoveToPoint(context, startX, startY);
    CGContextSetLineWidth(context, 2);
    
    CGFloat endX = 8;
    CGFloat endY = 26;
    CGContextAddLineToPoint(context, endX, endY);
    
    [musicalColor?musicalColor:Color(236, 93, 78, 1) set];
    
    
    CGContextMoveToPoint(context, 23, 0);
    CGContextSetLineWidth(context, 2);
    
    
    CGContextAddLineToPoint(context, 23, 20);
    
    [musicalColor?musicalColor:Color(236, 93, 78, 1) set];
    
    CGContextStrokePath(context);
}

void drawDoulbeBody3 (CGContextRef context,CGRect rect,UIColor *musicalColor)
{
    
    [musicalColor?musicalColor:Color(236, 93, 78, 1) set];
    CGContextAddArc(context, 6, 26,  4, 0, M_PI * 2, 1);
    CGContextFillPath(context);
    
    
    [musicalColor?musicalColor:Color(236, 93, 78, 1) set];
    CGContextAddArc(context, 21, 20,  4, 0, M_PI * 2, 1);
    CGContextFillPath(context);
    
    
}

@end
