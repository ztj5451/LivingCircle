//
//  Application.h
//  PhoneCardTerminal
//
//  Created by 张铁君 on 15/12/28.
//  Copyright (c) 2015年 沈阳云融. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Application : NSObject
+(void)setMerchanteCategoryId:(NSArray *)array;
+(void)setFilePath:(NSString *)path;
+(void)setCategoryBanner:(NSArray *)files;
+(void)setCategoryId:(NSString *)position;
+(void)setSelectCity:(NSString *)cityName;
+(void)setUserId:(NSString *)userId;
+(void)setKefuNumber:(NSString*)phoneNumber;
+(void)setMerchantContent:(NSString *)content;

+(void)setUserName:(NSString *)userName;
+(void)setCharge:(NSString *)charge;
+(void)setTel:(NSString *)tel;
+(void)setLiuliang:(NSString *)liuliang;
+(void)setPhoneNumber:(NSString *)number;
+(void)setChargeMoney:(NSString *)money;
+(void)setFlag:(NSString *)flag;


+(NSString *)getMerchantContent;
+(NSString *)getMerchantCategoryId:(NSUInteger)position;
+(NSString *)getFilePath;
+(NSString *)getCategoryBanner:(NSUInteger)position;
+(NSString*)getKefuNumber;
+(NSString *)getCategoryId;
+(NSString *)getSelectCity;
+(NSString *)getUserName;
+(NSString *)getUserId;
+(NSString *)getCharge;
+(NSString *)getTel;
+(NSString *)getLiuliang;
+(NSString *)getPhoneNumber;
+(NSString *)getChargeMoney;
+(NSString *)getFlag;
@end
