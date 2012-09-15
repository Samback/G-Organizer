//
//  organizerCalendarViewController.m
//  G-Organizer
//
//  Created by Max on 14.08.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import "organizerCalendarViewController.h"
#import "organizerDayEventsViewController.h"
#import "organizerDefinitions.h"
#import "DayData.h"

@interface organizerCalendarViewController ()
@property (nonatomic, strong) DayData *selectedDay;
@end

@implementation organizerCalendarViewController
@synthesize selectedDay = _selectedDay;

- (void)viewDidLoad{
	[super viewDidLoad];
	//[self.monthView selectDate:[NSDate date]];
    
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
}

- (void)calendarMonthView:(TKCalendarMonthView*)monthView didSelectDate:(NSDate*)date
{
    NSLog(@"Select %@", date);
    self.selectedDay = [DayData dayDataWithDate:date andUser:DELEGATE.currentUser];
    [self performSegueWithIdentifier:@"Day Events" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{   
    organizerDayEventsViewController *selectedDayController = [segue destinationViewController];
    [selectedDayController setDayData:_selectedDay];    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
