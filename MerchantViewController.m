//
//  MerchantViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/13.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "MerchantViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "Application.h"
#import "Images.h"
#import "ScreenUtils.h"
@interface MerchantViewController ()
@property (nonatomic,strong) UIWebView *merchantWebView;
@end

@implementation MerchantViewController

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
    [self initContent];
    [self initTitleBar];
}
#pragma mark --初始化页面
-(void)initContent
{
    _merchantWebView=[[UIWebView alloc]initWithFrame:CGRectMake(ZERO, ZERO,SCREEN_WIDTH,SCREEN_HEIGHT)];
    [self.view addSubview:_merchantWebView];
    JSContext *context = [_merchantWebView  valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"merchantContent"] = ^() {
        return [Application getMerchantContent];
    };
    NSString *bannerPath = [[NSBundle mainBundle] pathForResource:@"merchant" ofType:@"html"];
    NSURL *bannerUrl = [[NSURL alloc] initFileURLWithPath:bannerPath];
    [_merchantWebView loadRequest:[NSURLRequest requestWithURL:bannerUrl]];
    
}
#pragma mark --初始化titlebar
-(void)initTitleBar
{
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:back_btn] forState:UIControlStateNormal] ;
    [backButton addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame=CGRectMake(10, 27, 40, 40);
    [self.view addSubview:backButton];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --返回按钮
-(void)backBtnAction:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
