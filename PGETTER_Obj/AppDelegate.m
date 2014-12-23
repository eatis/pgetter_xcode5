//
//  AppDelegate.m
//  PGETTER_Obj
//
//  Created by EATis on 2013/08/18.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // 機種の取得
    NSString *modelname = [ [ UIDevice currentDevice] model];
    
    // iPadかどうか判断する
    if ( ![modelname hasPrefix:@"iPad"] ) {
        
        // Windowスクリーンのサイズを取得
        CGRect r = [[UIScreen mainScreen] bounds];
        // 縦の長さが480の場合、古いiPhoneだと判定
        if(r.size.height == 480){
            // NSLog(@"Old iPhone");
            //self.mainScreenHeight = r.size.height;
            self.pagerViewHeight = 355;
        }else{
            // NSLog(@"New iPhone");
            //self.mainScreenHeight = r.size.height;
            self.pagerViewHeight = 443;
        }
    }else{
        // NSLog(@"iPad");
        //storyBoardName =@"MainStoryboard_iPad";
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
