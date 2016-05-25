//
//  ServerConnect.h
//  LivingCircle
//
//  Created by 张铁君 on 16/4/10.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerConnect : NSObject
@property (nonatomic,strong) NSJSONSerialization *jsonResult;
//home  banner 图片
-(void)homeBannerImageAction;
//获取home页面分类
-(void)getCategoryAction:(NSString *)location;
//切换城市 获取城市列表
-(void)getCityAction;
//获取商户列表
-(void)getMerchantListAction:(NSString *)category andName:(NSString *)merchantName;
//获取验证码
-(void)getYZM:(NSString *)phoneNumber;
//新用户注册
-(void)registerActionWith:(NSString *)phoneNumber andPassword:(NSString *)password;
@end

