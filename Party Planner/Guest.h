//
//  Guest.h
//  Party Planner
//
//  Created by Paul on 10/11/13.
//  Copyright (c) 2013 Brass Ring IT, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Party;

@interface Guest : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Party *party;

@end
