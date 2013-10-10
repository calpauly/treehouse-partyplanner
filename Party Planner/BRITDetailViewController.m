//
//  BRITDetailViewController.m
//  Party Planner
//
//  Created by Paul on 10/7/13.
//  Copyright (c) 2013 Brass Ring IT, LLC. All rights reserved.
//

#import "BRITDetailViewController.h"

@interface BRITDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation BRITDetailViewController

#pragma mark - Managing the detail item

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    if (editing == YES) {
        _partyNameField.borderStyle = UITextBorderStyleRoundedRect;
        _partyDateField.borderStyle = UITextBorderStyleRoundedRect;
        _partyLocationField.borderStyle = UITextBorderStyleRoundedRect;
        _partyNameField.enabled = YES;
        _partyDateField.enabled = YES;
        _partyLocationField.enabled = YES;
    }
    else
    {
        //reset the controls to view mode
        _partyNameField.borderStyle = UITextBorderStyleNone;
        _partyDateField.borderStyle = UITextBorderStyleNone;
        _partyLocationField.borderStyle = UITextBorderStyleNone;
        _partyNameField.enabled = NO;
        _partyDateField.enabled = NO;
        _partyLocationField.enabled = NO;
        
        //save the changes
        self.detailItem.partyName = _partyNameField.text;
        //TODO: set the Date field value
        //self.detailItem.date = _partyDateField.text;
        self.detailItem.date = [NSDate date];
        self.detailItem.location = _partyLocationField.text;
        
        
        // Save the context.
        NSError *error = nil;
        if (![_managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (void)setDetailItem:(Party *)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.partyNameField.text = self.detailItem.partyName;
        self.partyDateField.text = self.detailItem.date.description;
        self.partyLocationField.text = self.detailItem.location;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
