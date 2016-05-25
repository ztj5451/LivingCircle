//
//  NearbyMerchantViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/12.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "NearbyMerchantViewController.h"
#import "ScreenUtils.h"
#import "Images.h"
@interface NearbyMerchantViewController ()
@property (nonatomic,strong) UIWebView *nearbyWebView;
@end

@implementation NearbyMerchantViewController

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
#pragma mark --初始化titlebar
-(void)initTitleBar
{
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:back_btn] forState:UIControlStateNormal] ;
    [backButton addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame=CGRectMake(10, 27, 40, 40);
    [self.view addSubview:backButton];
}
#pragma mark --初始化
-(void)initContent
{
    _nearbyWebView=[[UIWebView alloc]initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_nearbyWebView];
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"map" ofType:@"html"];
    NSURL *localUrl = [[NSURL alloc] initFileURLWithPath:htmlPath];
    [_nearbyWebView loadRequest:[NSURLRequest requestWithURL:localUrl]];
    [localUrl release];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --返回按钮事件
-(void)backBtnAction:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --释放资源
-(void)dealloc
{
    RELEASE_SAFELY(_nearbyWebView);
    [super dealloc];
}

@end
