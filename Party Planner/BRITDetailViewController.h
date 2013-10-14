//
//  BRITDetailViewController.h
//  Party Planner
//
//  Created by Paul on 10/7/13.
//  Copyright (c) 2013 Brass Ring IT, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Party;

@interface BRITDetailViewController : UITableViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) Party* detailItem;

@end
