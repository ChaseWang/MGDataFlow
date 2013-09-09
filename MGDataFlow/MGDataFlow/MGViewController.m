//
//  MGViewController.m
//  MGDataFlow
//
//  Created by wangtao on 13-8-26.
//  Copyright (c) 2013年 wangtao. All rights reserved.
//

#import "MGViewController.h"
#import "Person.h"

@interface MGViewController ()

@end

@implementation MGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createEntity:(id)sender {
    
    NSManagedObjectContext *mc = [NSManagedObjectContext MR_contextForCurrentThread];
    for (int i = 0; i < 10000; i++) {
        Person *p = [Person MR_createInContext:mc];
        p.name = @"one";
        p.number = [NSString stringWithFormat:@"%d",i];
    }
    [mc MR_saveToPersistentStoreAndWait];
}

- (IBAction)getEntity:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSManagedObjectContext *mc = [NSManagedObjectContext MR_contextForCurrentThread];
        NSLog(@"begin fetch.");
        NSArray *array = [Person MR_findAllInContext:mc];
        NSLog(@"count:%d",array.count);
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            Person *p = obj;
            [self convertEntity:p];
        }];
        NSLog(@"end fetch.");
    });

  
}

- (IBAction)deleteEntity:(id)sender {
    //dispatch_queue_t startupQueue = dispatch_queue_create("com.renren.concept.startup", NULL);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSManagedObjectContext *mc = [NSManagedObjectContext MR_contextForCurrentThread];
        //[Person MR_deleteAllMatchingPredicate:nil inContext:mc];
        NSArray *array = [Person MR_findAllInContext:mc];
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            Person *p = obj;
            [p MR_deleteInContext:mc];
        }];
        
        [mc MR_saveOnlySelfAndWait];

        for (int i = 0; i < 10000; i++) {
            Person *p = [Person MR_createInContext:mc];
            p.name = @"one";
            p.number = [NSString stringWithFormat:@"%d",i];
        }
        [mc MR_saveOnlySelfAndWait];
    });
}

- (void)convertEntity:(Person *)p
{
    NSString *name = p.name;
    NSNumber *number = p.number;
}
@end
