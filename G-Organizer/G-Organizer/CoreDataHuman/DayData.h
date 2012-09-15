#import "_DayData.h"

@class User;

@interface DayData : _DayData {}
+ (DayData *)dayDataWithDate:(NSDate *)currentdate andUser:(User *)user;
@end
