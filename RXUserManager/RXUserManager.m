//
//  RXUserManager.m
//  YYTS
//
//  Created by Rush.D.Xzj on 15/8/13.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXUserManager.h"

#define RXUserManagerUser       @"com.rxUserManagerUser"
@interface RXUserManager ()


@end

@implementation RXUserManager



- (void)logout
{
    [self clearUserInfo];
    [self saveUserInfoToDisk];
    [[NSNotificationCenter defaultCenter] postNotificationName:NKey_RX_UserLogout object:nil];
}


- (void)saveUserInfoToDisk
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = nil;
    SEL toDic = NSSelectorFromString(self.stringToDicSel);
    if ([self.user respondsToSelector:toDic]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        dic = (NSDictionary *)[self.user performSelector:toDic withObject:nil];
#pragma clang diagnostic pop
    }
    [ud setValue:dic forKey:RXUserManagerUser];
    [ud synchronize];
    
}



- (void)loadUserInfoFromDisk
{
    Class cls = NSClassFromString(self.stringUserCls);
    if (cls == nil) {
        return;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [ud objectForKey:RXUserManagerUser];
    if (dic != nil) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        SEL sel = NSSelectorFromString(self.stringInitializeSel);
        
        id value = [cls alloc];
        value = (id)[value performSelector:sel withObject:dic withObject:nil];
        self.user = value;
#pragma clang diagnostic pop
    }
    
}
- (void)clearUserInfo
{
    SEL clear = NSSelectorFromString(self.stringClearSel);
    if ([self.user respondsToSelector:clear]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.user performSelector:clear withObject:nil];
#pragma clang diagnostic pop
    }
}


#pragma mark - Constructor And Destructor
- (id)init
{
    if (self = [super init]) {
    }
    return self;
}
- (void)dealloc
{
    
}

#pragma mark - Singleton Model

+ (RXUserManager *)sharedInstance
{
    static RXUserManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
