//
//  TestUser.m
//  RXUserManagerExample
//
//  Created by Rush.D.Xzj on 15/11/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "TestUser.h"

@implementation TestUser

- (id)init
{
    if (self = [super init]) {
        [self clear];
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary *)dic
{
    if (self = [self init]) {
        self.userId = dic[@"userId"];
        self.name = dic[@"name"];
    }
    return self;
}
- (NSDictionary *)dictionaryValue
{
    NSDictionary *dic = @{@"userId":self.userId,
                          @"name":self.name};
    return dic;
}
- (void)clear
{
    self.userId = @"";
    self.name = @"";
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"userId:%@, name:%@", self.userId, self.name];
}

@end
