//
//  WalletViewController.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/14.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "WalletViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "ScreenUtils.h"
@interface WalletViewController ()
@property (nonatomic,strong) UIWebView *walletUIView;
@end

@implementation WalletViewController

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
    [self intContent];
}
-(void)intContent
{
    _walletUIView=[[UIWebView alloc]initWithFrame:CGRectMake(ZERO, TITLE_BAR_HEIGHT+STATUS_BAR_HEIGHT,SCREEN_WIDTH,SCREEN_HEIGHT-TITLE_BAR_HEIGHT)];
    
    [self.view addSubview:_walletUIView];
    JSContext *context = [_walletUIView  valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"homeBanner"] = ^() {
        
      
    };
    NSString *bannerPath = [[NSBundle mainBundle] pathForResource:@"wallet" ofType:@"html"];
    NSURL *bannerUrl = [[NSURL alloc] initFileURLWithPath:bannerPath];
    [_walletUIView loadRequest:[NSURLRequest requestWithURL:bannerUrl]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
