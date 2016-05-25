//
//  ImageUtils.h
//  LivingCircle
//
//  Created by 张铁君 on 16/4/14.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageUtils : UIView
//IOS 原型头像
+ (UIImage *)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
@end
