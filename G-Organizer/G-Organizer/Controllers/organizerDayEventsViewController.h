//
//  organizerDayEventsViewController.h
//  G-Organizer
//
//  Created by Max on 03.09.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class DayData;

@interface organizerDayEventsViewController : UITableViewController
- (void)setDayData:(DayData *)dayData;

@end
