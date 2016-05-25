//
//  HttpConnect.h
//  ASIHttpDemo
//
//  Created by 张铁君 on 15/12/12.
//  Copyright (c) 2015年 xzit. All rights reserved.
//  此方法为工具类，用于从服务端获取数据
//

#import <Foundation/Foundation.h>

typedef void (^RequestFinishJsonBlock)(NSJSONSerialization *result);
typedef void (^RequestFinishDataBlock)(NSData *result);
@interface HttpConnect : NSObject
/*
 *
 *  从服务段获取json数据
 *
 */
+(void)requestWithJson:(NSString *)urlString parmas:(NSMutableDictionary *)params httpMethod:(NSString *)method completeBlock:(RequestFinishJsonBlock )block;
/*
 *
 *  从服务段获取data数据
 *
 */
+(void)requestWithData:(NSString *)urlString parmas:(NSMutableDictionary *)params httpMethod:(NSString *)method completeBlock:(RequestFinishDataBlock )block;
@end
