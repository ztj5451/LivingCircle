//
//  MerchantListViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/10.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "MerchantListViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "Application.h"
#import "ScreenUtils.h"
#import "Colors.h"
#import "Images.h"
#import "MainViewController.h"
#import "ServerConnect.h"
#import "NearbyMerchantViewController.h"
#import "MerchantDetailViewController.h"
@interface MerchantListViewController ()
@property (nonatomic,strong) UIWebView *merchantListWebView;
@property(nonatomic,strong) ServerConnect *serverConnect;
@property(nonatomic,strong) NSNotificationCenter *center;
@end

@implementation MerchantListViewController

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
    [self initTitleBar];
    [self initContent];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    
    self.navigationController.navigationBarHidden=YES;
    [super viewWillAppear:animated];
   
    
}
#pragma mark --search titlebar
-(void)initTitleBar
{
    //titlebar 背景
    UIView *titleBarView=[[UIView alloc]initWithFrame:CGRectMake(ZERO, ZERO+STATUS_BAR_HEIGHT, SCREEN_WIDTH, TITLE_BAR_HEIGHT)];
    [self.view addSubview:titleBarView];
    [titleBarView release];
    [titleBarView setBackgroundColor:[UIColor colorWithRed:248/255.0 green:98/255.0 blue:63/255.0 alpha:1]];
    //返回按钮
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame=CGRectMake(10, 13, 24, 24);
    [backBtn setBackgroundImage:[UIImage imageNamed:back] forState:UIControlStateNormal];
    [titleBarView addSubview:backBtn];
    [backBtn addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //地图按钮
    UIButton *mapBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    mapBtn.frame=CGRectMake(SCREEN_WIDTH-40, 8, 34, 34);
    [mapBtn setBackgroundImage:[UIImage imageNamed:maps] forState:UIControlStateNormal];
    [titleBarView addSubview:mapBtn];
    [mapBtn addTarget:self action:@selector(mapButtonActon:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIView *searBarView=[[UIView alloc]initWithFrame:CGRectMake(45, 10, SCREEN_WIDTH-95, 30)];
    
    [titleBarView addSubview:searBarView];
    [searBarView release];
    
    
    
    UIImageView *searchBar=[[UIImageView alloc]initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH-95, 30)];
    [searchBar setImage:[UIImage imageNamed:search_bg]];
    [searBarView addSubview:searchBar];
    [searchBar release];

    //搜索图标
    UIImageView *searchIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:search_icon]];
    searchIcon.frame=CGRectMake(2, 4, 22, 22) ;
    [searchBar addSubview:searchIcon];
    [searchIcon release];
    searchKeyEdit=[[UITextField alloc]initWithFrame:CGRectMake(74, 4, 200, 40)];
    searchKeyEdit.placeholder=@"请输入查询商户名称";
    [searchKeyEdit setFont:[UIFont systemFontOfSize:14]];
    [titleBarView addSubview:searchKeyEdit];
    searchKeyEdit.delegate=self;
    searchKeyEdit.clearsOnBeginEditing = YES;
    searchKeyEdit.returnKeyType =UIReturnKeySearch;
    //语音图标
    UIImageView *voiceIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:voice_icon]];
    voiceIcon.frame=CGRectMake(SCREEN_WIDTH-117, 4, 22, 22) ;
    [searchBar addSubview:voiceIcon];
    [voiceIcon release];

    
}
#pragma mark --content
-(void)initContent
{
    _serverConnect=[[ServerConnect alloc]init];
    _center = [NSNotificationCenter defaultCenter];
    [_serverConnect getMerchantListAction:(NSString *) [Application getMerchantCategoryId:[[Application getCategoryId] integerValue]] andName:@""];
    [_center addObserver:self selector:@selector(merchantListAction:) name:@"merchantList" object:nil];
    _merchantListWebView=[[UIWebView alloc]initWithFrame:CGRectMake(ZERO, STATUS_BAR_HEIGHT+TITLE_BAR_HEIGHT,SCREEN_WIDTH,SCREEN_HEIGHT-STATUS_BAR_HEIGHT-TITLE_BAR_HEIGHT)];
    [self.view addSubview:_merchantListWebView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --加载商户列表
-(void)merchantListAction:(id)sender
{
    JSContext *context = [_merchantListWebView  valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"merchantList"] = ^() {
        return [sender valueForKey:@"object"];
    };
    context[@"filePath"] = ^() {
        return [Application getFilePath];
    };
    context[@"bannerFiles"] = ^() {
        
        return [Application getCategoryBanner:[[Application getCategoryId] integerValue]];
    };
    context[@"merchantContent"] = ^(NSString *content) {
        
        [Application setMerchantContent:content];
        MerchantDetailViewController *detailController=[[MerchantDetailViewController alloc]init];
        [self.navigationController pushViewController:detailController animated:YES];
        [detailController release];
        
    };
    NSString *bannerPath = [[NSBundle mainBundle] pathForResource:@"merchant_list" ofType:@"html"];
    NSURL *bannerUrl = [[NSURL alloc] initFileURLWithPath:bannerPath];
    [_merchantListWebView loadRequest:[NSURLRequest requestWithURL:bannerUrl]];
}
#pragma mark --按钮点击事件
-(void)backButtonAction:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
    [MainViewController setFootBarHidden:NO];
}
#pragma mark --进度地图显示周边商户
-(void)mapButtonActon:(UIButton *)button
{
    NearbyMerchantViewController *nearByController=[[NearbyMerchantViewController alloc]init];
    [self.navigationController pushViewController:nearByController animated:YES];
    [nearByController release];
}
#pragma mark --输入框代理方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [searchKeyEdit resignFirstResponder];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
