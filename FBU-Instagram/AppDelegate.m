//
//  AppDelegate.m
//  FBU-Instagram
//
//  Created by Celine Boudaie on 6/27/22.
//

#import "AppDelegate.h"
#import "Parse/Parse.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(  NSDictionary *)launchOptions {

    ParseClientConfiguration *config = [ParseClientConfiguration  configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {

        configuration.applicationId = @"awKqWF0inzwdxYbnofD8zMSkbS2O0wqgR8xZtxoE";
        configuration.clientKey = @"GxUrPtjtVkP1Ina7g0qIPBXxPUkwqZFNecEaRxzi";
        configuration.server = @"https://parseapi.back4app.com";
    }];

    [Parse initializeWithConfiguration:config];
    


    return YES;
}



#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}





@end
