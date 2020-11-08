//
//  NSDictionary+vkCURD.m
//  iOSProject
//
//  Created by Vic on 2020/11/7.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import "NSDictionary+vkCURD.h"

@implementation NSDictionary (vkCURD)

#pragma mark eachElement
-(void)vk_eachKeyAndValue:(void (^)(id _Nonnull, id _Nonnull))block
{
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        block(key,obj);
    }];
    
}

-(void)vk_eachKey:(void (^)(id _Nonnull))block
{
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        block(key);
    }];
}

-(void)vk_eachValue:(void (^)(id _Nonnull))block
{
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        block(obj);
    }];
}

-(NSArray *)vk_map:(id  _Nonnull (^)(id _Nonnull, id _Nonnull))block
{
    NSMutableArray *array = [NSMutableArray array];
       
       [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
           id object = block(key, obj);
           if (object) {
               [array addObject:object];
           }
       }];
       
       return array;
}

- (NSDictionary *)vk_pick:(NSArray *)keys
{
    NSMutableDictionary *picked = [[NSMutableDictionary alloc]initWithCapacity:keys.count];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([keys containsObject:key]) {
            picked[key] = obj;
        }
        
    }];
    return picked;
    
}

//从字典中找出数组keys不存在的key，并形成一个字典
- (NSDictionary *)vk_omit:(NSArray *)keys
{
    NSMutableDictionary *omitted = [[NSMutableDictionary alloc] initWithCapacity:([self allKeys].count - keys.count)];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![keys containsObject:key]) {
            omitted[key] = obj;
        }
    }];
    
    return omitted;
}

#pragma mark - merge
//tips:两字典有相同的key，但value不一样，取后一个
+ (NSDictionary *)vk_dictionarysMergedWithOne:(NSDictionary *)dicOne andAnother:(NSDictionary *)dicTwo
{
    NSMutableDictionary * result = [NSMutableDictionary dictionaryWithDictionary:dicOne];
    NSMutableDictionary * resultTemp = [NSMutableDictionary dictionaryWithDictionary:dicTwo];
    [resultTemp addEntriesFromDictionary:dicTwo];
    [resultTemp enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
        if ([dicOne objectForKey:key]) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dicOne objectForKey: key] vk_mergedWith:(NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            } else {
                [result setObject: obj forKey: key];
            }
        }
        else if([dicTwo objectForKey:key])
        {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dicTwo objectForKey: key] vk_mergedWith: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            } else {
                [result setObject: obj forKey: key];
            }
        }
    }];
    return (NSDictionary *) [result mutableCopy];
    
}

- (NSDictionary *)vk_mergedWith:(NSDictionary *)dic
{
    return [[self class] vk_dictionarysMergedWithOne:self andAnother:dic];
    
}
#pragma mark - Manipulation
- (NSDictionary *)vk_dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary {
    NSMutableDictionary *result = [self mutableCopy];
    [result addEntriesFromDictionary:dictionary];
    return result;
}

- (NSDictionary *)vk_dictionaryByRemovingEntriesWithKeys:(NSSet *)keys {
    NSMutableDictionary *result = [self mutableCopy];
    [result removeObjectsForKeys:keys.allObjects];
    return result;
}
@end
