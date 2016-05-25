//
//  PhoneUtils.m
//  UtilsDemo
//
//  Created by 张铁君 on 15/12/22.
//  Copyright (c) 2015年 沈阳云融. All rights reserved.
//

#import "PhoneUtils.h"
@implementation PhoneUtils
+(NSString *)getPhoneIMEI
{
   
   
    return nil;
}
+(float)getIOSVersion
{
  return [[[UIDevice currentDevice] systemVersion] floatValue];
}
+(NSString *)getIdentify
{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}
+(void)numberToCall:(NSString *)number
{
  
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",number] ];
    UIWebView *phoneCallWebView=nil;
    if ( !phoneCallWebView ) {
        phoneCallWebView = [[UIWebView alloc]initWithFrame:CGRectZero];// 这个webView只是一个后台的容易 不需要add到页面上来 效果跟方法二一样 但是这个方法是合法的
    }
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    
}
@end
