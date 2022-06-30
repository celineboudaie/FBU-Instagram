//
//  PostTableViewCell.m
//  FBU-Instagram
//
//  Created by Celine Boudaie on 6/30/22.
//

#import "PostTableViewCell.h"

@implementation PostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void) setPost:(Post *)post{
    _post=post;
    NSData *data = self.post.image.getData;
    self.postImage.image = [UIImage imageWithData:data];
    self.postCaption.text = self.post.caption;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
