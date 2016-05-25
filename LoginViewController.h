//
//  LoginViewController.h
//  LivingCircle
//
//  Created by 张铁君 on 16/4/7.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    @private
    UITextField *_userName;
    UITextField *_passWord;
    UIButton *_loginBtn;
    NSString *_userNameStr;
    NSString *_passwordStr;
}
@end
