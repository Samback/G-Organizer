//
//  User.h
//  G-Organizer
//
//  Created by Max on 22.08.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * login;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSString * fullName;
@property (nonatomic, retain) NSDecimalNumber * age;

@end
