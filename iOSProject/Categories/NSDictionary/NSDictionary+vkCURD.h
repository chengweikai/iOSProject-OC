//
//  NSDictionary+vkCURD.h
//  iOSProject
//
//  Created by Vic on 2020/11/7.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (vkCURD)
//*****************
 - (void)vk_eachKeyAndValue:(void(^)(id k, id v)) block;
 - (void)vk_eachKey:(void (^)(id k)) block;
 - (void)vk_eachValue:(void(^) ( id v)) block;
 - (NSArray *)vk_map:(id(^)(id k,id v)) block;
 - (NSDictionary *)vk_pick:(NSArray *)keys;
 - (NSDictionary *)vk_omit:(NSArray *)key;

 + (NSDictionary *)vk_dictionarysMergedWithOne:(NSDictionary *)dicOne andAnother:(NSDictionary *)dicTwo;
 - (NSDictionary *)vk_mergedWith:(NSDictionary *)dic;

#pragma mark - Manipulation
- (NSDictionary *)vk_dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)vk_dictionaryByRemovingEntriesWithKeys:(NSSet *)keys;
@end

NS_ASSUME_NONNULL_END
