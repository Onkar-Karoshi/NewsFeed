//
//  NewsDetails.m
//  NewsReader
//
//  Created by Onkar Mohan Karoshi on 24/11/23.
//

#import "News.h"

@implementation News

- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    if (data[@"urlToImage"] != [NSNull null]) {
        self.urlToImage = [NSURL URLWithString:data[@"urlToImage"]];
    }
    if (data[@"url"] != [NSNull null]) {
        self.url = [NSURL URLWithString:data[@"url"]];
    }
    if (data[@"title"] != [NSNull null]) {
        self.titleText = data[@"title"];
    } else {
        self.titleText = @"NA";
    }
    if (data[@"description"] != [NSNull null]) {
        self.descriptionText = data[@"description"];
    } else {
        self.descriptionText = @"NA";
    }
    if (data[@"content"] != [NSNull null]) {
        self.content = data[@"content"];
    } else {
        self.content = @"NA";
    }
    if (data[@"publishedAt"] != [NSNull null]) {
        self.publishedAt = data[@"publishedAt"];
    } else {
        self.publishedAt = @"NA";
    }
     
    return self;
}

- (NSString *)publishedString {
    NSString *string = self.publishedAt;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:SS'Z'";
    [formatter setTimeZone:timeZone];
    NSDate *date = [formatter dateFromString:string];
    formatter.dateStyle = NSDateFormatterMediumStyle;
    NSString *formatedDate = [formatter stringFromDate:date];
    if (formatedDate != nil) {
        string = formatedDate;
    }
    return [NSString stringWithFormat:@"Published: %@", string];
}

@end
