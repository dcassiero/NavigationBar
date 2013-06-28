//
//  RootViewController.m
//  NavigationBar-iPad
//
//  Created by Gene Backlin on 6/17/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//
// Hi Kannan Somasekar!

#import "RootViewController.h"
#import "DetailViewController.h"
#import "RootDetailViewController.h"


@implementation RootViewController

@synthesize detailViewController;
@synthesize groupsDict;
@synthesize evenArray;
@synthesize oddArray;


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	[self setClearsSelectionOnViewWillAppear:NO];
	[self setContentSizeForViewInPopover:CGSizeMake(200.0, 100.0)];
	[self setTitle:@"Choices"];
	[self initData];
}

- (void)initData {
	NSMutableArray *even = [NSMutableArray array];
	NSMutableArray *odd = [NSMutableArray array];
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	NSString *msg = nil;
	
	for (int i=0;i<20; i++) {
		msg = [NSString stringWithFormat:@"Number = %d", i];
		if ( i % 2 == 0 ) {
			[even addObject:msg];
		} else {
			[odd addObject:msg];
		}
	}
	[dict setObject:even forKey:@"Even"];
	[dict setObject:odd forKey:@"Odd"];
	[self setGroupsDict:dict];
}

// Ensure that the view controller supports rotation and that the split view can therefore 
// show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [groupsDict count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSArray *keys = [[[self groupsDict] allKeys] 
					 sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
	NSString *key = [keys objectAtIndex:[indexPath row]];
	
    static NSString *CellIdentifier = @"CellIdentifier";
    
    // Dequeue or create a cell of the appropriate type.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
									   reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Configure the cell.
	[[cell textLabel] setText:key];
	
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSArray *keys = [[[self groupsDict] allKeys] 
					 sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
	NSString *key = [keys objectAtIndex:[indexPath row]];
	NSArray *values = [[self groupsDict] objectForKey:key];
    /*
     When a row is selected, set the detail view controller's detail item to the item 
	 associated with the selected row.
     */
	RootDetailViewController *rootDetailViewController = [[RootDetailViewController alloc] 
														  initWithKey:key values:values 
														  viewController:[self detailViewController]];
	[[self navigationController] pushViewController:rootDetailViewController animated:YES];
	[rootDetailViewController release];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	[self setGroupsDict:nil];
	[self setEvenArray:nil];
	[self setOddArray:nil];
	[self setDetailViewController:nil];
}

- (void)dealloc {
    [groupsDict release];
    [evenArray release];
    [oddArray release];
    [detailViewController release];
    [super dealloc];
}


@end

