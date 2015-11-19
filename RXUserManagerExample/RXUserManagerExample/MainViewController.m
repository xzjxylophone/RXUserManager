//
//  MainViewController.m
//  RXUserManagerExample
//
//  Created by Rush.D.Xzj on 15/11/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MainViewController.h"
#import "RXUserManager.h"
#import "TestUser.h"
@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblShow;

@end

@implementation MainViewController
- (IBAction)btnSaveTouchUpInside:(id)sender {
    
    NSInteger rand = arc4random() % 100000;
    NSString *userId = [NSString stringWithFormat:@"%zd", rand];
    NSArray *ary = @[@"小明", @"小花", @"如花", @"赵日天", @"叶良辰", @"犀利哥", @"凤姐", @"芙蓉姐姐", @"韩梅梅", @"李磊", @"0927", @"中国足球", @"YYZC"];
    NSInteger rand2 = arc4random() % ary.count;
    NSString *name = ary[rand2];
    
    TestUser *tmp = [[TestUser alloc] init];
    tmp.userId = userId;
    tmp.name = name;
    [RXUserManager sharedInstance].user = tmp;
    [[RXUserManager sharedInstance] saveUserInfoToDisk];
    
    self.lblShow.text = @"";
}
- (IBAction)btnShowTouchUpInside:(id)sender {
    
    
    TestUser *user = [RXUserManager sharedInstance].user;
    self.lblShow.text = user.userId.length > 0 ? [NSString stringWithFormat:@"%@", user] : @"";
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    
    [RXUserManager sharedInstance].stringUserCls = @"TestUser";
    [RXUserManager sharedInstance].stringInitializeSel = @"initWithDictionary:";
    [RXUserManager sharedInstance].stringToDicSel = @"dictionaryValue";
    [RXUserManager sharedInstance].stringClearSel = @"clear";
    [[RXUserManager sharedInstance] loadUserInfoFromDisk];
    
    TestUser *user = [RXUserManager sharedInstance].user;
    
    self.lblShow.text = user.userId.length > 0 ? [NSString stringWithFormat:@"%@", user] : @"";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
