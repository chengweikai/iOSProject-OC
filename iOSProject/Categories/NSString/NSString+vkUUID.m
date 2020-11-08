//
//  NSString+vkUUID.m
//  iOSProject
//
//  Created by Vic on 2020/11/9.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import "NSString+vkUUID.h"
#import <UIKit/UIKit.h>
@implementation NSString (vkUUID)
+ (NSString *)vk_randomUUID
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 6.0) {
        
        return [[NSUUID UUID] UUIDString];
    }else
    {
        CFUUIDRef uuidref = CFUUIDCreate(NULL);
        CFStringRef uuid = CFUUIDCreateString(NULL, uuidref);
        CFRelease(uuidref);
        return (__bridge_transfer NSString *)uuid;
    }
    
}

+ (NSString *)vk_UUIDTimeStamp
{
    return [[NSNumber numberWithLongLong:[[NSDate date] timeIntervalSince1970]*1000 ]stringValue];
}
@end
