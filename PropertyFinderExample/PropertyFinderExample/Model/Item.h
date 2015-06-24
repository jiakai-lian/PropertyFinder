//
//  Item.h
//  PropertyFinderExample
//
//  Created by jiakai lian on 24/06/2015.
//  Copyright (c) 2015 jiakai.lian. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SearchIndex

@end

@protocol SortIndex

@end

@interface Item : NSObject

@property (nonatomic, copy) NSString<SearchIndex> * itemId;
@property (nonatomic, copy) NSString<SortIndex> * itemName;

- (instancetype)initWithItemId:(NSString *)itemId itemName:(NSString *)itemName;

- (NSString *)description;

+ (instancetype)itemWithItemId:(NSString *)itemId itemName:(NSString *)itemName;

@end
