//
//  NSString+Empty.m
//  G-Organizer
//
//  Created by Max on 18.08.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import "NSString+Empty.h"

@implementation NSString (Empty)
- (BOOL)isStringEmpty
{
    return ([self isEqualToString:@""] || self == nil) ? YES : NO;
}
@end
