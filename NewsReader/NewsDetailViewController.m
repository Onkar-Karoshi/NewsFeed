//
//  NewsDetailViewController.m
//  NewsReader
//
//  Created by Onkar Mohan Karoshi on 24/11/23.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.news.urlToImage != nil) {
        [self.imageView setImageWithURL:self.news.urlToImage placeholderImage:[UIImage imageNamed:@"placeholder"]];
    } else {
        self.imageView.image = [UIImage imageNamed:@"placeholder"];
    }
    self.title = self.news.titleText;
    self.newsDescriptionLabel.text = self.news.content;
}

- (IBAction)readTapped:(id)sender {
    [[UIApplication sharedApplication] openURL:self.news.url options:@{} completionHandler:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
