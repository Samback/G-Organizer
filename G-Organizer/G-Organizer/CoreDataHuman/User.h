#import "_User.h"

@interface User : _User {}
+ (User *)userWithLogin:(NSString *)login password:(NSString *)password andContext:(NSManagedObjectContext *) context;
@end
