//
//  SharePrefence.h
//  UtilsDemo
//
//  Created by 张铁君 on 15/12/12.
//  Copyright (c) 2015年 沈阳云融. All rights reserved.
//

#import <Foundation/Foundation.h>
//typedef void (^RequestFinishJsonBlock)(NSJSONSerialization *result);
typedef void (^ReadSaveUserInfo)(NSDictionary *result);
typedef void (^GetObject)(NSObject *result);
@interface SharePrefence : NSObject
/*
 *  保存用户名与密码
 *
 */
+(void)saveUserName:(NSString *) userName andPassword:(NSString *) password;
/*
 *  获取保存的用户名和密码
 */
+(void)readSaveUser:(ReadSaveUserInfo )block;
/*
 *  键值对保存数据到本地
 */
+(void)saveObjet:(NSObject *) object forKey:(NSString *) key;
/*
 *  通过key获取到保存本地的value
 */
+(void)getObject:(GetObject) block forKey:(NSString *) key;
@end
