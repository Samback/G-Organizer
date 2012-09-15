// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DayEvent.m instead.

#import "_DayEvent.h"

const struct DayEventAttributes DayEventAttributes = {
	.eventName = @"eventName",
	.eventNumber = @"eventNumber",
	.eventState = @"eventState",
};

const struct DayEventRelationships DayEventRelationships = {
	.currentDay = @"currentDay",
};

const struct DayEventFetchedProperties DayEventFetchedProperties = {
};

@implementation DayEventID
@end

@implementation _DayEvent

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DayEvent" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DayEvent";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DayEvent" inManagedObjectContext:moc_];
}

- (DayEventID*)objectID {
	return (DayEventID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"eventNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"eventNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"eventStateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"eventState"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic eventName;






@dynamic eventNumber;



- (int16_t)eventNumberValue {
	NSNumber *result = [self eventNumber];
	return [result shortValue];
}

- (void)setEventNumberValue:(int16_t)value_ {
	[self setEventNumber:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveEventNumberValue {
	NSNumber *result = [self primitiveEventNumber];
	return [result shortValue];
}

- (void)setPrimitiveEventNumberValue:(int16_t)value_ {
	[self setPrimitiveEventNumber:[NSNumber numberWithShort:value_]];
}





@dynamic eventState;



- (BOOL)eventStateValue {
	NSNumber *result = [self eventState];
	return [result boolValue];
}

- (void)setEventStateValue:(BOOL)value_ {
	[self setEventState:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveEventStateValue {
	NSNumber *result = [self primitiveEventState];
	return [result boolValue];
}

- (void)setPrimitiveEventStateValue:(BOOL)value_ {
	[self setPrimitiveEventState:[NSNumber numberWithBool:value_]];
}





@dynamic currentDay;

	






@end
