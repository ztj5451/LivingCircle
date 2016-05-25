//
//  NSStringUtils.m
//  PhoneCardTerminal
//
//  Created by 张铁君 on 15/12/26.
//  Copyright (c) 2015年 沈阳云融. All rights reserved.
//

#import "NSStringUtils.h"

@implementation NSStringUtils
+(NSString *)trimWithString:(NSString *)string
{
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return  [string stringByTrimmingCharactersInSet:whitespace];
}
+(BOOL)checkTel:(NSString *)number
{
//    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSString *regex = @"^((170))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:number];
}
@end
