// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Phone.h instead.

#import <CoreData/CoreData.h>


extern const struct PhoneAttributes {
	__unsafe_unretained NSString *number;
} PhoneAttributes;

extern const struct PhoneRelationships {
	__unsafe_unretained NSString *person;
} PhoneRelationships;

extern const struct PhoneFetchedProperties {
} PhoneFetchedProperties;

@class Person;



@interface PhoneID : NSManagedObjectID {}
@end

@interface _Phone : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PhoneID*)objectID;




@property (nonatomic, strong) NSString* number;


//- (BOOL)validateNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Person* person;

//- (BOOL)validatePerson:(id*)value_ error:(NSError**)error_;





@end

@interface _Phone (CoreDataGeneratedAccessors)

@end

@interface _Phone (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveNumber;
- (void)setPrimitiveNumber:(NSString*)value;





- (Person*)primitivePerson;
- (void)setPrimitivePerson:(Person*)value;


@end
