//
//  AppDelegate.m
//  AwsomeTemplateiOS
//
//  Created by Monster on 13/02/2017.
//  Copyright © 2017 MonsterTech Studio. All rights reserved.
//

#define GlobalThemeColor [UIColor flatWatermelonColorDark]
// Custom Child View Controllers
#import "MSHomeViewController.h"
#import "MSDiscoverViewController.h"
#import "MSMessageViewController.h"
#import "MSMineViewController.h"

#import "AppDelegate.h"
#import "FCAlertView.h"
#import "Chameleon.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self setupChildVCs];
    [self.window setRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
    [Chameleon setGlobalThemeUsingPrimaryColor: GlobalThemeColor withContentStyle:UIContentStyleContrast];
    
    return YES;
}

- (void)setupChildVCs {
    MSHomeViewController *homeVC = [[MSHomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    MSDiscoverViewController *discoverVC = [[MSDiscoverViewController alloc] init];
    UINavigationController *discoverNav = [[UINavigationController alloc] initWithRootViewController:discoverVC];
    
    MSMessageViewController *messageVC = [[MSMessageViewController alloc] init];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:messageVC];
    
    MSMineViewController *mineVC = [[MSMineViewController alloc] init];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    
    RDVTabBarController *msTabBarController = [[RDVTabBarController alloc] init];
    [msTabBarController setViewControllers:@[homeNav,discoverNav,messageNav,mineNav]];
    self.viewController = msTabBarController;
    [self customizeTabBarForController:msTabBarController];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"home",
                                  @"discover",
                                  @"message",
                                  @"mine"];
    // if tabbar has titles ,the icons of tabbar item should be resized;
    NSArray *tabBarItemTitles =  @[@"home",
                                   @"discover",
                                   @"message",
                                   @"mine"];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]] imageWithRenderingMode:UIImageRenderingModeAutomatic];
        UIImage *unselectedimage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]] imageWithRenderingMode:UIImageRenderingModeAutomatic];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        [item setTitle:tabBarItemTitles[index]];
        index++;
    }
    // tabbar background color
//    tabBarController.tabBar.backgroundView.backgroundColor = GlobalThemeColor;

}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
