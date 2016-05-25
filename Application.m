//
//  Application.m
//  PhoneCardTerminal
//
//  Created by 张铁君 on 15/12/28.
//  Copyright (c) 2015年 沈阳云融. All rights reserved.
//

#import "Application.h"
#import "ScreenUtils.h"
@implementation Application
static  NSString *user_id=nil ;
static  NSString *user_name=nil;
static  NSString *hf_cz=nil;
static  NSString *tel_kf=nil;
static  NSString *xt_ll=nil;
static  NSString *chargeNumber=nil;
static  NSString *charge_Money=nil;
static  NSString *mFlag=nil;
static  NSString *categoryId=nil;
static  NSString *selectCity=nil;
static  NSString *kefuNumber=nil;
static  NSArray *categoryArray=nil;
static  NSString *filePath=nil;
static  NSArray *merchanteCategoryArray=nil;
static  NSString *merchantContent=nil;
+(void)setMerchantContent:(NSString *)content
{
    merchantContent=content;
    [merchantContent retain];
}
+(NSString *)getMerchantContent
{
    return merchantContent;
}
+(void)setMerchanteCategoryId:(NSArray *)array
{
    merchanteCategoryArray=array;
    [merchanteCategoryArray retain];
}
+(NSString *)getMerchantCategoryId:(NSUInteger)position
{
   return [merchanteCategoryArray objectAtIndex:position];
}
+(void)setFilePath:(NSString *)path
{
    filePath=path;
    [filePath retain];
}
+(NSString *)getFilePath
{
    return filePath;
}
+(void)setCategoryBanner:(NSArray *)files
{
    categoryArray=files;
    [categoryArray retain];
}
+(NSString *)getCategoryBanner:(NSUInteger)position
{
    return [categoryArray objectAtIndex:position];
}
+(void)setKefuNumber:(NSString *)phoneNumber
{
    kefuNumber=phoneNumber;
    [kefuNumber retain];
}
+(NSString *)getKefuNumber
{
    return kefuNumber;
}
+(void)setCategoryId:(NSString *)position
{
    categoryId=position;
    [categoryId retain];
}
+(NSString *)getCategoryId
{
    return categoryId;
}
+(void)setSelectCity:(NSString *)cityName
{
    selectCity=cityName;
    [selectCity retain];
}
+(NSString *)getSelectCity
{
    return selectCity;
}
+(void)setChargeMoney:(NSString *)money
{
    charge_Money=money;
    [charge_Money retain];
}
+(NSString *)getChargeMoney
{
    return charge_Money;
}
+(void)setPhoneNumber:(NSString *)number
{
    chargeNumber=number;
    [chargeNumber retain];
}
+(NSString *)getPhoneNumber
{
    return chargeNumber;
}
+(void)setFlag:(NSString *)flag
{
    mFlag=flag;
    [mFlag retain];
    
}
+(NSString *)getFlag
{
    return mFlag;
}
+(void)setTel:(NSString *)tel
{
    tel_kf=tel;
    [tel_kf retain];
}
+(NSString *)getTel
{
    return tel_kf;
}
+(void)setCharge:(NSString *)charge
{
    hf_cz=charge;
    [hf_cz retain];
}
+(NSString *)getCharge
{
    return hf_cz;
}
+(void)setLiuliang:(NSString *)liuliang
{
    xt_ll=liuliang;
    [xt_ll retain];
}
+(NSString *)getLiuliang
{
    return xt_ll;
    
}
+(void)setUserId:(NSString *)userId
{
    user_id=userId;
    [user_id retain];
}
+(NSString *)getUserId
{
    return user_id;
}
+(void)setUserName:(NSString *)userName
{
    user_name=userName;
    [user_name retain];
    
}
+(NSString *)getUserName
{
    
   return  user_name;
}
-(void)dealloc
{

    RELEASE_SAFELY(user_id);
    RELEASE_SAFELY(user_name);
    RELEASE_SAFELY(categoryId);
    RELEASE_SAFELY(selectCity);
    RELEASE_SAFELY(categoryArray);
    RELEASE_SAFELY(filePath);
    RELEASE_SAFELY(merchanteCategoryArray);
    RELEASE_SAFELY(merchantContent);
    [super dealloc];
    
}
@end
