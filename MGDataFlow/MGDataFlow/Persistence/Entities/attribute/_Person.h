// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Person.h instead.

#import <CoreData/CoreData.h>


extern const struct PersonAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *pid;
} PersonAttributes;

extern const struct PersonRelationships {
	__unsafe_unretained NSString *phone;
} PersonRelationships;

extern const struct PersonFetchedProperties {
} PersonFetchedProperties;

@class Phone;




@interface PersonID : NSManagedObjectID {}
@end

@interface _Person : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PersonID*)objectID;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* pid;


//- (BOOL)validatePid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSOrderedSet* phone;

- (NSMutableOrderedSet*)phoneSet;





@end

@interface _Person (CoreDataGeneratedAccessors)

- (void)addPhone:(NSOrderedSet*)value_;
- (void)removePhone:(NSOrderedSet*)value_;
- (void)addPhoneObject:(Phone*)value_;
- (void)removePhoneObject:(Phone*)value_;

@end

@interface _Person (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitivePid;
- (void)setPrimitivePid:(NSString*)value;





- (NSMutableOrderedSet*)primitivePhone;
- (void)setPrimitivePhone:(NSMutableOrderedSet*)value;


@end
