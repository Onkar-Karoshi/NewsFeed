//
//  NewsDetails.h
//  NewsReader
//
//  Created by Onkar Mohan Karoshi on 24/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject

@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) NSString *publishedAt;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSURL *urlToImage;
@property (nonatomic, strong) NSURL *url;

- (instancetype)initWithData:(NSDictionary *)data;
- (NSString *)publishedString;
@end

NS_ASSUME_NONNULL_END
