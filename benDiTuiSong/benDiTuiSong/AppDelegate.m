//
//  AppDelegate.m
//  benDiTuiSong
//
//  Created by huxuedong on 15/11/17.
//  Copyright © 2015年 huxuedong. All rights reserved.
//

#import "AppDelegate.h"
#import "HXDChatViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//接收到本地通知调用
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    [self.window.rootViewController.view addSubview:label];
    [self jumpToChatViewWith:notification.userInfo];
    [UIApplication sharedApplication].applicationIconBadgeNumber = 2;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    label.backgroundColor = [UIColor purpleColor];
    label.numberOfLines = 0;
    [self.window.rootViewController.view addSubview:label];
    //点击图标，判断是否接收通知
    if (launchOptions == nil) {
    } else if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
        UILocalNotification *local = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
        label.text = [NSString stringWithFormat:@"%@",local.userInfo];
        [self jumpToChatViewWith:local.userInfo];
    } else {
    }
    return YES;
}

- (void)jumpToChatViewWith:(NSDictionary *)userInfo {
    HXDChatViewController *chatViewController = [[UIStoryboard storyboardWithName:@"HXDChatViewController" bundle:nil] instantiateInitialViewController];
    self.window.rootViewController = chatViewController;
}

//本地通知的动作处理方法
- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler {
    if ([identifier isEqualToString:@"read"]) {
        NSLog(@"已读");
    } else if ([identifier isEqualToString:@"reject"]) {
        NSLog(@"拒绝");
    }
    completionHandler();
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
