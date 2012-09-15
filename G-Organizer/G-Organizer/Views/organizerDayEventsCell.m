//
//  organizerDayEventsCell.m
//  G-Organizer
//
//  Created by Max on 03.09.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import "organizerDayEventsCell.h"
#import "organizerDayEvents.h"

@interface organizerDayEventsCell()

@property (strong, nonatomic) IBOutlet UISwitch *eventState;
@property (strong, nonatomic) IBOutlet UILabel *eventName;

@end

@implementation organizerDayEventsCell

@synthesize eventState;
@synthesize eventName;
@synthesize eventData = _eventData;

- (IBAction)stateChanged:(UISwitch *)sender
{
    self.eventData.eventState = sender.on;
}

- (void)setEventData:(organizerDayEvents *)eventData
{
    _eventData = eventData;
    self.eventName.text = eventData.eventTitle;
    self.eventState.on = eventData.eventState;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
