//
//  ViewController.m
//  iOSProject
//
//  Created by Vic on 2020/11/7.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import "ViewController.h"
#import "NSString+vkPinyin.h"
#import "NSString+vkUUID.h"
#import "NSString+vkXMLDictionary.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *str = @"张三丰";
    NSLog(@"%@",[str vk_pinyin]);
    NSLog(@"%@",[str vk_pinyinArray]);
    NSLog(@"%@",[str vk_pinyinWithoutBlank]);
    NSLog(@"%@",[str vk_pinyinInitialsArray]);
    NSLog(@"%@",[str vk_pinyinInitialsString]);
    NSLog(@"%@",[NSString vk_randomUUID]);
    NSLog(@"%@",[NSString vk_UUIDTimeStamp]);
   
    NSString *xml = @"<?xml version=\"1.0\" encoding=\"gb2312\"?>"
    "<Result xmlns=\"http://www.fiorano.com/fesb/activity/DBQueryOnInput2/Out\">"
    "<row resultcount=\"1\">"
    "<users_id>1001 </users_id>"
    "<users_name>wangwei </users_name>"
    "<users_group>80 </users_group>"
    "<users_address>1001号 </users_address>"
    "</row>"
    "<row resultcount=\"1\">"
    "<users_id>1002 </users_id>"
    "<users_name>wangwei </users_name>"
    "<users_group>80 </users_group>"
    "<users_address>1002号 </users_address>"
    "</row>"
    "</Result>";
    
    NSLog(@"%@",[xml vk_XMLDictionary]);
    
    
}


@end
