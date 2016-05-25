//
//  ServiceCenterViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/6.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "ServiceCenterViewController.h"
#import "ScreenUtils.h"
#import "Images.h"
#import "PhoneUtils.h"
#import "Application.h"
@interface ServiceCenterViewController ()

@end

@implementation ServiceCenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"客服中心";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initContent];
    
}
#pragma mark --初始化
-(void)initContent
{
    //大背景
    UIView *serviceView=[[UIView alloc]initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH, SCREEN_HEIGHT)];
    UIImageView *backgroundImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:service_bg]];
    backgroundImage.frame=CGRectMake(ZERO, ZERO, SCREEN_WIDTH, SCREEN_HEIGHT);
    backgroundImage.contentMode=UIViewContentModeScaleToFill;
    [serviceView addSubview:backgroundImage];
    [self.view addSubview:serviceView];
    [backgroundImage release];
    //上方图标
    UIImageView *topImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:service_top]];
    topImageView.frame=CGRectMake((SCREEN_WIDTH-180)/2, 50, 180, 180);
    [serviceView addSubview:topImageView];
    [topImageView release];
    UIButton *phoneButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [phoneButton setBackgroundImage:[UIImage imageNamed:service_phone_normal] forState:UIControlStateNormal];
    [phoneButton setBackgroundImage:[UIImage imageNamed:service_phone_pressed] forState:UIControlStateSelected];
    phoneButton.frame=CGRectMake((SCREEN_WIDTH-80)/2, 260, 80, 80);
    [serviceView addSubview:phoneButton];
    [phoneButton release];
    [phoneButton addTarget:self action:@selector(callAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *fontImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:service_font]];
    fontImage.frame=CGRectMake((SCREEN_WIDTH-76)/2, 350, 76, 30);
    
    UILabel *fontLable=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-76)/2, 352, 76, 30)];
    
    fontLable.text=@"电话咨询";
    [fontLable setFont:[UIFont systemFontOfSize:12]];
    [fontLable setTextColor:[UIColor greenColor]];
    fontLable.textAlignment=UITextAlignmentCenter;
    [serviceView addSubview:fontImage];
    [serviceView addSubview:fontLable];
    [fontImage release];
    [fontLable release];
    
    
    
    [serviceView release];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
    [super viewWillAppear:animated];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --点击按钮拨打电话
-(void)callAction:(UIButton *)button
{
    [PhoneUtils numberToCall:[Application getKefuNumber]];
}

@end
