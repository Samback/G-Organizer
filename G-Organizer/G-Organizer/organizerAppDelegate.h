//
//  organizerAppDelegate.h
//  G-Organizer
//
//  Created by Max on 13.08.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;
@interface organizerAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) User * currentUser;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@end
