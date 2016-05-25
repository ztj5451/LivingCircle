//
//  ForgetPasswordViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/11.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "ScreenUtils.h"
#import "Images.h"
#import "Colors.h"
@interface ForgetPasswordViewController ()
@property (nonatomic,strong) UIWebView *forgetPassView;
@end

@implementation ForgetPasswordViewController

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
-(void)initTitleBar
{
    UIView *titleBar=[[UIView alloc]initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH, 72)];
    
    [titleBar setBackgroundColor:[UIColor blackColor]];
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:back_btn] forState:UIControlStateNormal];
    backBtn.frame=CGRectMake(5, 27, 40, 40);
    [titleBar addSubview:backBtn];
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(ZERO, 22, SCREEN_WIDTH, 50)];
    [title setText:@"找回密码"];
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
    _forgetPassView=[[UIWebView alloc]initWithFrame:CGRectMake(ZERO, 72, SCREEN_WIDTH, SCREEN_HEIGHT-72)];
    [self.view addSubview:_forgetPassView];
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"get_password" ofType:@"html"];
    NSURL *localUrl = [[NSURL alloc] initFileURLWithPath:htmlPath];
    
    [_forgetPassView loadRequest:[NSURLRequest requestWithURL:localUrl]];
    [localUrl release];
    
    
}
#pragma mark --返回按钮
-(void)backAction:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --资源释放
-(void)dealloc
{
    RELEASE_SAFELY(_forgetPassView)
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
