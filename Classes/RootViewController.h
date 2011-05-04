//
//  RootViewController.h
//  NavigationBar-iPad
//
//  Created by Gene Backlin on 6/17/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface RootViewController : UITableViewController {
    DetailViewController *detailViewController;
	
	NSDictionary *groupsDict;
	NSArray *evenArray;
	NSArray *oddArray;
	
}

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;
@property (nonatomic, retain) NSDictionary *groupsDict;
@property (nonatomic, retain) NSArray *evenArray;
@property (nonatomic, retain) NSArray *oddArray;

- (void)initData;

@end
