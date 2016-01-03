//
//  RXUserManager.h
//  YYTS
//
//  Created by Rush.D.Xzj on 15/8/13.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//



#import <Foundation/Foundation.h>



#define NKey_RX_UserLogin        @"NKey_RX_UserLogin"
#define NKey_RX_UserLogout       @"NKey_RX_UserLogout"





// JsonModel
@interface RXUserManager : NSObject

// 用户信息
@property (nonatomic, strong) id user;

// 用户信息的类名
@property (nonatomic, copy) NSString *stringUserCls;
// 把dic转换为User的初始化消息名称
// 需要记得最后面带:, 因为这个是需要参数的
@property (nonatomic, copy) NSString *stringInitializeSel;
// 把用户信息转换为Dic的消息名称
@property (nonatomic, copy) NSString *stringToDicSel;
// 把用户信息清空的的消息名称
@property (nonatomic, copy) NSString *stringClearSel;



// 保存用户信息到磁盘
- (void)saveUserInfoToDisk;
// 从磁盘信息加载用户信息
- (void)loadUserInfoFromDisk;
// 退出登录, 会发送UserLogout的消息通知
- (void)logout;
// 登录成功,一般在登录或者注册成功后调用此消息
// 此消息主要是saveUserInfoToDisk和发送一个NKey_RX_UserLogin通知
- (void)login;


#pragma mark - Signal Mode
+ (RXUserManager *)sharedInstance;
@end
