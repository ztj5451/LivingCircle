//
//  NSStringUtils.h
//  PhoneCardTerminal
//
//  Created by 张铁君 on 15/12/26.
//  Copyright (c) 2015年 沈阳云融. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSStringUtils : NSObject
+(NSString*)trimWithString:(NSString *)string;
//正则表达式判断手机号码
+(BOOL)checkTel:(NSString *)number;
@end
