//
//  NewsDetailViewController.h
//  NewsReader
//
//  Created by Onkar Mohan Karoshi on 24/11/23.
//

#import <UIKit/UIKit.h>
#import <UIImageView+AFNetworking.h>
#import "News.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *newsDescriptionLabel;
@property (strong, nonatomic) News *news;
@end

NS_ASSUME_NONNULL_END
