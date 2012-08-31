// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#import <CoreData/CoreData.h>


extern const struct UserAttributes {
	__unsafe_unretained NSString *age;
	__unsafe_unretained NSString *fullName;
	__unsafe_unretained NSString *login;
	__unsafe_unretained NSString *password;
	__unsafe_unretained NSString *photo;
} UserAttributes;

extern const struct UserRelationships {
} UserRelationships;

extern const struct UserFetchedProperties {
} UserFetchedProperties;








@interface UserID : NSManagedObjectID {}
@end

@interface _User : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (UserID*)objectID;




@property (nonatomic, strong) NSDecimalNumber* age;


//- (BOOL)validateAge:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* fullName;


//- (BOOL)validateFullName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* login;


//- (BOOL)validateLogin:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* password;


//- (BOOL)validatePassword:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSData* photo;


//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;






@end

@interface _User (CoreDataGeneratedAccessors)

@end

@interface _User (CoreDataGeneratedPrimitiveAccessors)


- (NSDecimalNumber*)primitiveAge;
- (void)setPrimitiveAge:(NSDecimalNumber*)value;




- (NSString*)primitiveFullName;
- (void)setPrimitiveFullName:(NSString*)value;




- (NSString*)primitiveLogin;
- (void)setPrimitiveLogin:(NSString*)value;




- (NSString*)primitivePassword;
- (void)setPrimitivePassword:(NSString*)value;




- (NSData*)primitivePhoto;
- (void)setPrimitivePhoto:(NSData*)value;




@end
