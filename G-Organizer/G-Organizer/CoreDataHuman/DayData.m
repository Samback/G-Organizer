#import "DayData.h"
#import "User.h"

@implementation DayData
+ (DayData *)dayDataWithDate:(NSDate *)currentdate andUser:(User *)user
{
    DayData *dayData = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSManagedObjectContext * context = user.managedObjectContext;
    
    request.entity = [NSEntityDescription entityForName:@"DayData" inManagedObjectContext:context];
    request.predicate = [NSPredicate predicateWithFormat:@"(%K == %@) and (%K == %@)", @"day", currentdate, @"dayOwner", user];
    
    NSError *error = nil;
    dayData = [[context executeFetchRequest:request error:&error] lastObject];
    if (!error && !dayData) {
        dayData = [NSEntityDescription insertNewObjectForEntityForName:@"DayData" inManagedObjectContext:context];
        dayData.day = currentdate;
        dayData.userNews = @"";
        dayData.dayOwner = user;
    }
    return dayData;
}

@end
