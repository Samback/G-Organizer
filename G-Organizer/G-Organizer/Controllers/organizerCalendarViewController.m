//
//  organizerCalendarViewController.m
//  G-Organizer
//
//  Created by Max on 14.08.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import "organizerCalendarViewController.h"

@interface organizerCalendarViewController ()

@end

@implementation organizerCalendarViewController


- (void) viewDidLoad{
	[super viewDidLoad];
	[self.monthView selectDate:[NSDate month]];
    
}
- (void) viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
    
    
    //NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"dd.MM.yy"];
    //NSDate *d = [dateFormatter dateFromString:@"02.05.11"];
    //[dateFormatter release];
    //[self.monthView selectDate:d];
    
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
