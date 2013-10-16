//
//  BRITMasterViewController.h
//  Party Planner
//
//  Created by Paul on 10/7/13.
//  Copyright (c) 2013 Brass Ring IT, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BRITDetailViewController;

#import <CoreData/CoreData.h>

@interface BRITMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate, UIAlertViewDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) BRITDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
