//
//  Item.m
//  PropertyFinderExample
//
//  Created by jiakai lian on 24/06/2015.
//  Copyright (c) 2015 jiakai.lian. All rights reserved.
//

#import "Item.h"

@implementation Item

- (instancetype)initWithItemId:(NSString *)itemId itemName:(NSString *)itemName
{
    self = [super init];
    if (self)
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
        _itemId = itemId;
        _itemName = itemName;
#pragma clang diagnostic pop
    }

    return self;
}

+ (instancetype)itemWithItemId:(NSString *)itemId itemName:(NSString *)itemName
{
    return [[self alloc] initWithItemId:itemId itemName:itemName];
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.itemId=%@", self.itemId];
    [description appendFormat:@", self.itemName=%@", self.itemName];
    [description appendString:@">"];
    return description;
}


@end
