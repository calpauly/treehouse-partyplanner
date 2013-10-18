//
//  BRITDetailViewController.m
//  Party Planner
//
//  Created by Paul on 10/7/13.
//  Copyright (c) 2013 Brass Ring IT, LLC. All rights reserved.
//

#import "BRITDetailViewController.h"
#import "Party.h"
#import "BRITEditableDetailViewController.h"

@interface BRITDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation BRITDetailViewController

#pragma mark - Managing the detail item

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    if (editing == YES) {
//        _partyNameField.borderStyle = UITextBorderStyleRoundedRect;
//        _partyDateField.borderStyle = UITextBorderStyleRoundedRect;
//        _partyLocationField.borderStyle = UITextBorderStyleRoundedRect;
//        _partyNameField.enabled = YES;
//        _partyDateField.enabled = YES;
//        _partyLocationField.enabled = YES;
    }
    else
    {
        //reset the controls to view mode
//        _partyNameField.borderStyle = UITextBorderStyleNone;
//        _partyDateField.borderStyle = UITextBorderStyleNone;
//        _partyLocationField.borderStyle = UITextBorderStyleNone;
//        _partyNameField.enabled = NO;
//        _partyDateField.enabled = NO;
//        _partyLocationField.enabled = NO;
        
        //save the changes
//        self.detailItem.partyName = _partyNameField.text;
        //TODO: set the Date field value
        //self.detailItem.date = _partyDateField.text;
        self.detailItem.date = [NSDate date];
//        self.detailItem.location = _partyLocationField.text;
        
        
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
        [self.tableView reloadData];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"editableDetailsSegue"]) {
        ((BRITEditableDetailViewController *)segue.destinationViewController).managedObjectContext = ((BRITDetailViewController *)segue.sourceViewController).managedObjectContext;
        
        ((BRITEditableDetailViewController *)segue.destinationViewController).detailItem = ((BRITDetailViewController *)segue.sourceViewController).detailItem;
    }
}

#pragma mark - Table View

-(void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 0:
            cell.detailTextLabel.text = [self.detailItem.partyName description];
            cell.textLabel.text = @"Party Name";
            break;
        case 1:
            cell.detailTextLabel.text = [self.detailItem.location description];
            cell.textLabel.text = @"Location";
            break;
        case 2:
        {
            NSDateFormatter *dateFormat = [NSDateFormatter new];
            [dateFormat setDateFormat:@"MM dd yyyy"];
            cell.detailTextLabel.text = [dateFormat stringFromDate:self.detailItem.date];
            cell.textLabel.text = @"Date";
            break;
        }
        default:
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
//        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
//        
//        NSError *error = nil;
//        if (![context save:&error]) {
//            // Replace this implementation with code to handle the error appropriately.
//            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//            abort();
//        }
//    }
//}

//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // The table view should not be re-orderable.
//    return NO;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
//        self.detailViewController.detailItem = (Party *)object;
//    }
//}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
//        [[segue destinationViewController] setDetailItem:(Party *)object];
//        
//        if ([[UIDevice currentDevice] userInterfaceIdiom] != UIUserInterfaceIdiomPad) {
//            self.detailViewController = (BRITDetailViewController *)[segue destinationViewController];
//            self.detailViewController.managedObjectContext = self.managedObjectContext;
//        }
//    }
//}

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
