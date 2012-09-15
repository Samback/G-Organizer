// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DayEvent.h instead.

#import <CoreData/CoreData.h>


extern const struct DayEventAttributes {
	__unsafe_unretained NSString *eventName;
	__unsafe_unretained NSString *eventNumber;
	__unsafe_unretained NSString *eventState;
} DayEventAttributes;

extern const struct DayEventRelationships {
	__unsafe_unretained NSString *currentDay;
} DayEventRelationships;

extern const struct DayEventFetchedProperties {
} DayEventFetchedProperties;

@class DayData;





@interface DayEventID : NSManagedObjectID {}
@end

@interface _DayEvent : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DayEventID*)objectID;




@property (nonatomic, strong) NSString* eventName;


//- (BOOL)validateEventName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* eventNumber;


@property int16_t eventNumberValue;
- (int16_t)eventNumberValue;
- (void)setEventNumberValue:(int16_t)value_;

//- (BOOL)validateEventNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* eventState;


@property BOOL eventStateValue;
- (BOOL)eventStateValue;
- (void)setEventStateValue:(BOOL)value_;

//- (BOOL)validateEventState:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) DayData* currentDay;

//- (BOOL)validateCurrentDay:(id*)value_ error:(NSError**)error_;





@end

@interface _DayEvent (CoreDataGeneratedAccessors)

@end

@interface _DayEvent (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveEventName;
- (void)setPrimitiveEventName:(NSString*)value;




- (NSNumber*)primitiveEventNumber;
- (void)setPrimitiveEventNumber:(NSNumber*)value;

- (int16_t)primitiveEventNumberValue;
- (void)setPrimitiveEventNumberValue:(int16_t)value_;




- (NSNumber*)primitiveEventState;
- (void)setPrimitiveEventState:(NSNumber*)value;

- (BOOL)primitiveEventStateValue;
- (void)setPrimitiveEventStateValue:(BOOL)value_;





- (DayData*)primitiveCurrentDay;
- (void)setPrimitiveCurrentDay:(DayData*)value;


@end
