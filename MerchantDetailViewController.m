//
//  MerchantDetailViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/12.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "MerchantDetailViewController.h"
#import "MerchantViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "ScreenUtils.h"
#import "ScreenUtils.h"
#import "Images.h"
#import "Application.h"
@interface MerchantDetailViewController ()
@property (nonatomic,strong) UIWebView *merchantWebView;
@property (nonatomic,strong) UIView *footBarView;
@end

@implementation MerchantDetailViewController

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
    [self initFootBar];
}
//-(void)viewWillAppear:(BOOL)animated
//{
//    _footBarView.hidden=NO;
//}
//-(void)viewDidDisappear:(BOOL)animated
//{
//    _footBarView.hidden=YES;
//}
#pragma mark --初始化titlebar
-(void)initTitleBar
{
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:back_btn] forState:UIControlStateNormal] ;
    [backButton addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame=CGRectMake(10, 27, 40, 40);
    [self.view addSubview:backButton];
}
-(void)initFootBar
{
   
    //背景
    
    _footBarView=[[UIView alloc]initWithFrame:CGRectMake(ZERO, SCREEN_HEIGHT-FOOTBAR_HEIGHT-1, SCREEN_WIDTH, FOOTBAR_HEIGHT)];
    
    //上方的横线
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH, 1)];
    [lineView setBackgroundColor:[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1]];
    [_footBarView addSubview:lineView];
    [lineView release];
    float buttonWidth=SCREEN_WIDTH/5;
    //客服按钮
    UIButton *kefuButton=[UIButton buttonWithType:UIButtonTypeCustom];
    kefuButton.frame=CGRectMake(buttonWidth/4, 4, 30, 30);
    [kefuButton setBackgroundImage:[UIImage imageNamed:mer_kefu] forState:UIControlStateNormal];
    [_footBarView addSubview:kefuButton];
    [kefuButton addTarget:self action:@selector(kefuAction:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *kefuLable=[[UILabel alloc]initWithFrame:CGRectMake(ZERO, 34, buttonWidth, 16)];
    [kefuLable setText:@"客服"];
    [kefuLable setTextAlignment:NSTextAlignmentCenter];
    [_footBarView addSubview:kefuLable];
    [kefuLable setFont:[UIFont systemFontOfSize:12]];
    [kefuLable release];
   
    //商户按钮
    UIButton *merchantButton=[UIButton buttonWithType:UIButtonTypeCustom];
    merchantButton.frame=CGRectMake(buttonWidth/4+buttonWidth, 4, 30, 30);
    [merchantButton setBackgroundImage:[UIImage imageNamed:merchant] forState:UIControlStateNormal];
    [_footBarView addSubview:merchantButton];
    [merchantButton addTarget:self action:@selector(merchantAction:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *merchantLable=[[UILabel alloc]initWithFrame:CGRectMake(buttonWidth, 34, buttonWidth, 16)];
    [merchantLable setText:@"商户"];
    [merchantLable setTextAlignment:NSTextAlignmentCenter];
    [_footBarView addSubview:merchantLable];
    [merchantLable setFont:[UIFont systemFontOfSize:12]];
    [merchantLable release];
    //收藏按钮
    UIButton *shoucangButton=[UIButton buttonWithType:UIButtonTypeCustom];
    shoucangButton.frame=CGRectMake(buttonWidth/4+buttonWidth*2, 4, 30, 30);
    [shoucangButton setBackgroundImage:[UIImage imageNamed:mer_shoucang] forState:UIControlStateNormal];
    [_footBarView addSubview:shoucangButton];
    [shoucangButton addTarget:self action:@selector(shoucangAction:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *shoucangLable=[[UILabel alloc]initWithFrame:CGRectMake(buttonWidth*2, 34, buttonWidth, 16)];
    [shoucangLable setText:@"收藏"];
    [shoucangLable setTextAlignment:NSTextAlignmentCenter];
    [_footBarView addSubview:shoucangLable];
    [shoucangLable setFont:[UIFont systemFontOfSize:12]];
    [shoucangLable release];

    UIView *toPayView=[[UIView alloc]initWithFrame:CGRectMake(buttonWidth*3, ZERO, SCREEN_WIDTH-buttonWidth*3,FOOTBAR_HEIGHT)];
    [toPayView setBackgroundColor:[UIColor colorWithRed:1.0 green:80.0/255 blue:1.0/255 alpha:1]];
    [_footBarView addSubview:toPayView];
    [toPayView release];
    
    UITapGestureRecognizer *toPayAction = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toPayAction:)];
    [toPayView addGestureRecognizer:toPayAction];
    [toPayAction release];
    //去支付按钮
    UIButton *toPayButton=[UIButton buttonWithType:UIButtonTypeCustom];
    toPayButton.frame=CGRectMake(buttonWidth/4+buttonWidth*3, 4, 40, 40);
    UILabel *toPayLable=[[UILabel alloc]initWithFrame:CGRectMake(buttonWidth*4-buttonWidth/4, ZERO, buttonWidth, FOOTBAR_HEIGHT)];
    [toPayLable setText:@"去支付"];
    [toPayLable setTextColor:[UIColor whiteColor]];
    [_footBarView addSubview:toPayLable];
    
    [toPayLable setTextAlignment:NSTextAlignmentCenter];
    [toPayLable release];
    
    [toPayButton setBackgroundImage:[UIImage imageNamed:topay_img] forState:UIControlStateNormal];
    [_footBarView addSubview:toPayButton];
    [self.view addSubview:_footBarView];
    UIView *line_one=[[UIView alloc]initWithFrame:CGRectMake(buttonWidth, ZERO, 1, FOOTBAR_HEIGHT)];
    [line_one setBackgroundColor:[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1]];
    [_footBarView addSubview:line_one];
    [line_one release];
    UIView *line_two=[[UIView alloc]initWithFrame:CGRectMake(buttonWidth*2, ZERO, 1, FOOTBAR_HEIGHT)];
    [line_two setBackgroundColor:[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1]];
    [_footBarView addSubview:line_two];
    [line_two release];
    UIView *line_three=[[UIView alloc]initWithFrame:CGRectMake(buttonWidth*3, ZERO, 1, FOOTBAR_HEIGHT)];
    [line_three setBackgroundColor:[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1]];
    [_footBarView addSubview:line_three];
    [line_three release];

    [_footBarView release];
}
#pragma mark --初始化页面
-(void)initContent
{
    _merchantWebView=[[UIWebView alloc]initWithFrame:CGRectMake(ZERO, ZERO,SCREEN_WIDTH,SCREEN_HEIGHT-FOOTBAR_HEIGHT)];
    [self.view addSubview:_merchantWebView];
    JSContext *context = [_merchantWebView  valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"merchantContent"] = ^() {
        return [Application getMerchantContent];
    };
    NSString *bannerPath = [[NSBundle mainBundle] pathForResource:@"merchant_detail" ofType:@"html"];
    NSURL *bannerUrl = [[NSURL alloc] initFileURLWithPath:bannerPath];
    [_merchantWebView loadRequest:[NSURLRequest requestWithURL:bannerUrl]];

}
#pragma mark --返回按钮
-(void)backBtnAction:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --客服按钮
-(void)kefuAction:(UIButton *)button
{
    
}
#pragma mark --商户按钮
-(void)merchantAction:(UIButton *)button
{
    MerchantViewController *merchantController=[[MerchantViewController alloc]init];
    [self.navigationController pushViewController:merchantController animated:YES];
    [merchantController release];
}
#pragma mark --收藏按钮
-(void)shoucangAction:(UIButton *)button
{

}
#pragma mark --去支付
-(void)toPayAction:(UIButton *)button
{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --释放资源
-(void)dealloc
{
    RELEASE_SAFELY(_merchantWebView);
    RELEASE_SAFELY(_footBarView);
    [super dealloc];
}

@end
