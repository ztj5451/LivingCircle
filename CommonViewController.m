//
//  CommonViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/11.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "CommonViewController.h"
#import "ScreenUtils.h"
#import "Images.h"
#import "Colors.h"
#import "MainViewController.h"
@interface CommonViewController ()

@end
static  NSString *customerTitle=nil ;
@implementation CommonViewController
+(void)setTitle:(NSString *)title
{
    customerTitle=title;
    [customerTitle retain];
}
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
    
}
-(void)initTitleBar
{
    UIView *titleBar=[[UIView alloc]initWithFrame:CGRectMake(ZERO, STATUS_BAR_HEIGHT, SCREEN_WIDTH, 50)];
    
    [titleBar setBackgroundColor:[UIColor blackColor]];
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:back_btn] forState:UIControlStateNormal];
    backBtn.frame=CGRectMake(5, 5, 40, 40);
    [titleBar addSubview:backBtn];
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH, 50)];
    [title setText:customerTitle];
    title.textAlignment=UITextAlignmentCenter;
    [title setTextColor:[UIColor whiteColor]];
    [titleBar addSubview:title];
    [self.view addSubview:titleBar];
    [titleBar release];
    [title release];
    [backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark --返回按钮
-(void)backAction:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
    [MainViewController setFootBarHidden:NO];
}
-(void)dealloc
{
    RELEASE_SAFELY(customerTitle);
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
