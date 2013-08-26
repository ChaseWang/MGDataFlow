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
    for (int i = 0; i < 1000; i++) {
        Person *p = [Person MR_createInContext:mc];
        p.name = @"one";
        p.number = [NSString stringWithFormat:@"%d",i];
    }
    [mc MR_saveToPersistentStoreAndWait];
}

- (IBAction)getEntity:(id)sender {
    NSManagedObjectContext *mc = [NSManagedObjectContext MR_contextForCurrentThread];
    NSArray *array = [Person MR_findAllInContext:mc];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Person *p = obj;
        NSLog(@"%@",p.number);
    }];
}

- (IBAction)deleteEntity:(id)sender {
    NSManagedObjectContext *mc = [NSManagedObjectContext MR_contextForCurrentThread];
    NSArray *array = [Person MR_findAllInContext:mc];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Person *p = obj;
        [p MR_deleteInContext:mc];
    }];
    [mc MR_saveToPersistentStoreAndWait];
}
@end
