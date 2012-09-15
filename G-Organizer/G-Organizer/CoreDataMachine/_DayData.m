// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DayData.m instead.

#import "_DayData.h"

const struct DayDataAttributes DayDataAttributes = {
	.day = @"day",
	.userNews = @"userNews",
};

const struct DayDataRelationships DayDataRelationships = {
	.dayOwner = @"dayOwner",
	.someEvent = @"someEvent",
};

const struct DayDataFetchedProperties DayDataFetchedProperties = {
};

@implementation DayDataID
@end

@implementation _DayData

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DayData" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DayData";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DayData" inManagedObjectContext:moc_];
}

- (DayDataID*)objectID {
	return (DayDataID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic day;






@dynamic userNews;






@dynamic dayOwner;

	

@dynamic someEvent;

	
- (NSMutableSet*)someEventSet {
	[self willAccessValueForKey:@"someEvent"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"someEvent"];
  
	[self didAccessValueForKey:@"someEvent"];
	return result;
}
	






@end
