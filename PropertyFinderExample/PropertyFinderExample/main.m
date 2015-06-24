//
//  main.m
//  PropertyFinderExample
//
//  Created by jiakai lian on 24/06/2015.
//  Copyright (c) 2015 jiakai.lian. All rights reserved.
//

#import "Item.h"
#import "PropertyFinder.h"
#import <Foundation/Foundation.h>



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray * items = [NSMutableArray array];
        
        [items addObject:[Item itemWithItemId:@"1" itemName:@"item1"]];
        [items addObject:[Item itemWithItemId:@"2" itemName:@"item2"]];
        [items addObject:[Item itemWithItemId:@"3" itemName:@"item3"]];
        [items addObject:[Item itemWithItemId:@"4" itemName:@"item4"]];
        
        NSLog(@"%@\n\n\n",items);
        
        //find or filer items  by the property annotated by SearchIndex
        NSString * searchIndex = [PropertyFinder findFisrtProperty:Item.class confirmToProtocol:@protocol(SearchIndex)];
        
        NSPredicate *predicate   = [NSPredicate predicateWithFormat:@"%K = %@",
                                    searchIndex, @"2"];
        
        NSLog(@"%@\n\n\n",[items filteredArrayUsingPredicate:predicate]);
        
        
        //sort the array by the property annotated by SortIndex
        NSString * sortIndex = [PropertyFinder findFisrtProperty:Item.class confirmToProtocol:@protocol(SortIndex)];
        
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:sortIndex
                                                                     ascending:NO];

        NSLog(@"%@\n\n\n",[items sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]]);
    }
    return 0;
}
