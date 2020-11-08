//
//  NSString+vkUUID.h
//  iOSProject
//
//  Created by Vic on 2020/11/9.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (vkUUID)
+ (NSString *)vk_randomUUID;
+ (NSString *)vk_UUIDTimeStamp;
@end

NS_ASSUME_NONNULL_END
