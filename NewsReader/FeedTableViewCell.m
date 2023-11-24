//
//  FeedTableViewCell.m
//  NewsReader
//
//  Created by Onkar Mohan Karoshi on 23/11/23.
//

#import "FeedTableViewCell.h"

@implementation FeedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.newsImageView.image = nil;
    self.newsTitleLabel.text = @"";
    self.newsDescriptionLabel.text = @"";
    self.dateLabel.text = @"";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
