// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.m instead.

#import "_User.h"

const struct UserAttributes UserAttributes = {
	.age = @"age",
	.fullName = @"fullName",
	.login = @"login",
	.password = @"password",
	.photo = @"photo",
};

const struct UserRelationships UserRelationships = {
	.dayData = @"dayData",
};

const struct UserFetchedProperties UserFetchedProperties = {
};

@implementation UserID
@end

@implementation _User

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"User";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc_];
}

- (UserID*)objectID {
	return (UserID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic age;






@dynamic fullName;






@dynamic login;






@dynamic password;






@dynamic photo;






@dynamic dayData;

	
- (NSMutableSet*)dayDataSet {
	[self willAccessValueForKey:@"dayData"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"dayData"];
  
	[self didAccessValueForKey:@"dayData"];
	return result;
}
	






@end
