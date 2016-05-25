//
//  MyViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/6.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "MyViewController.h"
#import "Images.h"
#import "ScreenUtils.h"
#import "ImageUtils.h"
#import "WalletViewController.h"
#import "MainViewController.h"
@interface MyViewController ()
@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"我的";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initTitleBar];
    [self initMiddleBar];
    [self initContent];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
    [super viewWillAppear:animated];
    
    
    
}
#pragma mark --init titlebar
-(void)initTitleBar
{
    //添加大背景
    UIImageView *titleBar=[[UIImageView alloc]initWithFrame:CGRectMake(ZERO, STATUS_BAR_HEIGHT, SCREEN_WIDTH, 180)];
    [titleBar setImage:[UIImage imageNamed:my_title_bg]];
    [self.view addSubview:titleBar];
    [titleBar release];
    //扫描二维码
    UIButton *qrCodeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    qrCodeButton.frame=CGRectMake(12, 15, 22, 22);
    [qrCodeButton setImage:[UIImage imageNamed:qr_code] forState:UIControlStateNormal];
    [titleBar addSubview:qrCodeButton];
    [qrCodeButton release];
    //push 消息
    UIButton *pushButton=[UIButton buttonWithType:UIButtonTypeCustom];
    pushButton.frame=CGRectMake(SCREEN_WIDTH-34, 15, 22, 22);
    [pushButton setImage:[UIImage imageNamed:my_message] forState:UIControlStateNormal];
    [titleBar addSubview:pushButton];
    [pushButton release];
    //姓名
    UILabel *nameLable=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, 15, 100, 30)];
    [nameLable setText:@"张铁君"];
    [nameLable setTextColor:[UIColor whiteColor]];
    [nameLable setTextAlignment:NSTextAlignmentCenter];
    [titleBar addSubview:nameLable];
    [nameLable release];
    //头像
    UIImageView *headImageViewBg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:head_bg]];
    headImageViewBg.frame=CGRectMake((SCREEN_WIDTH-90)/2, 45, 90, 90);
    [titleBar addSubview:headImageViewBg];
    //头像
    UIImageView *headImageView=[[UIImageView alloc]initWithImage:[ImageUtils circleImageWithName: head borderWidth:0 borderColor:[UIColor whiteColor]]];
    headImageView.frame=CGRectMake(5, 5, 80, 80);
    [headImageViewBg addSubview:headImageView];
    [headImageView release];
    //签到
    UIImageView *signViewBg=[[UIImageView alloc]initWithFrame:CGRectMake(210, 74, 71, 30)];
    [signViewBg setImage:[UIImage imageNamed:sign_bg]];
    [titleBar addSubview:signViewBg];
    [signViewBg release];
    UIImageView *signIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:sign]];
    signIcon.frame=CGRectMake(3, 3, 24, 24);
    [signViewBg addSubview:signIcon];
    [signIcon release];
    UILabel *signLable=[[UILabel alloc]initWithFrame:CGRectMake(30, ZERO, 30, 30)];
    [signLable setText:@"签到"];
    [signLable setTextAlignment:NSTextAlignmentCenter];
    [signLable setTextColor:[UIColor whiteColor]];
    [signLable setFont:[UIFont systemFontOfSize:12]];
    [signViewBg addSubview:signLable];
    [signLable release];
    //等级
    UIImageView *levelBg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:level]];
    levelBg.frame=CGRectMake((SCREEN_WIDTH-50)/2, 120, 50, 23) ;
    [titleBar addSubview:levelBg];
    [levelBg release];
    UIImageView *leveView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:putong]];
    leveView.frame=CGRectMake(4, 2, 19, 19);
    [levelBg addSubview:leveView];
    [leveView release];
    UILabel *levelLable=[[UILabel alloc]initWithFrame:CGRectMake(22, ZERO, 23, 19)];
    [levelLable setText:@"普通"];
    [levelLable setTextColor:[UIColor whiteColor]];
    [levelLable setFont:[UIFont systemFontOfSize:10]];
    [levelBg addSubview:levelLable];
    [levelLable release];
    
}
#pragma mark --init middleBar
-(void)initMiddleBar
{
    int buttonWidth=SCREEN_WIDTH/4;
    int middleBarHeight=60;
    UIView *middleBar=[[UIView alloc]initWithFrame:CGRectMake(ZERO, 180, SCREEN_WIDTH, middleBarHeight)];
    [middleBar setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:middleBar];
    [middleBar release];
    //订单
    UIView *orderView=[[UIView alloc]initWithFrame:CGRectMake(ZERO, ZERO, buttonWidth, middleBarHeight)];
    UIImageView *orderButton=[[UIImageView alloc]initWithImage:[UIImage imageNamed:dingdan]];
    orderButton.frame=CGRectMake((buttonWidth-30)/2, 10, 30, 30) ;
    [orderView addSubview:orderButton];
    [middleBar addSubview:orderView];
    [orderView release];
    [orderButton release];
    UILabel *orderLable=[[UILabel alloc]initWithFrame:CGRectMake(ZERO, 40, buttonWidth, 20)];
    [orderLable setText:@"全部订单"];
    [orderLable setTextAlignment:NSTextAlignmentCenter];
    [orderLable setFont:[UIFont systemFontOfSize:12]];
    [orderView addSubview:orderLable];
    [orderLable release];
    //我的收藏
    UIView *shoucangView=[[UIView alloc]initWithFrame:CGRectMake(buttonWidth, ZERO, buttonWidth, middleBarHeight)];
   UIImageView *shoucangButton=[[UIImageView alloc]initWithImage:[UIImage imageNamed:shoucang]];
    shoucangButton.frame=CGRectMake((buttonWidth-30)/2, 10, 30, 30) ;
    [shoucangView addSubview:shoucangButton];
    
    [middleBar addSubview:shoucangView];
    [shoucangView release];
    UILabel *shoucangLable=[[UILabel alloc]initWithFrame:CGRectMake(ZERO, 40, buttonWidth, 20)];
    [shoucangLable setText:@"我的收藏"];
    [shoucangLable setTextAlignment:NSTextAlignmentCenter];
    [shoucangLable setFont:[UIFont systemFontOfSize:12]];
    [shoucangView addSubview:shoucangLable];
    [shoucangLable release];
    //预定预付
    UIView *yudingView=[[UIView alloc]initWithFrame:CGRectMake(buttonWidth*2, ZERO, buttonWidth, middleBarHeight)];
   UIImageView *yudingButton=[[UIImageView alloc]initWithImage:[UIImage imageNamed:yuding]];
    yudingButton.frame=CGRectMake((buttonWidth-30)/2, 10, 30, 30) ;
    [yudingView addSubview:yudingButton];
    [middleBar addSubview:yudingView];
    [yudingView release];
    UILabel *yudingLable=[[UILabel alloc]initWithFrame:CGRectMake(ZERO, 40, buttonWidth, 20)];
    [yudingLable setText:@"预定/预付"];
    [yudingLable setTextAlignment:NSTextAlignmentCenter];
    [yudingLable setFont:[UIFont systemFontOfSize:12]];
    [yudingView addSubview:yudingLable];
    [yudingLable release];
    //待评论
    UIView *pinglunView=[[UIView alloc]initWithFrame:CGRectMake(buttonWidth*3, ZERO, buttonWidth, middleBarHeight)];
     UIImageView *pinglunButton=[[UIImageView alloc]initWithImage:[UIImage imageNamed:pingjia]];    pinglunButton.frame=CGRectMake((buttonWidth-30)/2, 10, 30, 30) ;
    [pinglunView addSubview:pinglunButton];
    [middleBar addSubview:pinglunView];
    [pinglunView release];
    UILabel *pinglunLable=[[UILabel alloc]initWithFrame:CGRectMake(ZERO, 40, buttonWidth, 20)];
    [pinglunLable setText:@"待评论"];
    [pinglunLable setTextAlignment:NSTextAlignmentCenter];
    [pinglunLable setFont:[UIFont systemFontOfSize:12]];
    [pinglunView addSubview:pinglunLable];
    [pinglunLable release];
    
    UIImageView *lineOne=[[UIImageView alloc]initWithImage:[UIImage imageNamed:min_vertical_line]];
    lineOne.frame=CGRectMake(buttonWidth, 12, 1, 36) ;
    [middleBar addSubview:lineOne];
    UIImageView *lineTwo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:min_vertical_line]];
    lineTwo.frame=CGRectMake(buttonWidth*2, 12, 1, 36) ;
    [middleBar addSubview:lineTwo];
    UIImageView *lineThree=[[UIImageView alloc]initWithImage:[UIImage imageNamed:min_vertical_line]];
    lineThree.frame=CGRectMake(buttonWidth*3, 12, 1, 36) ;
    [middleBar addSubview:lineThree];
    [lineOne release];
    [lineTwo release];
    [lineThree release];
    
    
    //订单添加监听
    UITapGestureRecognizer *orderAction = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(orderAction:)];
    [orderView addGestureRecognizer:orderAction];
    [orderAction release];
    //收藏
    UITapGestureRecognizer *shoucangAction = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shoucangAction:)];
    [shoucangView addGestureRecognizer:shoucangAction];
    [shoucangAction release];
    //预定预付
    UITapGestureRecognizer *yudingAction = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(yudingAction:)];
    [yudingView addGestureRecognizer:yudingAction];
    [yudingAction release];
    //待评论
    UITapGestureRecognizer *pinglunAction = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pinglunAction:)];
    [pinglunView addGestureRecognizer:pinglunAction];
    [pinglunAction release];
    
}
#pragma mark -- initContent
-(void)initContent
{
   
    UIView *contentView=[[UIView alloc]initWithFrame:CGRectMake(ZERO, 240, SCREEN_WIDTH, SCREEN_HEIGHT-240)];
    [contentView setBackgroundColor:[UIColor colorWithRed:239.0/255 green:239.0/255 blue:239.0/255 alpha:1]];
    [self.view addSubview:contentView];
    [contentView release];
    int viewWidth=(SCREEN_WIDTH-7)/2;
    UIView *walletView=[[UIView alloc]initWithFrame:CGRectMake(3, 12, viewWidth, 101)];
    [walletView setBackgroundColor:[UIColor whiteColor]];
    [contentView addSubview:walletView];
    [walletView release];
   
    
    UIImageView *walletImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:qianbao]];
    walletImageView.frame=CGRectMake(10, 10, 30, 30) ;
    [walletView addSubview:walletImageView];
    [walletImageView release];
    
    UILabel *walletLable=[[UILabel alloc]initWithFrame:CGRectMake(40, ZERO, viewWidth-50, 25)];
    [walletLable setTextColor:[UIColor blackColor]];
    [walletLable setTextAlignment:NSTextAlignmentLeft];
    [walletLable setText:@"我的钱包"];
    [walletLable setFont:[UIFont systemFontOfSize:14]];
    [walletImageView addSubview:walletLable];
    [walletLable release];
    
    UIView *temp=[[UIView alloc]initWithFrame:CGRectMake(25, 44, viewWidth-28, 50)];
    [temp setBackgroundColor:[UIColor colorWithRed:239.0/255 green:239.0/255 blue:239.0/255 alpha:1]];
    [walletView addSubview:temp];
    [temp release];
    UILabel *xianjin=[[UILabel alloc]initWithFrame:CGRectMake(2, ZERO, viewWidth-28, 25)];
    [xianjin setTextColor:[UIColor colorWithRed:248/255.0 green:98/255.0 blue:63/255.0 alpha:1]];
    [xianjin setText:[NSString stringWithFormat:@"现金:￥%@",@"111"]];
    [xianjin setFont:[UIFont systemFontOfSize:12]];
    [temp addSubview:xianjin];
    [xianjin release];
    UILabel *fanxian=[[UILabel alloc]initWithFrame:CGRectMake(2, 25, viewWidth-28, 25)];
    [fanxian setTextColor:[UIColor colorWithRed:248/255.0 green:98/255.0 blue:63/255.0 alpha:1]];
    [fanxian setText:[NSString stringWithFormat:@"返现:￥%@",@"0.00"]];
    [fanxian setFont:[UIFont systemFontOfSize:12]];
    [temp addSubview:fanxian];
    [fanxian release];
    
    
    UIView *quanView=[[UIView alloc]initWithFrame:CGRectMake(4+viewWidth, 12, viewWidth, 50)];
    [quanView setBackgroundColor:[UIColor whiteColor]];
    [contentView addSubview:quanView];
    [quanView release];
    
    
    UIImageView *quanImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:quan]];
    quanImageView.frame=CGRectMake(10, 10, 30, 30) ;
    [quanView addSubview:quanImageView];
    [quanImageView release];
    UILabel *quanLable=[[UILabel alloc]initWithFrame:CGRectMake(50, ZERO, viewWidth-50, 25)];
    [quanLable setTextColor:[UIColor blackColor]];
    [quanLable setFont:[UIFont systemFontOfSize:12]];
    [quanLable setTextAlignment:NSTextAlignmentCenter];
    [quanLable setText:@"优惠券"];
    [quanView addSubview:quanLable];
    [quanLable release];
    UILabel *myQuanLable=[[UILabel alloc]initWithFrame:CGRectMake(40, 25, viewWidth-50, 25)];
    [myQuanLable setTextAlignment:NSTextAlignmentCenter];
    [myQuanLable setText:@"0张可用"];
    [myQuanLable setFont:[UIFont systemFontOfSize:12]];
    [myQuanLable setTextColor:[UIColor colorWithRed:248/255.0 green:98/255.0 blue:63/255.0 alpha:1]];
    [quanView addSubview:myQuanLable];
    [myQuanLable release];
    
    UIView *jifenView=[[UIView alloc]initWithFrame:CGRectMake(4+viewWidth, 63, viewWidth, 50)];
    [jifenView setBackgroundColor:[UIColor whiteColor]];
    [contentView addSubview:jifenView];
    [jifenView release];
    UIImageView *jifenImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:jifen]];
    jifenImageView.frame=CGRectMake(10, 10, 30, 30) ;
    [jifenView addSubview:jifenImageView];
    [jifenImageView release];
    UILabel *jifenLable=[[UILabel alloc]initWithFrame:CGRectMake(40, ZERO, viewWidth-50, 25)];
    [jifenLable setTextColor:[UIColor blackColor]];
    [jifenLable setFont:[UIFont systemFontOfSize:12]];
    [jifenLable setTextAlignment:NSTextAlignmentCenter];
    [jifenLable setText:@"积分"];
    [jifenView addSubview:jifenLable];
    [jifenLable release];
    UILabel *myJifenLable=[[UILabel alloc]initWithFrame:CGRectMake(40, 25, viewWidth-50, 25)];
    [myJifenLable setTextAlignment:NSTextAlignmentCenter];
    [myJifenLable setText:@"32"];
    [myJifenLable setFont:[UIFont systemFontOfSize:12]];
    [myJifenLable setTextColor:[UIColor colorWithRed:248/255.0 green:98/255.0 blue:63/255.0 alpha:1]];
    [jifenView addSubview:myJifenLable];
    [myJifenLable release];
    
    //添加点击事件
     UITapGestureRecognizer *walletAction = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(walletAction:)];
    [walletView addGestureRecognizer:walletAction];
    [walletAction release];
    
    UITapGestureRecognizer *quanAction = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(quanAction:)];
    [quanView addGestureRecognizer:quanAction];
    [quanAction release];
    
    UITapGestureRecognizer *jifenAction = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jifenAction:)];
    [jifenView addGestureRecognizer:jifenAction];
    [jifenAction release];
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --按钮添加监听事件
-(void)walletAction:(UIButton *)button
{
    [MainViewController setFootBarHidden:YES];
    [WalletViewController setTitle:@"我的钱包"];
    WalletViewController *walletController=[[WalletViewController alloc]init];
    [self.navigationController pushViewController:walletController animated:YES];
    [walletController release];
}
-(void)quanAction:(UIButton *)button
{
    
}
-(void)jifenAction:(UIButton *)button
{
    
}
-(void)orderAction:(UIButton *)button
{
    NSLog(@"order");
}
-(void)shoucangAction:(UIButton *)button
{
    NSLog(@"shoucang");
}
-(void)yudingAction:(UIButton *)button
{
    NSLog(@"yuding");
}
-(void)pinglunAction:(UIButton *)button
{
    NSLog(@"pinglun");
}
#pragma mark --资源释放
-(void)dealloc
{
   
    [super dealloc];
}
@end
