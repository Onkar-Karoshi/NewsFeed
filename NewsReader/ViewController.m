//
//  ViewController.m
//  NewsReader
//
//  Created by Onkar Mohan Karoshi on 23/11/23.
//

#import "ViewController.h"
#import "FeedTableViewCell.h"
#import "News.h"
#import "NewsProvider.h"
#import "NewsDetailViewController.h"
#import <Foundation/Foundation.h>
#import <UIImageView+AFNetworking.h>


@interface ViewController ()

@property (nonatomic, strong) NSArray *newsItems;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"News Feed";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self fetchNews];
}

- (void)fetchNews {
    [NewsProvider loadNewsWithCompletion:^(NSArray * _Nonnull list, NSError * _Nonnull error) {
        if(list != nil) {
            self.newsItems = list;
            [self.tableView reloadData];
        } else {
            UIAlertController *alert = [[UIAlertController alloc] init];
            alert.title = @"Error";
            alert.title = @"Failed to load News Feed";
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert dismissViewControllerAnimated:true completion:nil];
            }];
            [alert addAction:action];
            [self presentViewController:alert animated:true completion:nil];
        }
    }];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    FeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
   
    News *newsItem = self.newsItems[indexPath.row];
    if (newsItem.urlToImage != nil) {
        [cell.newsImageView setImageWithURL:newsItem.urlToImage placeholderImage:[UIImage imageNamed:@"placeholder"]];
    } else {
        cell.newsImageView.image = [UIImage imageNamed:@"placeholder"];
    }
    cell.newsTitleLabel.text = newsItem.titleText;
    cell.newsDescriptionLabel.text = newsItem.descriptionText;
    cell.dateLabel.text = newsItem.publishedString;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showDetails" sender:@(indexPath.row)];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    int index = [sender intValue];
    NewsDetailViewController *viewController = [segue destinationViewController];
    viewController.news = self.newsItems[index];
}

@end
