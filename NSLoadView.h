//
//  NSLoadView.h
//  LivingCircle
//
//  Created by 张铁君 on 16/4/19.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLoadView : UIAlertView
+(void)loadViewWith:(UIAlertView *)alertView;
+(void)loadViewDismiss:(UIAlertView *)alertView;
@end
