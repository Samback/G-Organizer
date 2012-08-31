//
//  organizerLoginPageViewController.m
//  G-Organizer
//
//  Created by Max on 14.08.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import "organizerLoginPageViewController.h"
#import "User.h"


@interface organizerLoginPageViewController ()
-(void) checkLoginedUsers;
@end

@implementation organizerLoginPageViewController

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
    // Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) checkLoginedUsers
{
    NSManagedObjectContext * context = [ DELEGATE managedObjectContext];    
    NSEntityDescription * entityDescription = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];    
    //NSPredicate * predicate = [NSPredicate predicateWithFormat:@"(age BETWEEN {10, 50})"];/* OR (firstName LIKE[c] 'Max')"];*/    
    [request setEntity:entityDescription];    
    // [request setPredicate:predicate];   
    NSError * error;    
    User * user = [[context executeFetchRequest:request error:&error] objectAtIndex:1];    
    if (user == nil)
        NSLog(@"The error with Core Data");    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:APP_NAME message:user.login delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];

}

@end
