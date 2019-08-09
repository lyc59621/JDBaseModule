//
//  JDFontMacros.h
//  JDMovie
//
//  Created by JDragon on 2018/8/22.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#ifndef JDFontMacros_h
#define JDFontMacros_h



//中文字体
//#define KJD_FONT_RegularName  @"PingFangSC-Regular"
//#define KJD_FONT_MediumName   @"PingFangSC-Medium"

//#define KJD_FONT_Regular(x) [UIFont fontWithName:KJD_FONT_RegularName size:x]
//#define KJD_FONT_Medium(x)  [UIFont fontWithName:KJD_FONT_MediumName size:x]

#define KJD_FONT_RegularName  @"system-Regular"
#define KJD_FONT_MediumName   @"PingFangSC-Medium"
#define KJD_FONT_BoldName     @"PingFangSC-Semibold"


#define KJD_FONT_Regular(x)  [UIFont systemFontOfSize:x]
#define KJD_FONT_Medium(x)   [UIFont fontWithName:KJD_FONT_MediumName size:x]
#define KJD_FONT_Bold(x)     [UIFont fontWithName:KJD_FONT_BoldName size:x]

// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]



#endif /* JDFontMacros_h */
