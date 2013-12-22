//
//  ViewController.h
//  CD
//
//  Created by Deva Palanisamy on 22/12/13.
//  Copyright (c) 2013 Aurum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray *names;
@property NSFetchedResultsController *fetchController;
@end
