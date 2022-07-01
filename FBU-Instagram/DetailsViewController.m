//
//  DetailsViewController.m
//  FBU-Instagram
//
//  Created by Celine Boudaie on 6/30/22.
//

#import "DetailsViewController.h"
#import "PostTableViewCell.h"

@interface DetailsViewController ()
@property (strong, nonatomic) IBOutlet UILabel *postCaption;
@property (strong, nonatomic) IBOutlet UIImageView *postImage;
@property (strong, nonatomic) IBOutlet UILabel *createdAtLabel;


@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postCaption.text = self.post.caption;
    PFFileObject *imageObject = self.post.image;
    [imageObject getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        if (error == nil) {
            self.postImage.image = [UIImage imageWithData:data];
        }
    }];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MMM d y";
    self.createdAtLabel.text = [formatter stringFromDate:self.post.createdAt];
}



@end
