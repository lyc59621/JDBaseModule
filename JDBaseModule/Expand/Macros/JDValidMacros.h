//
//  JDValidMacros.h
//  JDBaseModule
//
//  Created by JDragon on 2018/9/17.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#ifndef JDValidMacros_h
#define JDValidMacros_h




//数据验证
#define StrValid(f) (f!=nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])
#define SafeStr(f) (StrValid(f) ? f:@"")
#define HasString(str,key) ([str rangeOfString:key].location!=NSNotFound)

#define KValidStr(f) StrValid(f)
#define KValidDict(f) (f!=nil && [f isKindOfClass:[NSDictionary class]])
#define KValidArray(f) (f!=nil && [f isKindOfClass:[NSArray class]] && [f count]>0)
#define KValidNum(f) (f!=nil && [f isKindOfClass:[NSNumber class]])
#define KValidClass(f,cls) (f!=nil && [f isKindOfClass:[cls class]])
#define KValidData(f) (f!=nil && [f isKindOfClass:[NSData class]])



// 是否空对象
#define IS_NULL_CLASS(OBJECT) [OBJECT isKindOfClass:[NSNull class]]

//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))



#endif /* JDValidMacros_h */
