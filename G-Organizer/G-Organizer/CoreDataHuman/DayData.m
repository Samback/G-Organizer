#import "DayData.h"
#import "User.h"

@implementation DayData
+ (DayData *)dayDataWithDate:(NSDate *)currentdate andUser:(User *)user
{
    DayData *dayDat = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSManagedObjectContext * context = user.managedObjectContext;
    
    request.entity = [NSEntityDescription entityForName:@"DayData" inManagedObjectContext:context];
    request.predicate = [NSPredicate predicateWithFormat:@"(%K == %@) and (%K == %@)", @"day", currentdate, @"dayOwner", user];
    
    NSError *error = nil;
    dayDat = [[context executeFetchRequest:request error:&error] lastObject];
    if (!error && !dayDat) {
        dayDat = [NSEntityDescription insertNewObjectForEntityForName:@"DayData" inManagedObjectContext:context];
        dayDat.day = currentdate;
        dayDat.userNews = @"";
        dayDat.dayOwner = user;
    }
    return dayDat;    
}

@end
