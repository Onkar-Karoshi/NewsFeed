//
//  NewsProvider.h
//  NewsReader
//
//  Created by Onkar Mohan Karoshi on 24/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsProvider : NSObject

+ (void)loadNewsWithCompletion:(void (^)(NSArray *, NSError *))completion;
@end

NS_ASSUME_NONNULL_END
