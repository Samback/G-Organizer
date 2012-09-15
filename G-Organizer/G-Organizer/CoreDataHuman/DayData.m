#import "DayData.h"

@implementation DayData
+ (DayData *)dayDataWithDate:(NSDate *) currentdate andMangedObject:(NSManagedObjectContext *) context
{
    DayData * dayDat = nil;
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"DayData" inManagedObjectContext:context];
    request.predicate = [NSPredicate predicateWithFormat:@"day == %@", currentdate];
    
    NSError *error = nil;
    dayDat = [[context executeFetchRequest:request error:&error] lastObject];
    if (!error && !dayDat) {
        dayDat = [NSEntityDescription insertNewObjectForEntityForName:@"DayData" inManagedObjectContext:context];
        dayDat.day = currentdate;
        dayDat.userNews = @"";
    }
    return dayDat;    
}

@end
