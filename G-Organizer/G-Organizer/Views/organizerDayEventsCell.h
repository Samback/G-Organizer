//
//  organizerDayEventsCell.h
//  G-Organizer
//
//  Created by Max on 03.09.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import <UIKit/UIKit.h>

@class organizerDayEvents;

@protocol  organizerDayEventsCellDelegate<NSObject>
- (void)switcherChange:(UISwitch *)switcher;
@end

@interface organizerDayEventsCell : UITableViewCell
@property (nonatomic, weak) id<organizerDayEventsCellDelegate> delegate;
@property (strong, nonatomic) IBOutlet UISwitch *eventState;
@property (strong, nonatomic) organizerDayEvents *eventData;

@end
