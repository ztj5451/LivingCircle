//
//  SelectCityViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/11.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "SelectCityViewController.h"
#import "ScreenUtils.h"
#import "Images.h"
#import "Colors.h"
#import "ServerConnect.h"
#import "Application.h"
#import "MainViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface SelectCityViewController ()
@property (nonatomic,strong) UIWebView *selectCityView;
@property(nonatomic,strong) ServerConnect *serverConnect;
@property(nonatomic,strong) NSNotificationCenter *cityInfo;
@end

@implementation SelectCityViewController

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
    _cityInfo = [NSNotificationCenter defaultCenter];
    [self initContent];
    
}
#pragma mark --初始化当前页面
-(void)initContent
{
    _selectCityView=[[UIWebView alloc]initWithFrame:CGRectMake(ZERO, 72, SCREEN_WIDTH, SCREEN_HEIGHT-72)];
    [self.view addSubview:_selectCityView];
    
    [_serverConnect getCityAction];
    
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [_cityInfo addObserver:self selector:@selector(cityInfo:) name:@"cityInfo" object:nil];
    
    
    
}
#pragma mark --接收通知
-(void)cityInfo:(id)sender
{
    
    JSContext *context = [_selectCityView  valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    //获取城市数据
    context[@"cityInfo"] = ^() {
        return [sender valueForKey:@"object"];
    };
    //得到选择城市
    context[@"selectCity"] = ^(NSString *city) {
        [self citySelect:city];
    };
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"html"];
    NSURL *localUrl = [[NSURL alloc] initFileURLWithPath:htmlPath];
    
    [_selectCityView loadRequest:[NSURLRequest requestWithURL:localUrl]];
    [localUrl release];
}
#pragma mark --选择城市 关闭当前页面
-(void)citySelect:(NSString *)city
{
    [Application setSelectCity:city];
    [MainViewController setFootBarHidden:NO];
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --资源释放
-(void)dealloc
{
    RELEASE_SAFELY(_selectCityView)
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
