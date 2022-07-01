//
//  SceneDelegate.m
//  FBU-Instagram
//
//  Created by Celine Boudaie on 6/27/22.
//

#import "SceneDelegate.h"
#import "Parse/Parse.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate



- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    if (PFUser.currentUser) {
          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
          
          self.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"FeedNavigation"];
      }

}




@end
