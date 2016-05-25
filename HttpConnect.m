//
//  HttpConnect.m
//  ASIHttpDemo
//
//  Created by 张铁君 on 15/12/12.
//  Copyright (c) 2015年 xzit. All rights reserved.
//

#import "HttpConnect.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"
#import "HttpUrl.h"
@implementation HttpConnect
+(void)requestWithJson:(NSString *)urlString parmas:(NSMutableDictionary *)params httpMethod:(NSString *)method completeBlock:(RequestFinishJsonBlock)block
{
    //处理GET请求
    if ([[method uppercaseString] isEqualToString:@"GET"]) {
        urlString=[urlString stringByAppendingString:@"?"];
        NSArray *keys=[params allKeys];
        for (int i=0; i<keys.count; i++) {
            NSString *key=[keys objectAtIndex:i];
            NSString *values=[params valueForKey:key];
            urlString= [urlString stringByAppendingFormat:@"&%@=%@",key,values];
        }
       
    }
    NSURL *url=[NSURL URLWithString:urlString];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:method];
    [request setTimeOutSeconds:HTTP_TIME_OUT];
    //处理POST请求
    if ([[method uppercaseString] isEqualToString:@"POST"]) {
        NSArray *keys=[params allKeys];
        for (int i=0; i<keys.count; i++) {
            NSString *key=[keys objectAtIndex:i];
            NSString *value=[params objectForKey:key];
            //if ([value isKindOfClass:[UIImage class]]) {
            //  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test4" ofType:@"gif"];
            //  NSData*  data=[NSData dataWithContentsOfFile:filePath];
            //                NSData *imageData=UIImageJPEGRepresentation(value, 1.0);
            //          [request addData:imageData forKey:key];
            // }
            [request setPostValue:value forKey:key];
            
        }
    }
    
    [request setCompletionBlock:^{
        NSData *data=[request responseData];
        NSJSONSerialization *json=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        block(json);
    }];
    [request startAsynchronous];
}


+(void)requestWithData:(NSString *)urlString parmas:(NSMutableDictionary *)params httpMethod:(NSString *)method completeBlock:(RequestFinishDataBlock)block
{
   
    //判断是GET方式 进行请求数据拼接
    if ([[method uppercaseString] isEqualToString:@"GET"]) {
      
        urlString=[urlString stringByAppendingString:@"?"];
        NSArray *keys=[params allKeys];
        for (int i=0; i<keys.count; i++) {
            NSString *key=[keys objectAtIndex:i];
            NSString *values=[params valueForKey:key];
            urlString= [urlString stringByAppendingFormat:@"&%@=%@",key,values];
        }
       
    }
        
    NSURL *url=[NSURL URLWithString:urlString];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:method];
    [request setTimeOutSeconds:HTTP_TIME_OUT];
    //判断是POST方式 进行请求数据拼接
    if ([[method uppercaseString] isEqualToString:@"POST"]) {
        NSArray *keys=[params allKeys];
        for (int i=0; i<keys.count; i++) {
            NSString *key=[keys objectAtIndex:i];
            NSString *value=[params objectForKey:key];
            [request setPostValue:value forKey:key];
            
        }
    }
    
    [request setCompletionBlock:^{
        NSData *data=[request responseData];
        block(data
              );
    }];
    [request startAsynchronous];
}
@end
