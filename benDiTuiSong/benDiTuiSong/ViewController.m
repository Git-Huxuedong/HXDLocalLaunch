//
//  ViewController.m
//  benDiTuiSong
//
//  Created by huxuedong on 15/11/17.
//  Copyright © 2015年 huxuedong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建通知分类
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
    category.identifier = @"category";
    //创建通知动作
    UIMutableUserNotificationAction *readAction = [[UIMutableUserNotificationAction alloc] init];
    readAction.identifier = @"read";
    readAction.title = @"接收";
    //不开启对应App
    readAction.activationMode = UIUserNotificationActivationModeBackground;
    //按钮显示蓝色
    readAction.destructive = NO;
    //打开解锁的验证请求
    readAction.authenticationRequired = NO;
    UIMutableUserNotificationAction *rejectAction = [[UIMutableUserNotificationAction alloc] init];
    rejectAction.identifier = @"reject";
    rejectAction.title = @"拒绝";
    rejectAction.activationMode = UIUserNotificationActivationModeBackground;
    //按钮显示红色
    rejectAction.destructive = YES;
    rejectAction.authenticationRequired = NO;
    [category setActions:@[readAction, rejectAction] forContext:UIUserNotificationActionContextDefault];
    //创建集合
    NSSet *set = [NSSet setWithObjects:category, nil];
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:set];
    //弹出对话框，预告通知样式
    [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    UILocalNotification *local = [[UILocalNotification alloc] init];
    local.fireDate = [NSDate dateWithTimeIntervalSinceNow:7];
    local.alertBody = @"帅哥，约嘛~";
    local.applicationIconBadgeNumber = 3;
    local.soundName = UILocalNotificationDefaultSoundName;
    local.hasAction = YES;
    local.alertAction = @"聊天";
    local.category = @"category";
    local.userInfo = @{@"name":@"帅哥", @"info":@"约嘛", @"qq":@"123456789"};
    //定制并展示
    [[UIApplication sharedApplication] scheduleLocalNotification:local];
}

@end
