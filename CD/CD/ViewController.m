//
//  ViewController.m
//  CD
//
//  Created by Deva Palanisamy on 22/12/13.
//  Copyright (c) 2013 Aurum. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableView,names,fetchController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getFetchController];
    names = [NSArray arrayWithObjects:@"Deva",@"Kumar",@"Prabhu", nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    
    NSInteger c = [[self.fetchController fetchedObjects]count];
    return [[self.fetchController fetchedObjects] count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    
    //cell.textLabel.text = [names objectAtIndex:[indexPath row]];
    cell.textLabel.text = [[[fetchController fetchedObjects] objectAtIndex:[indexPath row]] name];
    NSString *str1 = [NSDateFormatter localizedStringFromDate: [[[fetchController fetchedObjects] objectAtIndex:[indexPath row]] birthday]
                                                               dateStyle:NSDateFormatterShortStyle
       
                                                    timeStyle:NSDateFormatterFullStyle];
    cell.textLabel.text = str1;
    return cell;
}

-(NSFetchedResultsController*)getFetchController{
    AppDelegate *app = [[AppDelegate alloc]init];
    
    if (!fetchController) {
        
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Person class])];
        
        fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
        
        self.fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:app.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        self.fetchController.delegate = self;
        
        NSError *error;
        
        [self.fetchController performFetch:&error];
        
        NSLog(@"%@",[self.fetchController fetchedObjects]);
        
        NSAssert(!error, @"Error performing fetch request: %@", error);
        
    }
    
    return fetchController;
    
}


@end
