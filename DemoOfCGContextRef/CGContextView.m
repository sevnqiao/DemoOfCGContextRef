//
//  CGContextView.m
//  DemoOfCGContextRef
//
//  Created by world on 2018/8/7.
//  Copyright © 2018年 world. All rights reserved.
//

#import "CGContextView.h"

@implementation CGContextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    [self drawText:@"hello world"];
    [self drawLine];
    [self drawRectangle];
    [self drawEllipse];
    [self drawCircular];
    [self drawGradient];
    [self drawImaginaryLine];
}


/**
 * 获取某个view的截图
 */
- (UIImage *)getViewShot:(UIView *)view
{
    UIGraphicsBeginImageContext(view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 * 画一个文本
 */
- (void)drawText:(NSString *)text
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);//线条宽度
    CGContextSetRGBFillColor (context, 0.5, 0.5, 0.5, 0.5);//颜色
    UIFont *font = [UIFont boldSystemFontOfSize:18.0];
    [text drawInRect:CGRectMake(20, 40, 280, 300) withAttributes:@{NSFontAttributeName:font}];
}

/**
 * 画一条线
 */
- (void)drawLine
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);
    CGContextMoveToPoint(context, 140, 30);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextStrokePath(context);
}

/**
 * 画矩形
 */
- (void)drawRectangle
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);
    CGContextStrokeRect(context, CGRectMake(100, 100, 100, 100));
    CGContextStrokePath(context);
}

/**
 * 画椭圆
 */
- (void)drawEllipse
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect aRect= CGRectMake(80, 180, 160, 100);
    CGContextSetRGBStrokeColor(context, 0.6, 0.9, 0, 1.0);
    CGContextSetLineWidth(context, 3.0);
    CGContextAddEllipseInRect(context, aRect); //椭圆
    CGContextDrawPath(context, kCGPathStroke);
}

/**
 * 画圆弧
 */
- (void)drawCircular//弧
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context); //根据图形上下文创建一个空路径
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);
    CGContextMoveToPoint(context, 100, 250);
    CGContextAddArcToPoint(context, 50, 250, 50, 300, 50);//增加一段弧路径，使用半径和切点做参数
    CGContextStrokePath(context);
}

/**
 * 画渐变色
 */
- (void)drawGradient
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClip(context);//根据路径剪裁图片，调用这个函数之前，路径不可以填充或者描边，否则没有剪裁效果
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 0.2,
        29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 0.2,
        0.0 / 255.0, 50.0 / 255.0, 126.0 / 255.0, 0.2,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents
    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    CGColorSpaceRelease(rgb);
    CGContextDrawLinearGradient(context, gradient,CGPointMake(0.0,0.0) ,CGPointMake(0.0,self.frame.size.height),kCGGradientDrawsBeforeStartLocation);
}

/**
 * 画虚线
 */
- (void)drawImaginaryLine
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 20.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGFloat dashArray[] = {2,6,4,2};
    CGContextSetLineDash(context, 3, dashArray, 4);//绘制虚线，跳过3个再画虚线，所以刚开始有6-（3-2）=5个虚点
    CGContextMoveToPoint(context, 10, 300);
    CGContextAddQuadCurveToPoint(context, 150, 10, 300, 200);
    CGContextStrokePath(context);
}







@end
