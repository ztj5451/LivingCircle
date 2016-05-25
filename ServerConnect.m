//
//  ServerConnect.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/10.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "ServerConnect.h"
#import "HttpUrl.h"
#import "HttpConnect.h"
#import "Application.h"
@implementation ServerConnect
#pragma mark --banner image
-(void)homeBannerImageAction
{
    NSString *url=[NSString stringWithFormat:@"%@%@",SERVER_IP,COMMON_URL];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    //需要传递的参数
    [params setObject:@"File_Top" forKey:@"fun_bs"];

    //发送请求
    [HttpConnect requestWithJson:url parmas:params httpMethod:@"POST" completeBlock:^(NSJSONSerialization *result) {
       
        NSNotification * banner = [NSNotification notificationWithName:@"bannerInfo" object:result userInfo:nil];
        //发送消息
        [[NSNotificationCenter defaultCenter]postNotification:banner];
    }];
    [params release];

}
#pragma mark --获取分类
-(void)getCategoryAction:(NSString *)location
{
    NSString *url=[NSString stringWithFormat:@"%@%@",SERVER_IP,CUSTOMER_CAGEGORY];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    [params setObject:@"ChaXun" forKey:@"fun_bs"];
    [params setObject:@"1" forKey:@"SES_bs"];
    [params setObject:location forKey:@"jzd"];
    [HttpConnect requestWithJson:url parmas:params httpMethod:@"POST" completeBlock:^(NSJSONSerialization *result) {
        
        NSNotification * category = [NSNotification notificationWithName:@"categoryInfo" object:result userInfo:nil];
        //发送消息
        [[NSNotificationCenter defaultCenter]postNotification:category];
    }];
    [params release];
    
}
#pragma mark --获取分类
-(void)getCityAction
{
    NSString *url=[NSString stringWithFormat:@"%@%@",SERVER_IP,MERCHANT];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    [params setObject:@"Json_Qy" forKey:@"fun_bs"];
    [HttpConnect requestWithJson:url parmas:params httpMethod:@"POST" completeBlock:^(NSJSONSerialization *result) {
        
        NSNotification * cityInfo = [NSNotification notificationWithName:@"cityInfo" object:result userInfo:nil];
        //发送消息
        [[NSNotificationCenter defaultCenter]postNotification:cityInfo];
    }];
    [params release];
    
}
#pragma mark --获取商户列表
-(void)getMerchantListAction:(NSString *)category andName:(NSString *)merchantName
{
    NSString *url=[NSString stringWithFormat:@"%@%@",SERVER_IP,MERCHANT];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    [params setObject:@"ChaXun_Shop" forKey:@"fun_bs"];
    [params setObject:[Application getSelectCity] forKey:@"jzd"];
    [params setObject:merchantName forKey:@"mc_gs"];
    [params setObject:category forKey:@"lx_id"];
    [params setObject:@"sl_zan" forKey:@"order"];
    [params setObject:@"asc" forKey:@"asc"];
    [params setObject:@"50" forKey:@"rp"];
    [params setObject:@"1" forKey:@"page"];
    [params setObject:@"1" forKey:@"Bs_Ws"];
    
    [HttpConnect requestWithJson:url parmas:params httpMethod:@"POST" completeBlock:^(NSJSONSerialization *result) {
        
        NSNotification * merchantList = [NSNotification notificationWithName:@"merchantList" object:result userInfo:nil];
        //发送消息
        [[NSNotificationCenter defaultCenter]postNotification:merchantList];
    }];
    [params release];
    
}
//获取验证码
-(void)getYZM:(NSString *)phoneNumber
{
    NSString *url=[NSString stringWithFormat:@"%@%@",SERVER_IP,COMMON_URL];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    [params setObject:@"Yzm" forKey:@"fun_bs"];
    [params setObject:phoneNumber forKey:@"tel"];
    [HttpConnect requestWithJson:url parmas:params httpMethod:@"POST" completeBlock:^(NSJSONSerialization *result) {
        NSNotification * getYzmAction = [NSNotification notificationWithName:@"getYzmAction" object:result userInfo:nil];
        //发送消息
        [[NSNotificationCenter defaultCenter]postNotification:getYzmAction];
    }];
    [params release];
}
//新用户注册
-(void)registerActionWith:(NSString *)phoneNumber andPassword:(NSString *)password
{
    NSString *url=[NSString stringWithFormat:@"%@%@",SERVER_IP,COMMON_URL];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    [params setObject:@"ZC" forKey:@"fun_bs"];
    [params setObject:@"111111" forKey:@"push_num"];
    [params setObject:@"222222" forKey:@"push_tdh"];
    [params setObject:@"沈阳" forKey:@"jzd"];
    [params setObject:phoneNumber forKey:@"tel"];
    [params setObject:password forKey:@"pass"];
    
    [HttpConnect requestWithJson:url parmas:params httpMethod:@"POST" completeBlock:^(NSJSONSerialization *result) {
        NSNotification * registerAction = [NSNotification notificationWithName:@"registerAction" object:result userInfo:nil];
        //发送消息
        [[NSNotificationCenter defaultCenter]postNotification:registerAction];
    }];
    [params release];
}
@end
