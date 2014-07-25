//
//  NSDictionary+MutableDeepCopy.m
//  Sections
//
//  Created by Dexter Launchlabs on 7/25/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "NSDictionary+MutableDeepCopy.h"

@implementation NSDictionary (MutableDeepCopy)
- (NSMutableDictionary *)mutableDeepCopy {
    NSMutableDictionary *returnDict = [[NSMutableDictionary alloc]
                                       initWithCapacity:[self count]]; NSArray *keys = [self allKeys];
    for (id key in keys) {
        id oneValue = [self valueForKey:key]; id oneCopy = nil;
        if ([oneValue respondsToSelector:@selector(mutableDeepCopy)]) oneCopy = [oneValue mutableDeepCopy];
        else if ([oneValue respondsToSelector:@selector(mutableCopy)]) oneCopy = [oneValue mutableCopy];
        if (oneCopy == nil)
            oneCopy = [oneValue copy];
        [returnDict setValue:oneCopy forKey:key]; }
    return returnDict;
}
@end
