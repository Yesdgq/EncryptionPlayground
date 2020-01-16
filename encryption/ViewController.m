//
//  ViewController.m
//  encryption
//
//  Created by yesdgq on 2020/1/16.
//  Copyright © 2020 yesdgq. All rights reserved.
//

#import "ViewController.h"
#import "DesEncrypt.h"
#import "AESCrypt.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //DES加密
    const char *encrypText = [DesEncrypt sharedDesEncrypt]->encryptText([@"12345678" UTF8String]);
    NSString *encrypStr = [[NSString alloc]initWithCString:encrypText encoding:NSUTF8StringEncoding];
    NSLog(@"DES加密后字符串：%@", encrypStr);
    
    const char *decrypText = [DesEncrypt sharedDesEncrypt]->decryptText([encrypStr UTF8String]);
    NSString *decrypStr = [[NSString alloc]initWithCString:decrypText encoding:NSUTF8StringEncoding];
    NSLog(@"DES解密后字符串：%@", decrypStr);
    
    //AES加密
    NSString *aesEncrypt = [AESCrypt encrypt:@"1234Abcd" password:@"qwertyuiopasdfghjk"];
    NSLog(@"AES加密后字符串：%@", aesEncrypt);
    
    NSString *rawStr = [AESCrypt decrypt:aesEncrypt password:@"qwertyuiopasdfghjk"];
    NSLog(@"AES解密后字符串：%@", rawStr);
    
}


@end
