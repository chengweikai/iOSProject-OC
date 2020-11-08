//
//  NSString+vkPinyin.h
//  iOSProject
//
//  Created by Vic on 2020/11/9.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (vkPinyin)

- (NSString *)vk_pinyinWithPhoneticSymbol;
- (NSString *)vk_pinyin;
- (NSArray *)vk_pinyinArray;
- (NSString*)vk_pinyinWithoutBlank;
- (NSArray *)vk_pinyinInitialsArray;
- (NSString*)vk_pinyinInitialsString;

@end

NS_ASSUME_NONNULL_END
