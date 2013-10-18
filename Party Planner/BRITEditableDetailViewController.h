//
//  BRITEditableDetailViewController.h
//  Party Planner
//
//  Created by Paul on 10/7/13.
//  Copyright (c) 2013 Brass Ring IT, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Party.h"

@interface BRITEditableDetailViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) Party *detailItem;
@property (weak, nonatomic) IBOutlet UITextField *partyNameField;
@property (weak, nonatomic) IBOutlet UITextField *partyDateField;
@property (weak, nonatomic) IBOutlet UITextField *partyLocationField;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
