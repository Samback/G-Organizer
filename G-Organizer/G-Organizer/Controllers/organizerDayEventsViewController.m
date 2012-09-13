//
//  organizerDayEventsViewController.m
//  G-Organizer
//
//  Created by Max on 03.09.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import "organizerDayEventsViewController.h"
#import "organizerDayEventsCell.h"
#import "organizerDayEvents.h"

@interface organizerDayEventsViewController ()<UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITextView *myNews;

@property (nonatomic, strong) NSArray * events;

- (NSArray *)cellsData;
@end
NSInteger  numberOfSections = 1;

NSInteger  criticalDaysStartedRow = 0;
NSString * criticalDaysStarted = @"Critical Days Start";
NSInteger  criticalDaysEndRow  = 1;
NSString * criticalDaysEnded = @"Critical Days End";
NSInteger  sexRow = 2;
NSString * sexHappen = @"Have sex ;)";
NSInteger  badFillingsRow = 3;
NSString * badFillings = @"Poor health";

@implementation organizerDayEventsViewController

@synthesize myNews = _myNews;
@synthesize events = _events;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.myNews.layer setCornerRadius:10];
    self.myNews.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.myNews.layer.borderWidth = 3.0;
    self.events = [self cellsData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
}

- (NSArray *)cellsData
{
    NSMutableArray * ev = [NSMutableArray array];
    
    organizerDayEvents * event = [[organizerDayEvents alloc] init];
    event.eventTitle = criticalDaysStarted;
    [ev addObject:event];
    
    event = [[organizerDayEvents alloc] init];
    event.eventTitle = criticalDaysEnded;
    [ev addObject:event];
    
    event = [[organizerDayEvents alloc] init];
    event.eventTitle = sexHappen;
    [ev addObject:event];
    
    event = [[organizerDayEvents alloc] init];
    event.eventTitle = badFillings;
    [ev addObject:event];
    
    return (NSArray *)ev;
}

- (void)viewDidUnload
{
    [self setMyNews:nil];
    [super viewDidUnload];
   
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Day Events Cell";    
    organizerDayEventsCell *cell =  [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.eventData =  [_events objectAtIndex:indexPath.row];
    
    return cell;
}

- (IBAction)backClicked:(UIButton *)sender {
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark - UITextView Delegate Methods
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{   
    if([text isEqualToString:@"\n"]) {
        [_myNews resignFirstResponder];
        return NO;
    }
    
    return YES;
}
@end
