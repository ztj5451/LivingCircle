//
//  PhoneUtils.h
//  UtilsDemo
//
//  Created by 张铁君 on 15/12/22.
//  Copyright (c) 2015年 沈阳云融. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhoneUtils : NSObject
+(NSString *)getPhoneIMEI;
//获取当前设备的版本号
+ (float)getIOSVersion;
//获取当前设备唯一标示
+(NSString *)getIdentify;
+(void)numberToCall:(NSString *)number;
@end
