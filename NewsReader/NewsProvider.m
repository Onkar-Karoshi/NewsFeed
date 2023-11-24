//
//  NewsProvider.m
//  NewsReader
//
//  Created by Onkar Mohan Karoshi on 24/11/23.
//

#import "NewsProvider.h"
#import "News.h"
#import <AFNetworking/AFNetworking.h>

@implementation NewsProvider

+ (void)loadNewsWithCompletion:(void (^)(NSArray *, NSError *))completion {
    NSString *apiKey = @"835d6f3cc462451d8f7bea8e720a24ba";
    NSString *urlString = [NSString stringWithFormat:@"https://newsapi.org/v2/top-headlines?country=us&pageSize=100&apiKey=%@", apiKey];
   
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString
      parameters:nil
         headers:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            completion([self parseData:responseObject], nil);
        }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(nil, error);
        }];
}

+ (NSArray *)parseData:(NSDictionary *)data {
    NSMutableArray *newsList = [NSMutableArray new];
    NSArray *list = data[@"articles"];
    for (NSDictionary* obj in list) {
        [newsList addObject:[[News alloc] initWithData:obj]];
    }
    return newsList;
}

@end
