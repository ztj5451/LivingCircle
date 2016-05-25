//
//  RegisterViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/11.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "RegisterViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "ScreenUtils.h"
#import "Images.h"
#import "Colors.h"
#import "ServerConnect.h"
#import "NSToast.h"
#include "NSLoadView.h"
@interface RegisterViewController ()
@property (nonatomic,strong) UIWebView *registerView;
@property(nonatomic,strong) ServerConnect *serverConnect;
@property(nonatomic,strong) NSNotificationCenter *center;
@property(nonatomic,strong) NSNotificationCenter *registerCenter;
@property (nonatomic,retain) UIAlertView *alertView;
@property (nonatomic,retain) NSString *phoneNumber;
@property (nonatomic,retain) NSString *yzm;
@end

@implementation RegisterViewController

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
    [super viewDidLoad];
    _serverConnect=[[ServerConnect alloc]init];
    _center = [NSNotificationCenter defaultCenter];
    _registerCenter=[NSNotificationCenter defaultCenter];
    [self initTitleBar];
    [self initContent];
}
-(void)initTitleBar
{
    UIView *titleBar=[[UIView alloc]initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH, 72)];
    
    [titleBar setBackgroundColor:[UIColor blackColor]];
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:back_btn] forState:UIControlStateNormal];
    backBtn.frame=CGRectMake(5, 27, 40, 40);
    [titleBar addSubview:backBtn];
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(ZERO, 22, SCREEN_WIDTH, 50)];
    [title setText:@"新用户注册"];
    title.textAlignment=UITextAlignmentCenter;
    [title setTextColor:[UIColor whiteColor]];
    [titleBar addSubview:title];
    [self.view addSubview:titleBar];
    [titleBar release];
    [title release];
    [backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)initContent
{
    
    //初始化注册页面
    _registerView=[[UIWebView alloc]initWithFrame:CGRectMake(ZERO, 72, SCREEN_WIDTH, SCREEN_HEIGHT-72)];
    [self.view addSubview:_registerView];
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"register" ofType:@"html"];
    NSURL *localUrl = [[NSURL alloc] initFileURLWithPath:htmlPath];
    [_registerView loadRequest:[NSURLRequest requestWithURL:localUrl]];
    [localUrl release];
    JSContext *context = [_registerView  valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    context[@"getYZMAction"] = ^(NSString *phoneNumber) {
        [self initLoadView:@"验证码获取中请稍后..."];
        
        _phoneNumber=phoneNumber;
       [_serverConnect getYZM:phoneNumber];
     
    };
    context[@"registerAction"] = ^(NSString *yzm,NSString *password) {
        [self initLoadView:@"注册中请稍后..."];
        NSLog(@"%@",yzm);
        NSLog(@"%@",password);
        if ([_yzm isEqualToString:yzm]) {
            [_serverConnect registerActionWith:_phoneNumber andPassword:password];
        }else
        {
            [NSToast showWithText:@"验证码输入有误!" bottomOffset:50 duration:1];
        }
        
        
    };
   
    
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [_center addObserver:self selector:@selector(getYzmAction:) name:@"getYzmAction" object:nil];
    [_registerCenter addObserver:self selector:@selector(registerAction:) name:@"registerAction" object:nil];
    
}


#pragma mark --用户注册
-(void)registerAction:(id)sender
{
    
    [NSLoadView loadViewWith:_alertView];
    NSJSONSerialization *json=  [sender valueForKey:@"object"];
    if ([[json valueForKey:@"bs"]isEqualToString:@"1"]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        [NSLoadView loadViewDismiss:_alertView];
       [NSToast showWithText:[json valueForKey:@"msg"]bottomOffset:50 duration:1];
        
    }else
    {
      [NSLoadView loadViewDismiss:_alertView];
      [NSToast showWithText:[json valueForKey:@"msg"]bottomOffset:50 duration:1];
        
    }
}
#pragma mark --获取验证码
-(void)getYzmAction:(id)sender
{
     NSJSONSerialization *json=  [sender valueForKey:@"object"];
    if ([[json valueForKey:@"bs"]isEqualToString:@"0"]) {
         [NSToast showWithText:[json valueForKey:@"msg"]bottomOffset:50 duration:1];
        return;
    }else
    {
        _yzm=[json valueForKey:@"yzm"];

        [NSLoadView loadViewDismiss:_alertView];
        NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"register_two" ofType:@"html"];
        NSURL *localUrl = [[NSURL alloc] initFileURLWithPath:htmlPath];
        [_registerView loadRequest:[NSURLRequest requestWithURL:localUrl]];
        [localUrl release];
    }
}
#pragma mark --初始化loadview
-(void)initLoadView:(NSString *)alertMessage
{
    _alertView=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:alertMessage delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [NSLoadView loadViewWith:_alertView];
}
#pragma mark --返回按钮
-(void)backAction:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --资源释放
-(void)dealloc
{
    RELEASE_SAFELY(_registerView)
    RELEASE_SAFELY(_alertView);
    RELEASE_SAFELY(_center);
    RELEASE_SAFELY(_registerCenter);
    RELEASE_SAFELY(_serverConnect);
    RELEASE_SAFELY(_yzm);
    RELEASE_SAFELY(_phoneNumber);
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"registerAction" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getYzmAction" object:nil];
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
