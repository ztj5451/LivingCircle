//
//  SearchViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/11.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "SearchViewController.h"
#import "ScreenUtils.h"
#import "Colors.h"
#import "Images.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

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
    [self initBanner];
    [self initContent];
}

#pragma mark --search titlebar
-(void)initTitleBar
{
    UIView *titleBarView=[[UIView alloc]initWithFrame:CGRectMake(ZERO, ZERO+STATUS_BAR_HEIGHT, SCREEN_WIDTH, TITLE_BAR_HEIGHT)];
    [self.view addSubview:titleBarView];
    [titleBarView release];
    [titleBarView setBackgroundColor:[UIColor colorWithRed:248/255.0 green:98/255.0 blue:63/255.0 alpha:1]];
    
}
#pragma mark --init banner
-(void)initBanner
{

}
#pragma mark --init content
-(void)initContent
{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
