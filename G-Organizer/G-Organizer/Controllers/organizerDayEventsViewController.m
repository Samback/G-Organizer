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
#import "DayData.h"
#import "DayEvent.h"

@interface organizerDayEventsViewController ()<UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITextView *myNews;
@property (nonatomic, strong) NSArray *events;
@property (nonatomic, strong) DayData *dayData;

- (NSArray *)fillCellsWithData;
@end
NSInteger  numberOfSections = 1;

NSInteger  criticalDaysStartedRow = 0;
NSString  *criticalDaysStarted = @"Critical Days Start";
NSInteger  criticalDaysEndRow  = 1;
NSString  *criticalDaysEnded = @"Critical Days End";
NSInteger  sexRow = 2;
NSString  *sexHappen = @"Have sex ;)";
NSInteger  badFillingsRow = 3;
NSString  *badFillings = @"Poor health";

@implementation organizerDayEventsViewController

@synthesize myNews = _myNews;
@synthesize events = _events;

- (void)setDayData:(DayData *)dayData
{
    _dayData = dayData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.myNews.layer setCornerRadius:10];
    self.myNews.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.myNews.layer.borderWidth = 3.0;
    self.events = [self fillCellsWithData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
}

- (NSArray *)fillCellsWithData
{
    NSMutableArray * ev = [NSMutableArray array];
    NSArray * labelsTitles = [NSArray arrayWithObjects:
                              criticalDaysStarted, criticalDaysEnded,
                              sexHappen, badFillings,
                              nil];
    DayEvent * dayEvent = nil;
    for (int i = 0; i < labelsTitles.count; i++){
        dayEvent = [DayEvent dayEventWithTitle:[labelsTitles objectAtIndex:i] position:[NSNumber numberWithInt:i] andDayData:_dayData];
        
        organizerDayEvents * event = [[organizerDayEvents alloc] init];
        event.eventTitle = dayEvent.eventName;
        event.eventState = dayEvent.eventStateValue;
        [ev addObject:event];     
    }
    
    self.myNews.text = _dayData.userNews;
    return (NSArray *)ev;
}

- (void)viewDidUnload
{
    [self setMyNews:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
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
- (IBAction)saveInfo:(UIButton *)sender {
     DayEvent *dayEvent = nil;
    for (int i = 0; i < _events.count; i++) {
        organizerDayEvents *currentEvent = [_events objectAtIndex:i];
        dayEvent = [DayEvent dayEventWithTitle:currentEvent.eventTitle position:[NSNumber numberWithInt:i] andDayData:_dayData];
        dayEvent.eventStateValue = currentEvent.eventState;
    }
    _dayData.userNews = _myNews.text;
    
    NSError *error = nil;
    [_dayData.managedObjectContext save:&error];
    if (error) {
        NSLog(@"Problems with saving");
    }
    else{
        [self dismissModalViewControllerAnimated:YES];
    }  
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
