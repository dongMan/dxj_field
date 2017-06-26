//
//  NSObject+PublicCategory.m
//  dxj_field
//
//  Created by 董雪娇 on 2017/6/26.
//  Copyright © 2017年 董雪娇. All rights reserved.
//

#import "NSObject+PublicCategory.h"


@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

@end


@implementation NSString (stringCategory)

-(UIColor *)getColor
{
    unsigned int r,g,b;
    NSRange range = NSMakeRange(0, 2);
    NSString *string1 = [self substringWithRange:range];
    [[NSScanner scannerWithString:string1] scanHexInt:&r];
    
    range = NSMakeRange(2, 2);
    string1 = [self substringWithRange:range];
    [[NSScanner scannerWithString:string1] scanHexInt:&g];
    
    range = NSMakeRange(4, 2);
    string1 = [self substringWithRange:range];
    [[NSScanner scannerWithString:string1] scanHexInt:&b];
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}

@end
