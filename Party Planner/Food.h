//
//  Food.h
//  Party Planner
//
//  Created by Paul on 10/8/13.
//  Copyright (c) 2013 Brass Ring IT, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Party;

@interface Food : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Party *party;

@end
