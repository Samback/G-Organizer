#import "_DayData.h"

@interface DayData : _DayData {}
// Custom logic goes here.
+ (DayData *)dayDataWithDate:(NSDate *) currentdate andMangedObject:(NSManagedObjectContext *) context;
@end
