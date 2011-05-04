//
//  RootDetailViewController.h
//  NavigationBar-iPad
//
//  Created by Gene Backlin on 6/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface RootDetailViewController : UITableViewController {
    DetailViewController *detailViewController;
	
	NSString *key;
	NSArray *values;
}

@property (nonatomic, retain) DetailViewController *detailViewController;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSArray *values;

- initWithKey:(NSString *)aKey values:(NSArray *)aValues viewController:(id)viewController;

@end
