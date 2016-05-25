//
//  MainViewController.h
//  LivingCircle
//
//  Created by 张铁君 on 16/4/7.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "ServiceCenterViewController.h"
#import "MyViewController.h"
@interface MainViewController : UIViewController
{
    //定义button按钮
    UIButton *homeBtn;
    UIButton *serviceCenterBtn;
    UIButton *myBtn;
    //定义label
    UILabel *homeLabel;
    UILabel *serviceCenterLabel;
    UILabel *myLabel;
    //定义UINavigationController
    UINavigationController *homeNav;
    UINavigationController *serviceCenterNav;
    UINavigationController *myNav;
    
    HomeViewController *homeController;
    ServiceCenterViewController *serviceCenterController;
    MyViewController *myController;
    UIView *mainFootBar;
    UIView *mainView;
    
    
}

+(void)footBarHidden:(UIView *)footBar;
+(void)footBarVisable:(UIView *)footBar;
+(void)setFootBarHidden:(BOOL)flag;
@end
