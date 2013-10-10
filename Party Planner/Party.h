//
//  Party.h
//  Party Planner
//
//  Created by Paul on 10/8/13.
//  Copyright (c) 2013 Brass Ring IT, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Guest;
@class Food;

@interface Party : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * partyName;
@property (nonatomic, retain) NSSet *guests;
@property (nonatomic, retain) NSSet *menu;
@end

@interface Party (CoreDataGeneratedAccessors)

- (void)addGuestsObject:(Guest *)value;
- (void)removeGuestsObject:(Guest *)value;
- (void)addGuests:(NSSet *)values;
- (void)removeGuests:(NSSet *)values;

- (void)addMenuObject:(Food *)value;
- (void)removeMenuObject:(Food *)value;
- (void)addMenu:(NSSet *)values;
- (void)removeMenu:(NSSet *)values;

@end
