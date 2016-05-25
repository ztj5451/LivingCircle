//
//  LoginViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/7.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "LoginViewController.h"
#import "Images.h"
#import "ScreenUtils.h"
#import "NSToast.h"
#import "NSStringUtils.h"
#import "Application.h"
#import "HttpUrl.h"
#import "HttpConnect.h"
#import "MainViewController.h"
#import "RegisterViewController.h"
#import "ForgetPasswordViewController.h"
#import "NSLoadView.h"
@interface LoginViewController ()
@property(nonatomic,retain) UIAlertView *alertView;
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"登陆页面";
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
    [super viewWillAppear:animated];
   
    
}
- (void)viewDidLoad
{
    [self initContent];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
#pragma mark --初始化界面信息
-(void)initContent
{
    //登录页面背景
    UIImageView *loginBg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:login_bg]];
    loginBg.frame=CGRectMake(ZERO, ZERO, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:loginBg];
    [loginBg release];
    //登录页面顶部图片
    
    UIImageView *loginFont=[[UIImageView alloc]initWithImage:[UIImage imageNamed:login_font]];
    loginFont.frame=CGRectMake((SCREEN_WIDTH-TITLE_FONT_WIDTH)/2, ZERO, TITLE_FONT_WIDTH, TITLE_FONT_HEIGHT) ;
    [self.view addSubview:loginFont];
    [loginFont release];
    //输入区域
    UIView *inputView=[[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-INPUT_WIDTH)/2, 200, INPUT_WIDTH, INPUT_HEIGHT*2)];
    [self.view addSubview:inputView];
    [inputView release];
    //账号区域
    UIImageView *accountView=[[UIImageView alloc]initWithFrame:CGRectMake(ZERO, ZERO, INPUT_WIDTH, INPUT_HEIGHT)];
    [accountView setImage:[UIImage imageNamed:login_input]];
    [inputView addSubview:accountView];
    [accountView release];
    //密码区域
    UIImageView *passwordView=[[UIImageView alloc]initWithFrame:CGRectMake(ZERO, 39, INPUT_WIDTH, INPUT_HEIGHT)];
    [passwordView setImage:[UIImage imageNamed:login_input]];
    [inputView addSubview:passwordView];
    [passwordView release];
    //账号图标
    UIImageView *accountIcon=[[UIImageView alloc]initWithFrame:CGRectMake(ZERO, ZERO, INPUT_HEIGHT, INPUT_HEIGHT)];
    [accountIcon setImage:[UIImage imageNamed:account_icon]];
    [inputView addSubview:accountIcon];
    [accountIcon release];
    //密码图标
    UIImageView *passwordIcon=[[UIImageView alloc]initWithFrame:CGRectMake(ZERO, INPUT_HEIGHT, INPUT_HEIGHT, INPUT_HEIGHT)];
    [passwordIcon setImage:[UIImage imageNamed:password_icon]];
    [inputView addSubview:passwordIcon];
    [passwordIcon release];

    _userName=[[UITextField alloc]init];
    _passWord=[[UITextField alloc]init];
    [_userName setText:@"13578918907"];
    [_passWord setText:@"aaaaaa"];
    _userName.placeholder=@"请输入账号";
    _passWord.placeholder=@"请输入密码";
    _userName.frame=CGRectMake(INPUT_HEIGHT, ZERO, 180, INPUT_HEIGHT);
    _passWord.frame=CGRectMake(INPUT_HEIGHT, INPUT_HEIGHT, 180, INPUT_HEIGHT);
    [_passWord setSecureTextEntry:YES];
    [inputView addSubview:_userName];
    [inputView addSubview:_passWord];
    _passWord.delegate=self;
    _userName.delegate=self;
    
    //登录按钮
    _loginBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-INPUT_WIDTH)/2, 300, INPUT_WIDTH, INPUT_HEIGHT)];
    [_loginBtn setBackgroundImage:[UIImage imageNamed:login_btn_normal] forState:UIControlStateNormal];
    [_loginBtn setBackgroundImage:[UIImage imageNamed:login_btn_pressed] forState:UIControlStateSelected];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:_loginBtn];
    [_loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    //注册与忘记密码
    UIView *registerView=[[UIView alloc]initWithFrame:CGRectMake(150, 350, SCREEN_WIDTH-150, 30)];
    //注册
    UIButton *registerButton=[UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    registerButton.frame=CGRectMake(ZERO, ZERO, 40, 30);
    registerButton.titleLabel.font=[UIFont systemFontOfSize:14];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerView addSubview:registerButton];
    
    UIImageView *commonImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:common_icon]];
    commonImageView.frame=CGRectMake(35, 8, 13, 13);
    [registerView addSubview:commonImageView];
    [commonImageView release];
    
    //忘记密码
    UIButton *forgetPasswdButton=[UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    forgetPasswdButton.frame=CGRectMake(50, ZERO, 60, 30);
    forgetPasswdButton.titleLabel.font=[UIFont systemFontOfSize:14];
    [forgetPasswdButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPasswdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerView addSubview:forgetPasswdButton];
    
    UIImageView *commonImageView2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:common_icon]];
    commonImageView2.frame=CGRectMake(110, 8, 13, 13);
    [registerView addSubview:commonImageView2];
    [commonImageView2 release];
    [self.view addSubview:registerView];
    [registerView release];
    //添加按钮点击事件
    [registerButton addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [forgetPasswdButton addTarget:self action:@selector(forgetPasswdAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //底部显示版权信息
    UILabel *copyRight=[[UILabel alloc]initWithFrame:CGRectMake(ZERO, SCREEN_HEIGHT-20, SCREEN_WIDTH, 20)];
    [copyRight setText:@"版权所有@云融互联"];
    [copyRight setTextAlignment:NSTextAlignmentCenter];
    [copyRight setFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:copyRight];
}
-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --输入框代理方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userName resignFirstResponder];
    [_passWord resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark --登录事件
-(void)loginAction:(UIButton *)button
{
    //登录数据校验
    if ([self checkData]) {
        [self initLoadView];
        NSString *url=[NSString stringWithFormat:@"%@%@",SERVER_IP,COMMON_URL];
        NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
        //需要传递的参数
        [params setObject:@"DL" forKey:@"fun_bs"];
        [params setObject:_userNameStr forKey:@"tel"];
        [params setObject:_passwordStr forKey:@"pass"];
        [params setObject:@"111" forKey:@"push_num"];
        [params setObject:@"111" forKey:@"push_tdh"];
        //发送请求
        [HttpConnect requestWithJson:url parmas:params httpMethod:@"POST" completeBlock:^(NSJSONSerialization *result) {
            if ([[result valueForKey:@"bs"] isEqualToString:@"1"]) {
                //保存用户的id
                [Application setUserId:[result valueForKey:@"id"]];
                MainViewController *mainController=[[MainViewController alloc]init];
                [self.navigationController pushViewController:mainController animated:YES];
                [mainController release];
                [NSLoadView loadViewDismiss:_alertView];
            }else
            {
                [NSLoadView loadViewDismiss:_alertView];
            //失败弹出错误提示
            [NSToast showWithText:[result valueForKey:@"msg"]bottomOffset:50 duration:1];
            }
        }];
        [params release];
    }
}
#pragma mark --初始化loadView
-(void)initLoadView
{
    _alertView=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"登录中请稍后..." delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [NSLoadView loadViewWith:_alertView];
    
}
#pragma mark --数据校验
-(BOOL)checkData
{
    //获取数据 并进行校验
    _userNameStr=[NSStringUtils trimWithString:_userName.text];
    _passwordStr=[NSStringUtils trimWithString:_passWord.text];
    if ([_userNameStr length]==0) {
        [NSToast showWithText:@"账号不能为空!" bottomOffset:50 duration:1];
        return NO;
    }else if([_passwordStr length]==0)
    {
        [NSToast showWithText:@"密码不能为空!" bottomOffset:50 duration:1];
        return NO;
    }
    
    return YES;
}
#pragma mark --注册按钮
-(void)registerAction:(UIButton *)button
{
    RegisterViewController *registerController=[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerController animated:YES];
    [registerController release];
}
#pragma mark --找回密码按钮
-(void)forgetPasswdAction:(UIButton *)button
{
    ForgetPasswordViewController *forgetPasswdController=[[ForgetPasswordViewController alloc]init];
    [self.navigationController pushViewController:forgetPasswdController animated:YES];
    [forgetPasswdController release];
}
#pragma mark --资源释放
-(void)dealloc
{
    RELEASE_SAFELY(_loginBtn);
    RELEASE_SAFELY(_userName);
    RELEASE_SAFELY(_passWord);
    RELEASE_SAFELY(_userNameStr);
    RELEASE_SAFELY(_passwordStr);
    RELEASE_SAFELY(_alertView);
    [super dealloc];
}
@end
