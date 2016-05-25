//
//  NSToast.h
//  PhoneCardTerminal
//
//  Created by 张铁君 on 15/10/24.
//  Copyright (c) 2015年 沈阳云融. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEFAULT_DISPLAY_DURATION 2.0f

@interface NSToast : NSObject {
    NSString *text;
    UIButton *contentView;
    CGFloat  duration;
}

+ (void)showWithText:(NSString *) text_;
+ (void)showWithText:(NSString *) text_
            duration:(CGFloat)duration_;

+ (void)showWithText:(NSString *) text_
           topOffset:(CGFloat) topOffset_;
+ (void)showWithText:(NSString *) text_
           topOffset:(CGFloat) topOffset
            duration:(CGFloat) duration_;

+ (void)showWithText:(NSString *) text_
        bottomOffset:(CGFloat) bottomOffset_;
+ (void)showWithText:(NSString *) text_
        bottomOffset:(CGFloat) bottomOffset_
            duration:(CGFloat) duration_;

@end
