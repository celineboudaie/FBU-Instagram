//
//  PostTableViewCell.h
//  FBU-Instagram
//
//  Created by Celine Boudaie on 6/30/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
NS_ASSUME_NONNULL_BEGIN

@interface PostTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *postImage;
@property (strong, nonatomic) IBOutlet UILabel *postCaption;
@property(nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
