#import "_DayData.h"

@class User;

@interface DayData : _DayData {}
// Custom logic goes here.
+ (DayData *)dayDataWithDate:(NSDate *)currentdate andUser:(User *)user;
@end
