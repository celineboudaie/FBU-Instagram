//
//  FeedViewController.m
//  FBU-Instagram
//
//  Created by Celine Boudaie on 6/28/22.
//

#import "FeedViewController.h"
#import "AppDelegate.h"
#import "SceneDelegate.h"
#import "LoginViewController.h"
#import "PostTableViewCell.h"
#import "Post.h"
#import "Parse/Parse.h"
#import "DetailsViewController.h"


@interface FeedViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *arrayOfPosts;
@property (strong, nonatomic) IBOutlet UITableView *feedTableView;
@property(nonatomic) UIRefreshControl *refreshControl;


@end

@implementation FeedViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.feedTableView.dataSource = self;
    self.feedTableView.delegate = self;
    [self refreshPosts];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshPosts) forControlEvents:UIControlEventValueChanged];
    [self.feedTableView insertSubview:_refreshControl atIndex:0];
}

-(void) refreshPosts{
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"createdAt"];
    query.limit = 20;

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.arrayOfPosts = posts;
            [self.feedTableView reloadData];
            [self.refreshControl endRefreshing];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (IBAction)didTapLogout:(id)sender {
    SceneDelegate *mySceneDelegate = (SceneDelegate * )
    UIApplication.sharedApplication.connectedScenes.allObjects.firstObject.delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    mySceneDelegate.window.rootViewController = loginViewController;
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error){}];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        NSIndexPath *senderIndex = [self.feedTableView indexPathForCell:sender];
        Post *post = self.arrayOfPosts[senderIndex.row];
        DetailsViewController *detailVC = [segue destinationViewController];
        detailVC.post = post;

}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"postTableViewCell" forIndexPath:indexPath];
    cell.post = self.arrayOfPosts[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfPosts.count;
}


@end
