//
//  HomeViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/6.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "HomeViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "ScreenUtils.h"
#import "ServerConnect.h"
#import "MerchantListViewController.h"
#import "Application.h"
#import "Images.h"
#import "SelectCityViewController.h"
#import "MainViewController.h"
#import "PushMessageViewController.h"
#import "SearchViewController.h"
#import "SearchViewController.h"
#import "Colors.h"
@interface HomeViewController ()
@property (nonatomic,strong) UIWebView *homeBanner;
@property (nonatomic,strong) UIWebView *myWebView;
@property(nonatomic,strong) ServerConnect *serverConnect;
@property(nonatomic,strong) NSNotificationCenter *center;
@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"首页";
    }
    return self;
}
-(void)loadView
{
    [super loadView];
     _serverConnect=[[ServerConnect alloc]init];
     _center = [NSNotificationCenter defaultCenter];
    [self initTitleBar];
    [self initHomeBannerAction];
    [self initHomePageAction];
  
}

#pragma mark --初始化titlebar
-(void)initTitleBar
{
    UIView *titleBar=[[UIView alloc]initWithFrame:CGRectMake(ZERO, STATUS_BAR_HEIGHT, SCREEN_HEIGHT, TITLE_BAR_HEIGHT)];
    //设置背景色
    [titleBar setBackgroundColor:[Colors titleBarColor]];
    
    [self.view addSubview:titleBar];
    [titleBar release];
    //初始化左侧图标及文字
    UIView *locationView=[[UIView alloc]initWithFrame:CGRectMake(ZERO, ZERO, 60, TITLE_BAR_HEIGHT)];
    UIImageView *location=[[UIImageView alloc]initWithImage:[UIImage imageNamed:current_city]];
    location.frame=CGRectMake(10, 15, 20, 20);
    [locationView addSubview:location];
    [location release];
    
    cityName=[[UILabel alloc]initWithFrame:CGRectMake(35, ZERO, 45, TITLE_BAR_HEIGHT)];
    
    cityName.textAlignment=NSTextAlignmentLeft;
    [cityName setTextColor:[UIColor whiteColor]];
    cityName.font=[UIFont systemFontOfSize:12];
    [locationView addSubview:cityName];
    
    [titleBar addSubview:locationView];
    [locationView release];
  
    UITapGestureRecognizer *selectAction = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectCityAction:)];
    [locationView addGestureRecognizer:selectAction];
    [selectAction release];
    //search bar
    UIView *searBarView=[[UIView alloc]initWithFrame:CGRectMake(70, 10, SCREEN_WIDTH-120, 30)];
    
    [titleBar addSubview:searBarView];
    [searBarView release];
    
    
    
    UIImageView *searchBar=[[UIImageView alloc]initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH-120, 30)];
    [searchBar setImage:[UIImage imageNamed:search_bg]];
    [searBarView addSubview:searchBar];
    [searchBar release];
    
    UITapGestureRecognizer *searchAction = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toSearchAction:)];
    [searBarView addGestureRecognizer:searchAction];
    [searchAction release];

    
    //搜索图标
    UIImageView *searchIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:search_icon]];
    searchIcon.frame=CGRectMake(2, 4, 22, 22) ;
    [searchBar addSubview:searchIcon];
    [searchIcon release];
    UILabel *tipLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 4, 200, 40)];
    [tipLable setText:@"温泉洗浴/生活服务"];
    [tipLable setFont:[UIFont systemFontOfSize:12]];
    [titleBar addSubview:tipLable];
    [tipLable release];
    
    
    //语音图标
    UIImageView *voiceIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:voice_icon]];
    voiceIcon.frame=CGRectMake(SCREEN_WIDTH-142, 4, 22, 22) ;
    [searchBar addSubview:voiceIcon];
    [voiceIcon release];
    
    //pushMessage 图标
    UIButton *pushMessageButton=[UIButton buttonWithType:UIButtonTypeCustom];
    pushMessageButton.frame=CGRectMake(SCREEN_WIDTH-40, 13, 24, 24);
    [pushMessageButton setBackgroundImage:[UIImage imageNamed:push_message] forState:UIControlStateNormal];
    [pushMessageButton addTarget:self action:@selector(pushMessageAction:) forControlEvents:UIControlEventTouchUpInside];
    [titleBar addSubview:pushMessageButton];
    [pushMessageButton release];
    
}
#pragma mark --初始化home banner
-(void)initHomeBannerAction
{
   
    [_serverConnect homeBannerImageAction];
   
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [_center addObserver:self selector:@selector(homeBanner:) name:@"bannerInfo" object:nil];
    
    _homeBanner=[[UIWebView alloc]initWithFrame:CGRectMake(ZERO, STATUS_BAR_HEIGHT+TITLE_BAR_HEIGHT,SCREEN_WIDTH,HOME_BANNER_HEIGHT)];
    [self.view addSubview:_homeBanner];
    
    
}
#pragma mark --初始化home页面
-(void)initHomePageAction
{
    [_serverConnect getCategoryAction:@""];
     [_center addObserver:self selector:@selector(homeCategory:) name:@"categoryInfo" object:nil];
    _myWebView=[[UIWebView alloc]initWithFrame:CGRectMake(ZERO, HOME_BANNER_HEIGHT+TITLE_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-250)];
    _myWebView.delegate=self;
    [_myWebView setUserInteractionEnabled:YES];
    //添加webview到当前viewcontroller的view上
    [self.view addSubview:_myWebView];
 
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [Application setSelectCity:@"沈阳"];
    cityName.text=[Application getSelectCity];
    self.navigationController.navigationBarHidden=YES;
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --webViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //网页加载之前会调用此方法
    
    //retrun YES 表示正常加载网页 返回NO 将停止网页加载
    NSURL* url = [request URL];
    NSString* urlstring = [NSString stringWithFormat:@"%@",url];
    NSLog(@"url = >%@",urlstring);
    
    NSLog(@"网页加载之前会调用此方法");
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    //开始加载网页调用此方法
    NSLog(@"开始加载网页调用此方法");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //网页加载完成调用此方法
    NSLog(@"网页加载完成调用此方法");
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //网页加载失败 调用此方法
    NSLog(@"网页加载失败 调用此方法");
}
-(void)homeBanner:(id)sender{
    
    JSContext *context = [_homeBanner  valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"homeBanner"] = ^() {
        
        [Application setKefuNumber:[[sender valueForKey:@"object"] objectForKey:@"tel_kf"]];
        NSLog(@"%@",[sender valueForKey:@"object"]);
        return [sender valueForKey:@"object"];
        
    };
    
    NSString *bannerPath = [[NSBundle mainBundle] pathForResource:@"home_banner" ofType:@"html"];
    NSURL *bannerUrl = [[NSURL alloc] initFileURLWithPath:bannerPath];
    [_homeBanner loadRequest:[NSURLRequest requestWithURL:bannerUrl]];

}
-(void)homeCategory:(id)sender{
    
    JSContext *context = [_myWebView  valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"goToMerchantList"] = ^(NSString *position){
        [self goToMerchantList:position];
    };
    //获取分类
    context[@"homeCategory"] = ^() {
      NSJSONSerialization *json=  [sender valueForKey:@"object"];
        
    NSMutableArray *category=[[NSMutableArray alloc]initWithCapacity:10];
    NSMutableArray *categoryId=[[NSMutableArray alloc]initWithCapacity:10];
     NSMutableArray *categoryBanner=[[NSMutableArray alloc]initWithCapacity:0];
     NSString *path=[json valueForKey:@"path"];
     NSArray *array=[[NSArray alloc]initWithArray:[json valueForKey:@"lb"]];
    for(id obj in array){
        [categoryBanner addObject:[obj valueForKey:@"file_top"]];
        [category addObject:[obj valueForKey:@"mc"]];
        [categoryId addObject:[obj valueForKey:@"id"]];
        NSArray *child=[[NSArray alloc]initWithArray:[obj valueForKey:@"lb"]];
        for(id object in child)
        {
            [category addObject:[object valueForKey:@"mc"]];
            [categoryId addObject:[object valueForKey:@"id"]];
            [categoryBanner addObject:[object valueForKey:@"file_top"]];
        }
    }
        [Application setMerchanteCategoryId:categoryId];
        [Application setCategoryBanner:categoryBanner];
        [Application setFilePath:path];
        return category;
    };
    
    
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"home" ofType:@"html"];
    NSURL *localUrl = [[NSURL alloc] initFileURLWithPath:htmlPath];
    [_myWebView loadRequest:[NSURLRequest requestWithURL:localUrl]];
    

}
#pragma mark --进入push message 页面
-(void)pushMessageAction:(UIButton *)button
{
    [MainViewController setFootBarHidden:YES];
    PushMessageViewController *pushMessage=[[PushMessageViewController alloc]init];
    [self.navigationController pushViewController:pushMessage animated:YES];
    [pushMessage release];
}
#pragma mark --城市选择
-(void)selectCityAction:(UIButton *)button
{
    [CommonViewController setTitle:@"城市切换"];
    [MainViewController setFootBarHidden:YES];
    SelectCityViewController *selectCity=[[SelectCityViewController alloc]init];
    [self.navigationController pushViewController:selectCity animated:YES];
    [selectCity release];
}
#pragma mark -- 根据分类id进入不同的分类列表
-(void)goToMerchantList:(NSString *)position
{
    [Application setCategoryId:position];
    [MainViewController setFootBarHidden:YES];
    MerchantListViewController *listController=[[MerchantListViewController alloc]init];
    [self.navigationController pushViewController:listController animated:YES];
    [listController release];
}
#pragma mark --进入搜索
-(void)toSearchAction:(UIButton *)button
{
    
    NSLog(@"fdsf");
    [MainViewController setFootBarHidden:YES];
    SearchViewController *searchController=[[SearchViewController alloc]init];
    [self.navigationController pushViewController:searchController animated:YES];
    [searchController release];
    
}
-(void)dealloc
{
    RELEASE_SAFELY(_homeBanner);
    RELEASE_SAFELY(_myWebView);
    RELEASE_SAFELY(cityName);
    [super dealloc];
}
@end
