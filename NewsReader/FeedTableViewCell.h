//
//  FeedTableViewCell.h
//  NewsReader
//
//  Created by Onkar Mohan Karoshi on 23/11/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeedTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;
@property (weak, nonatomic) IBOutlet UILabel *newsTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *newsDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end

NS_ASSUME_NONNULL_END
