//
//  ScreenUtils.h
//  UtilsDemo
//
//  Created by 张铁君 on 15/12/22.
//  Copyright (c) 2015年 沈阳云融. All rights reserved.
//

#ifndef UtilsDemo_ScreenUtils_h
#define UtilsDemo_ScreenUtils_h
//安全释放对象
#define RELEASE_SAFELY(__POINTER) { if(__POINTER){[__POINTER release]; __POINTER = nil; }}
//获取屏幕的宽度

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
//获取屏幕的高度
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define STATUS_BAR_HEIGHT 22
#define TITLE_BAR_HEIGHT 50
#define TITLE_FONT_HEIGHT 195
#define TITLE_FONT_WIDTH 180
#define HOME_BANNER_HEIGHT 150
#define INPUT_WIDTH 220
#define INPUT_HEIGHT 40
#define ZERO 0
#define FOOTBAR_HEIGHT 50
#define MAIN_ITEM_SIZE 30
#define ITEM_HEIGHT 5
#define ITEM_WIDTH SCREEN_WIDTH/3
#define MARGIN_LEFT (ITEM_WIDTH*1-MAIN_ITEM_SIZE)/2
#define ITEM_LABLE_HEIGHT 20
#define ITEM_LABLE_MARGIN 30
#endif
