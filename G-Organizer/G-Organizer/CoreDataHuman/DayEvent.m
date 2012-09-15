#import "DayEvent.h"
#import "DayData.h"

@implementation DayEvent
+ (DayEvent *)dayEventWithTitle:(NSString *) title position:(NSNumber *) aPosition andDayData:(DayData *) dayData{
    
    DayEvent * dayEvent = nil;
    NSManagedObjectContext * context = dayData.managedObjectContext;
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"DayEvent" inManagedObjectContext:context];
    request.predicate = [NSPredicate predicateWithFormat:@"(currentDay == %@) and (eventNumber == %@)", dayData, aPosition];
    
    NSError *error = nil;
    dayEvent = [[context executeFetchRequest:request error:&error] lastObject];
    if (!error && !dayEvent) {
        dayEvent = [NSEntityDescription insertNewObjectForEntityForName:@"DayEvent" inManagedObjectContext:context];
        dayEvent.eventName = title;
        dayEvent.eventStateValue = NO;
        dayEvent.eventNumber = aPosition;
        dayEvent.currentDay = dayData;
    }
    
    return dayEvent;
}

@end
