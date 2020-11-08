//
//  NSString+vkXMLDictionary.h
//  iOSProject
//
//  Created by Vic on 2020/11/9.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (vkXMLDictionary)
/**
 *  @brief  xml字符串转换成NSDictionary
 *
 *  @return NSDictionary
 */
- (NSDictionary *)vk_XMLDictionary;
@end

NS_ASSUME_NONNULL_END
