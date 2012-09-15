#import "_DayEvent.h"

@interface DayEvent : _DayEvent {}
+ (DayEvent *)dayEventWithTitle:(NSString *) title position:(NSNumber *) aPosition andDayData:(DayData *) dayData;
@end
