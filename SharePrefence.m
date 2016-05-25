//
//  SharePrefence.m
//  UtilsDemo
//
//  Created by 张铁君 on 15/12/12.
//  Copyright (c) 2015年 沈阳云融. All rights reserved.
//

#import "SharePrefence.h"

@implementation SharePrefence

+(void)saveUserName:(NSString *)userName andPassword:(NSString *)password
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //保存用户名
    [userDefaults setObject:userName forKey:@"userName"];
    //保存密码
    [userDefaults setObject:password forKey:@"password"];
    //将数据同步到磁盘上
    [userDefaults synchronize];
}
+(void)readSaveUser:(ReadSaveUserInfo)block
{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    
    NSMutableDictionary *userInfo=[[NSMutableDictionary alloc]init];
    [userInfo setObject:[userDefaultes objectForKey:@"userName"] forKey:@"userName"];
    [userInfo setObject:[userDefaultes objectForKey:@"password"] forKey:@"password"];
    block(userInfo);
}
+(void)saveObjet:(NSString *)object forKey:(NSString *)key
{
     NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    //以键值对保存
    [userDefaultes setObject:object forKey:key];
    //将数据同步到磁盘上
    [userDefaultes synchronize];
}
+(void)getObject:(GetObject)block forKey:(NSString *)key
{
     NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
   NSObject *object= [userDefaultes objectForKey:key];
    block(object);
}
@end
