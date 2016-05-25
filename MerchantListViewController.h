//
//  MerchantListViewController.h
//  LivingCircle
//
//  Created by 张铁君 on 16/4/10.
//  Copyright (c) 2016年 沈阳云融. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MerchantListViewController : UIViewController<UITextFieldDelegate>
{
    @private
    UITextField *searchKeyEdit;
    NSString *searchKey;
}
@end
