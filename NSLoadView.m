//
//  NSLoadView.m
//  LivingCircle
//
//  Created by 张铁君 on 16/4/19.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import "NSLoadView.h"

@implementation NSLoadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

+(void)loadViewWith:(UIAlertView *)alertView
{
    
    UIActivityIndicatorView *aiView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(125.0, 80.0, 30.0, 30.0)];
    aiView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending) {
        [alertView setValue:aiView forKey:@"accessoryView"];
    }else{
        [alertView addSubview:aiView];
    }
    [alertView show];
    [aiView startAnimating];
    [aiView release];
}
+(void)loadViewDismiss:(UIAlertView *)alertView
{
     [alertView dismissWithClickedButtonIndex:0 animated:YES];
}
@end
