#import "User.h"

@implementation User
+ (User *)userWithLogin:(NSString *)login password:(NSString *)password andContext:(NSManagedObjectContext *) context
{
    User *user = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    request.predicate = [NSPredicate predicateWithFormat:@"(%K == %@) and (%K == %@)", @"login", login, @"password", password];
    
    NSError *error = nil;
    user = [[context executeFetchRequest:request error:&error] lastObject];
    
    if (!error && !user) {
        user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        user.login = login;
        user.password = password;
    }
    
    return user;    
}
@end
