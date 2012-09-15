// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DayData.h instead.

#import <CoreData/CoreData.h>


extern const struct DayDataAttributes {
	__unsafe_unretained NSString *day;
	__unsafe_unretained NSString *userNews;
} DayDataAttributes;

extern const struct DayDataRelationships {
	__unsafe_unretained NSString *dayOwner;
	__unsafe_unretained NSString *someEvent;
} DayDataRelationships;

extern const struct DayDataFetchedProperties {
} DayDataFetchedProperties;

@class User;
@class DayEvent;




@interface DayDataID : NSManagedObjectID {}
@end

@interface _DayData : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DayDataID*)objectID;




@property (nonatomic, strong) NSDate* day;


//- (BOOL)validateDay:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* userNews;


//- (BOOL)validateUserNews:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) User* dayOwner;

//- (BOOL)validateDayOwner:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* someEvent;

- (NSMutableSet*)someEventSet;





@end

@interface _DayData (CoreDataGeneratedAccessors)

- (void)addSomeEvent:(NSSet*)value_;
- (void)removeSomeEvent:(NSSet*)value_;
- (void)addSomeEventObject:(DayEvent*)value_;
- (void)removeSomeEventObject:(DayEvent*)value_;

@end

@interface _DayData (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDay;
- (void)setPrimitiveDay:(NSDate*)value;




- (NSString*)primitiveUserNews;
- (void)setPrimitiveUserNews:(NSString*)value;





- (User*)primitiveDayOwner;
- (void)setPrimitiveDayOwner:(User*)value;



- (NSMutableSet*)primitiveSomeEvent;
- (void)setPrimitiveSomeEvent:(NSMutableSet*)value;


@end
