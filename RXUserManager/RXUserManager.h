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
@property (nonatomic, strong, nonnull) id user;

// 用户信息的类名
@property (nonatomic, copy, nonnull) NSString * stringUserCls;
// 把dic转换为User的初始化SEL名称
@property (nonatomic, copy, nonnull) NSString *stringInitializeSel;
// 把用户信息转换为Dic的SEL名称
@property (nonatomic, copy, nonnull) NSString *stringToDicSel;
// 把用户信息清空的的SEL名称
@property (nonatomic, copy, nonnull) NSString *stringClearSel;



// 保存用户信息到磁盘
- (void)saveUserInfoToDisk;
// 从磁盘信息加载用户信息
- (void)loadUserInfoFromDisk;


// 登录成功,会发送一个NKey_RX_UserLogin通知
- (void)login;
- (void)loginWithObject:(nullable id)object;

// 退出登录,会发送NKey_RX_UserLogout的消息通知
- (void)logout;
- (void)logoutWithObject:(nullable id)object;


#pragma mark - Signal Mode
// 不会初始化用户信息,需要手动调用loadUserInfoFromDisk
// 因为需要配置相关的参数
+ (RXUserManager *_Nonnull)sharedInstance;
@end
