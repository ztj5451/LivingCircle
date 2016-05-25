//
//  MainViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/7.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "MainViewController.h"
#import "ScreenUtils.h"
#import "images.h"
#import "Strings.h"
#import "Colors.h"
@interface MainViewController ()

@end
static  UIView *tempView=nil ;
@implementation MainViewController
+(void)footBarHidden:(UIView *)footBar
{
    footBar.hidden=YES;
}
+(void)footBarVisable:(UIView *)footBar
{
    footBar.hidden=NO;
}
+(void)setFootBarHidden:(BOOL)flag
{
    if (flag) {
        tempView.hidden=YES;
    }else
    {
        tempView.hidden=NO;
    }
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self initFootBar];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark --初始化footbar
-(void)initFootBar
{
#pragma mark --设置背景颜色
    mainView =[[UIView alloc]initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH, SCREEN_HEIGHT)];
    mainView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:mainView];
#pragma mark --初始化toolbar
    mainFootBar=[[UIView alloc]initWithFrame:CGRectMake(ZERO, SCREEN_HEIGHT-FOOTBAR_HEIGHT, SCREEN_WIDTH, FOOTBAR_HEIGHT)];
    tempView=mainFootBar;
    //设置toolbar的背景颜色
    mainFootBar.backgroundColor=[UIColor clearColor];
    [self.view addSubview:mainFootBar];
    
    //添加toolbar的背景图片
    UIImageView *footBarBg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:footbar_bg]];
    [mainFootBar addSubview:footBarBg];
    [footBarBg release];
    
    
    
    
#pragma mark --设置home控制器
    homeController=[[HomeViewController alloc]init];
    homeController.view.frame=CGRectMake(ZERO, ZERO, SCREEN_WIDTH, SCREEN_HEIGHT-FOOTBAR_HEIGHT);
    
    homeNav=[[UINavigationController alloc]initWithRootViewController:homeController];
    [mainView addSubview:homeNav.view];
    homeNav.view.hidden=NO;
    
#pragma mark --设置home按钮
    homeBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    homeBtn.frame=CGRectMake(MARGIN_LEFT, ITEM_HEIGHT, MAIN_ITEM_SIZE, MAIN_ITEM_SIZE);
    homeLabel=[[UILabel alloc]init];
    
    homeLabel.frame=CGRectMake(ZERO, ITEM_LABLE_MARGIN, ITEM_WIDTH, ITEM_LABLE_HEIGHT);
    homeLabel.text=home_lable;
    homeLabel.textAlignment=NSTextAlignmentCenter;
    homeLabel.font=[UIFont systemFontOfSize:12];
    [homeLabel setTextColor:[Colors titleBarColor]];
    [mainFootBar addSubview:homeLabel];
    [homeLabel release];
    homeBtn.tag=101;
    [homeBtn setAdjustsImageWhenDisabled:YES];
    [homeBtn setBackgroundImage:[UIImage imageNamed:home_pressed] forState:UIControlStateNormal];
    [homeBtn addTarget:self action:@selector(homeAction:) forControlEvents:UIControlEventTouchUpInside];
    //将按钮添加到toolbar上去
    [mainFootBar addSubview:homeBtn];
#pragma mark --设置serviceCenter按钮
    
    serviceCenterBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    serviceCenterBtn.frame=CGRectMake(MARGIN_LEFT+ITEM_WIDTH, ITEM_HEIGHT, MAIN_ITEM_SIZE, MAIN_ITEM_SIZE);
    serviceCenterLabel=[[UILabel alloc]init];
    
    serviceCenterLabel.frame=CGRectMake(ITEM_WIDTH, ITEM_LABLE_MARGIN, ITEM_WIDTH, ITEM_LABLE_HEIGHT);
    serviceCenterLabel.text=serviceCenter_lable;
    serviceCenterLabel.textAlignment=NSTextAlignmentCenter;
    serviceCenterLabel.font=[UIFont systemFontOfSize:12];
    [mainFootBar addSubview:serviceCenterLabel];
    [serviceCenterLabel release];
    serviceCenterBtn.tag=102;
    [serviceCenterBtn setAdjustsImageWhenDisabled:YES];
    [serviceCenterBtn setBackgroundImage:[UIImage imageNamed:service_normal] forState:UIControlStateNormal];
    [serviceCenterBtn addTarget:self action:@selector(serviceCenterAction:) forControlEvents:UIControlEventTouchUpInside];
    //将按钮添加到toolbar上去
    [mainFootBar addSubview:serviceCenterBtn];
    
#pragma mark --设置my按钮
    myBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    myBtn.frame=CGRectMake(MARGIN_LEFT+ITEM_WIDTH*2, ITEM_HEIGHT, MAIN_ITEM_SIZE, MAIN_ITEM_SIZE);
    myLabel=[[UILabel alloc]init];
    
    myLabel.frame=CGRectMake(ZERO+ITEM_WIDTH*2, ITEM_LABLE_MARGIN, ITEM_WIDTH, ITEM_LABLE_HEIGHT);
    myLabel.text=my_lable;
    myLabel.textAlignment=NSTextAlignmentCenter;
    myLabel.font=[UIFont systemFontOfSize:12];
    [mainFootBar addSubview:myLabel];
    [myLabel release];
    myBtn.tag=103;
    [myBtn setAdjustsImageWhenDisabled:YES];
    [myBtn setBackgroundImage:[UIImage imageNamed:my_normal] forState:UIControlStateNormal];
    [myBtn addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    //将按钮添加到toolbar上去
    [mainFootBar addSubview:myBtn];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark --home按钮事件
-(void)homeAction:(UIButton *)button
{
    if (homeController==nil) {
        homeController=[[HomeViewController alloc]init];
        homeController.view.frame=CGRectMake(ZERO, ZERO, SCREEN_WIDTH, SCREEN_HEIGHT-FOOTBAR_HEIGHT);
        homeNav=[[UINavigationController alloc]initWithRootViewController:homeController];
        //将初始化的controller的view添加到大背景上去
        [mainView addSubview:homeNav.view];
        homeNav.view.hidden=NO;
        [homeLabel setTextColor:[Colors titleBarColor]];
        [serviceCenterLabel setTextColor:[UIColor blackColor]];
        [myLabel setTextColor:[UIColor blackColor]];
    }else
    {
        homeNav.view.hidden=YES;
    }
    [homeBtn setBackgroundImage:[UIImage imageNamed:home_pressed] forState:UIControlStateNormal];
    [serviceCenterBtn setBackgroundImage:[UIImage imageNamed:service_normal] forState:UIControlStateNormal];
    [myBtn setBackgroundImage:[UIImage imageNamed:my_normal] forState:UIControlStateNormal];
    
    
    if (homeNav.view.hidden==YES) {
        homeNav.view.hidden=NO;
        serviceCenterNav.view.hidden=YES;
        myNav.view.hidden=YES;
      [homeLabel setTextColor:[Colors titleBarColor]];
      [serviceCenterLabel setTextColor:[UIColor blackColor]];
        [myLabel setTextColor:[UIColor blackColor]];
        

        
    }
}
#pragma  mark --serviceCenter按钮事件
-(void)serviceCenterAction:(UIButton *)button
{
    if (serviceCenterController==nil) {
        serviceCenterController=[[ServiceCenterViewController alloc]init];
        serviceCenterController.view.frame=CGRectMake(ZERO, ZERO, SCREEN_WIDTH, SCREEN_HEIGHT-FOOTBAR_HEIGHT);
        serviceCenterNav=[[UINavigationController alloc]initWithRootViewController:serviceCenterController];
        //将初始化的controller的view添加到大背景上去
        [mainView addSubview:serviceCenterNav.view];
        serviceCenterNav.view.hidden=NO;
        [serviceCenterLabel setTextColor:[Colors titleBarColor]];
        [homeLabel setTextColor:[UIColor blackColor]];
        [myLabel setTextColor:[UIColor blackColor]];
    }else
    {
        serviceCenterNav.view.hidden=YES;
    }
    [homeBtn setBackgroundImage:[UIImage imageNamed:home_normal] forState:UIControlStateNormal];
    [serviceCenterBtn setBackgroundImage:[UIImage imageNamed:service_pressed] forState:UIControlStateNormal];
    [myBtn setBackgroundImage:[UIImage imageNamed:my_normal] forState:UIControlStateNormal];
    
    
    if (serviceCenterNav.view.hidden==YES) {
        homeNav.view.hidden=YES;
        serviceCenterNav.view.hidden=NO;
        myNav.view.hidden=YES;
        [serviceCenterLabel setTextColor:[Colors titleBarColor]];
        [homeLabel setTextColor:[UIColor blackColor]];
        [myLabel setTextColor:[UIColor blackColor]];
        
    }
    
}
#pragma  mark --my按钮事件
-(void)myAction:(UIButton *)button
{
    if (myController==nil) {
        myController=[[MyViewController alloc]init];
        myController.view.frame=CGRectMake(ZERO, ZERO, SCREEN_WIDTH, SCREEN_HEIGHT-FOOTBAR_HEIGHT);
        myNav=[[UINavigationController alloc]initWithRootViewController:myController];
        //将初始化的controller的view添加到大背景上去
        [mainView addSubview:myNav.view];
        
        myNav.view.hidden=NO;
        [myLabel setTextColor:[Colors titleBarColor]];
        [homeLabel setTextColor:[UIColor blackColor]];
        [serviceCenterLabel setTextColor:[UIColor blackColor]];
    }else
    {
        myNav.view.hidden=YES;
    }
    [homeBtn setBackgroundImage:[UIImage imageNamed:home_normal] forState:UIControlStateNormal];
    [serviceCenterBtn setBackgroundImage:[UIImage imageNamed:service_normal] forState:UIControlStateNormal];
    [myBtn setBackgroundImage:[UIImage imageNamed:my_pressed] forState:UIControlStateNormal];
    
    
    if (myNav.view.hidden==YES) {
        homeNav.view.hidden=YES;
        serviceCenterNav.view.hidden=YES;
        myNav.view.hidden=NO;
        [myLabel setTextColor:[Colors titleBarColor]];
        [homeLabel setTextColor:[UIColor blackColor]];
        [serviceCenterLabel setTextColor:[UIColor blackColor]];
        
    }
    
}
#pragma mark --释放资源
-(void)dealloc
{
    RELEASE_SAFELY(homeBtn);
    RELEASE_SAFELY(serviceCenterBtn);
    RELEASE_SAFELY(myBtn);
    RELEASE_SAFELY(homeNav);
    RELEASE_SAFELY(serviceCenterNav);
    RELEASE_SAFELY(myNav);
    RELEASE_SAFELY(homeController);
    RELEASE_SAFELY(serviceCenterController);
    RELEASE_SAFELY(myController);
    RELEASE_SAFELY(mainFootBar);
    RELEASE_SAFELY(mainView);
    RELEASE_SAFELY(homeLabel)
    RELEASE_SAFELY(serviceCenterLabel);
    RELEASE_SAFELY(myLabel);
    [super dealloc];
}


@end
