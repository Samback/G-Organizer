//
//  organizerHomeViewController.h
//  G-Organizer
//
//  Created by Max on 13.08.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TapkuLibrary/TapkuLibrary.h>

@interface organizerHomeViewController : TKCalendarMonthTableViewController{
	NSMutableArray *dataArray;
	NSMutableDictionary *dataDictionary;
}

@property (retain,nonatomic) NSMutableArray *dataArray;
@property (retain,nonatomic) NSMutableDictionary *dataDictionary;

- (void) generateRandomDataForStartDate:(NSDate*)start endDate:(NSDate*)end;

@end
