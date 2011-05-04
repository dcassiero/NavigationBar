//
//  RootDetailViewController.m
//  NavigationBar-iPad
//
//  Created by Gene Backlin on 6/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RootDetailViewController.h"
#import "DetailViewController.h"


@implementation RootDetailViewController

@synthesize key;
@synthesize values;
@synthesize detailViewController;

#pragma mark -
#pragma mark Initialization

- initWithKey:(NSString *)aKey values:(NSArray *)aValues viewController:(id)viewController {
	[self setKey:aKey];
	[self setValues:aValues];
	[self setDetailViewController:viewController];
	
	return self;
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	[self setClearsSelectionOnViewWillAppear:NO];
	[self setContentSizeForViewInPopover:CGSizeMake(200.0, 500.0)];
	[self setTitle:[self key]];
}

#pragma mark -
#pragma mark Rotation support

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self values] count];
}

#pragma mark -
#pragma mark Table view appearance

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *value = [[self values] objectAtIndex:[indexPath row]];
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
									   reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	[[cell textLabel] setText:value];
	
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[[self detailViewController] setText:[[self values] objectAtIndex:[indexPath row]]];
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	[self setDetailViewController:nil];
	[self setKey:nil];
	[self setValues:nil];
}

- (void)dealloc {
	[detailViewController release];
	[key release];
	[values release];
    [super dealloc];
}


@end

