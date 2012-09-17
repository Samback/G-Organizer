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

@interface organizerDayEventsViewController ()<UITextViewDelegate, organizerDayEventsCellDelegate>

@property (strong, nonatomic) IBOutlet UITextView *myNews;
@property (nonatomic, strong) NSArray  *events;
@property (nonatomic, strong) DayData  *dayData;
@property (nonatomic, strong) UISwitch *criticalDayStart;
@property (nonatomic, strong) UISwitch *criticalDayEnd;
@property (nonatomic, strong) NSArray  *labelsTitles;

- (BOOL)isCriticalDayStartedRow:(NSUInteger)row;
- (BOOL)isCriticalDayEndedRow:(NSUInteger)row;

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
@synthesize criticalDayEnd = _criticalDayEnd;
@synthesize criticalDayStart = _criticalDayStart;
@synthesize labelsTitles = _labelsTitles;

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
    self.labelsTitles = [NSArray arrayWithObjects:
                              criticalDaysStarted, criticalDaysEnded,
                              sexHappen, badFillings,
                              nil];
    DayEvent * dayEvent = nil;
    for (int i = 0; i < _labelsTitles.count; i++){
        dayEvent = [DayEvent dayEventWithTitle:[_labelsTitles objectAtIndex:i] position:[NSNumber numberWithInt:i] andDayData:_dayData];
        
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
    cell.delegate = self;
        
    if ([self isCriticalDayStartedRow:indexPath.row]) {
        self.criticalDayStart = cell.eventState;
    }else if ([self isCriticalDayEndedRow:indexPath.row]){
        self.criticalDayEnd = cell.eventState;
    }
    
    return cell;
}
- (IBAction)saveInfo:(UIButton *)sender {
     DayEvent *dayEvent = nil;
    for (int i = 0; i < _events.count; i++) {
        organizerDayEvents *currentEvent = [_events objectAtIndex:i];
        dayEvent = [DayEvent dayEventWithTitle:currentEvent.eventTitle position:[NSNumber numberWithInt:i] andDayData:_dayData];
        dayEvent.eventStateValue = currentEvent.eventState;
        
        if ([self isCriticalDayStartedRow:i]) {
            dayEvent.eventStateValue = self.criticalDayStart.on;
        }else if ([self isCriticalDayEndedRow:i]){
            dayEvent.eventStateValue = self.criticalDayEnd.on;
        }        
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

#pragma mark - organizerDayEventsCell
- (void)switcherChange:(UISwitch *)switcher
{
    if ([switcher isEqual:self.criticalDayStart] && self.criticalDayStart.on) {
        [self.criticalDayEnd setOn:NO animated:YES];
    }
    else if ([switcher isEqual:self.criticalDayEnd] && self.criticalDayEnd.on){
        [self.criticalDayStart setOn:NO animated:YES];
    }
        
}

- (BOOL)isCriticalDayStartedRow:(NSUInteger)row
{
    return [[_labelsTitles objectAtIndex:row] isEqualToString:criticalDaysStarted] ? YES : NO;
}

- (BOOL)isCriticalDayEndedRow:(NSUInteger)row
{
    return [[_labelsTitles objectAtIndex:row] isEqualToString:criticalDaysEnded] ? YES : NO;
}

@end
