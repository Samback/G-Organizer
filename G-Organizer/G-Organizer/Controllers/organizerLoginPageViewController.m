//
//  organizerLoginPageViewController.m
//  G-Organizer
//
//  Created by Max on 14.08.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import "organizerLoginPageViewController.h"
#import "organizerDefinitions.h"
#import "User.h"

@interface organizerLoginPageViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (nonatomic, strong) UITapGestureRecognizer *keyboardRemover;

- (void)userConfirmation;
- (void)onShowKeyboard:(id)sender;
- (void)hideKeyboard:(id)sender;
@end

@implementation organizerLoginPageViewController
@synthesize loginField    = _loginField;
@synthesize passwordField = _passwordField;
@synthesize keyboardRemover = _keyboardRemover;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.passwordField.secureTextEntry = YES;
    self.passwordField.delegate = self;
    
    self.keyboardRemover = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    [_loginField addTarget:self action:@selector(onShowKeyboard:) forControlEvents:UIControlEventEditingDidBegin];
    [_passwordField addTarget:self action:@selector(onShowKeyboard:) forControlEvents:UIControlEventEditingDidBegin];
}

- (void)viewDidUnload
{
    [self setLoginField:nil];
    [self setPasswordField:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)inToAplication:(UIButton *)sender {
    [self userConfirmation];
}

-(void) userConfirmation
{
    NSManagedObjectContext *context = DELEGATE.managedObjectContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(%K == %@) and (%K == %@)",@"login",
                              _loginField.text, @"password", _passwordField.text];
    [request setEntity:entityDescription];
    [request setPredicate:predicate];
    NSError *error;
    NSArray *answers = [context executeFetchRequest:request error:&error];
    if  (!error && answers.count > 0){
        DELEGATE.currentUser = [answers lastObject];
        UITabBarController *inController = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
        [self presentModalViewController:inController animated:YES];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:APP_NAME message:MISTAKEN_CONFIRMATION delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_passwordField resignFirstResponder];
    [self userConfirmation];
    return NO;
}
-(void) onShowKeyboard:(id)sender
{
    [self.view addGestureRecognizer:_keyboardRemover];
}

-(void)hideKeyboard:(id)sender
{
    [_loginField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [self.view removeGestureRecognizer:_keyboardRemover];
}
@end
