//
//  MGViewController.m
//  MGDataFlow
//
//  Created by wangtao on 13-8-26.
//  Copyright (c) 2013年 wangtao. All rights reserved.
//

#import "MGViewController.h"
#import "Person.h"
#import "Phone.h"

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
    for (int i = 0; i < 100; i++) {
        Person *p = [Person MR_createInContext:mc];
        p.name = @"name";
        p.pid = [NSString stringWithFormat:@"%d",i];
        for (int j = 0; j < 10; j++) {
            Phone *ph = [Phone MR_createEntity];
            ph.number = [NSString stringWithFormat:@"ph%d",j];
            [p.phoneSet addObject:ph];
        }
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
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSManagedObjectContext *mc = [NSManagedObjectContext MR_contextForCurrentThread];
        [Person MR_deleteAllMatchingPredicate:nil inContext:mc];
        [mc MR_saveToPersistentStoreAndWait];
    });
}

- (void)convertEntity:(Person *)p
{
    NSString *number = p.pid;
    NSLog(@"pid:%@",number);
    [p.phone enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Phone *p = obj;
        NSLog(@"phone:%@",p.number);
    }];
    
}
@end
