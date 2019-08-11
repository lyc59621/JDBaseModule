//
//  JDColorMacros.h
//  JDBaseModule
//
//  Created by JDragon on 2018/9/17.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#ifndef JDColorMacros_h
#define JDColorMacros_h



//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0f green:((float)((hex & 0xFF00) >> 8)) / 255.0f blue:((float)(hex & 0xFF)) / 255.0f alpha:1]


// 随机颜色，用于测试
#define Random_Color RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define COLOR_RGB(rgbValue,a) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0f green:((float)(((rgbValue) & 0xFF00)>>8))/255.0f blue: ((float)((rgbValue) & 0xFF))/255.0f alpha:(a)]

//颜色
#define KClearColor [UIColor clearColor]
#define KWhiteColor [UIColor whiteColor]
#define KBlackColor [UIColor blackColor]
#define KGrayColor [UIColor grayColor]
#define KGray2Color [UIColor lightGrayColor]
#define KBlueColor [UIColor blueColor]
#define KRedColor [UIColor redColor]
#define kRandomColor    KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)        //随机色生成

////系统色
#define KNavBarColor HEXCOLOR(0xE24B1D)
#define KBaseViewBgColor HEXCOLOR(0xF9F9F9)
#define KNavBgFontColor  [UIColor colorWithHexString:@"ffffff"]
#define KBaseTintColor  HEXCOLOR(0xFFFFFF)




//字体色彩
#define COLOR_WORD_BLACK HEXCOLOR(0x333333)
#define COLOR_WORD_GRAY_1 HEXCOLOR(0x666666)
#define COLOR_WORD_GRAY_2 HEXCOLOR(0x999999)

#define COLOR_UNDER_LINE [UIColor colorWithRed:198/255.0 green:198/255.0 blue:198/255.0 alpha:1]

// 各个模块的颜色值
#define kInitate_Light_Background    RGB(34, 43, 57)     // 约看浅色背景颜色
#define kInitate_Dark_Background     RGB(20, 29, 40)     // 约看深色背景颜色
#define kInitate_Title_Font_Color    RGB(187, 235, 255)  // 约看标题字体颜色
#define kInitate_Subtitle_font_Color RGB(60, 79, 99)     // 约看子标题字体颜色
#endif /* JDColorMacros_h */
