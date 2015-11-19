//
//  TestUser.h
//  RXUserManagerExample
//
//  Created by Rush.D.Xzj on 15/11/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestUser : NSObject


@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *name;


- (id)initWithDictionary:(NSDictionary *)dic;
- (NSDictionary *)dictionaryValue;
- (void)clear;


@end
