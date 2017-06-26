//
//  NSObject+PublicCategory.h
//  dxj_field
//
//  Created by 董雪娇 on 2017/6/26.
//  Copyright © 2017年 董雪娇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@end


@interface NSString (stringCategory)
-(UIColor *)getColor;
@end
