//
//  NSString+vkPinyin.m
//  iOSProject
//
//  Created by Vic on 2020/11/9.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import "NSString+vkPinyin.h"

@implementation NSString (vkPinyin)

- (NSString *)vk_pinyinWithPhoneticSymbol
{
    NSMutableString *pinyin = [NSMutableString stringWithString:self];
    CFStringTransform((__bridge CFMutableStringRef)(pinyin), NULL, kCFStringTransformMandarinLatin, NO);
    
    return pinyin;;
    
}
-(NSString *)vk_pinyin
{
    NSMutableString *pinyin = [NSMutableString stringWithString:[self vk_pinyinWithPhoneticSymbol] ];
    CFStringTransform((__bridge CFMutableStringRef)(pinyin), NULL, kCFStringTransformStripCombiningMarks, NO);
    return pinyin;
}
- (NSArray *)vk_pinyinArray
{
    NSArray *array = [[self vk_pinyin] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
       return array;
}
- (NSString*)vk_pinyinWithoutBlank{
    NSMutableString *string = [NSMutableString stringWithString:@""];
    for (NSString *str in [self vk_pinyinArray]) {
        [string appendString:str];
    }
    return string;
}
//首字母数组
- (NSArray *)vk_pinyinInitialsArray
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *str in [self vk_pinyinArray]) {
        if ([str length] > 0) {
            [array addObject:[str substringToIndex:1]];
        }
    }
    return array;
}
- (NSString*)vk_pinyinInitialsString{
    NSMutableString *pinyin = [NSMutableString stringWithString:@""];
    for (NSString *str in [self vk_pinyinArray]) {
        if ([str length] > 0) {
            [pinyin appendString:[str substringToIndex:1]];
        }
    }
    return pinyin;
}
@end
