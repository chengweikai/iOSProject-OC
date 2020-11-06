//
//  ViewController.m
//  iOSProject
//
//  Created by Vic on 2020/11/6.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, copy) NSDictionary * dic;
@property (nonatomic, strong) NSMutableDictionary * mDic;
@property (nonatomic, strong) NSDictionary * dic1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeData];
    
    [self curd];
}
-(void)makeData
{
    _dic = @{@"apple":@1,@"bbox":@2,@"computer":@3,@"description":@4};
    _mDic = [[NSMutableDictionary alloc]initWithDictionary:_dic];
    _dic1 = @{@"apple":@11,@"www":@2,@"eee":@3,@"rrr":@4};
    
}

-(void)curd
{
//
//    [_dic vk_eachKeyAndValue:^(id  _Nonnull k, id  _Nonnull v) {
//        NSLog(@"%@--%@",k,v);
//        if ([k isEqual:@"apple"]) {
//            NSLog(@"eureka");
//        }
//    }];
    
//    __weak typeof(self) weakSelf = self;
//
//    [_mDic vk_eachKeyAndValue:^(id  _Nonnull k, id  _Nonnull v) {
//        NSLog(@"%@--%@",k,v);
//        if ([k isEqual:@"apple"]) {
//
//            weakSelf.mDic[k] = @11;
//            NSLog(@"%@",v);
//        }
//
//
//    }];
    
//   NSDictionary * dict =  [NSDictionary vk_dictionarysMergedWithOne:_dic andAnother:_dic1];
//
//    NSLog(@"%@",dict);
    NSSet *set = [[NSSet alloc]initWithObjects:@"apple",@"r", nil];
    NSLog(@"%@",[_dic1 vk_dictionaryByRemovingEntriesWithKeys:set]);

}

@end
