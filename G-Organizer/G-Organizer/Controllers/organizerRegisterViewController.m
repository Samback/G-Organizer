//
//  organizerRegisterViewController.m
//  G-Organizer
//
//  Created by Max on 15.08.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import "organizerRegisterViewController.h"
#import "organizerAppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "organizerSimpleCell.h"
#import "organizerPasswordCell.h"
#import "organizerAvatarCell.h"
#import "organizerDefinitions.h"
#import "NSString+Empty.h"
#import "AGImagePickerController.h"
#import "UIImage+ResizeImage.h"
#import "User.h"


@interface organizerRegisterViewController ()<UIActionSheetDelegate, AGImagePickerControllerDelegate>
@property (nonatomic, strong) UITextField * loginField;
@property (nonatomic, strong) UITextField * passwordField;
@property (nonatomic, strong) UITextField * passwordConfirmationField;
@property (nonatomic, strong) UITextField * fullNameField;
@property (nonatomic, strong) UITextField * ageField;
@property (nonatomic, strong) NSArray * resigneFields;
@property (nonatomic, strong) UITapGestureRecognizer * keyboardRemover;
@property (nonatomic, strong) UIActionSheet * avatarSheet;
@property (nonatomic, strong) UIImageView * avatarImage;
-(BOOL) testRegistration;
-(void)showAlbum;
@end



const NSInteger NUMBER_OF_SECTIONS = 2;
//Required fields
const NSInteger REQUIRED_SECTION     = 0;
const NSInteger NUMBER_OF_ROWS_IN_REQUIRED_SECTION = 4;
const NSInteger LOGIN_ROW            = 0;
const NSInteger PASSWORD_ROW         = 1;
const NSInteger PASSWORD_CONFIRM_ROW = 2;
const NSInteger AVATAR_ROW           = 3;

//Optional fields
const NSInteger OPTIONAL_SECTION     = 1;
const NSInteger NUMBER_OF_ROWS_IN_OPTIONAL_SECTION = 2;
const NSInteger FULL_NAME_ROW        = 0;
const NSInteger AGE_ROW              = 1;


@implementation organizerRegisterViewController
@synthesize resigneFields = _resigneFields;

@synthesize loginField = _loginField;
@synthesize passwordField = _passwordField;
@synthesize passwordConfirmationField = _passwordConfirmationField;
@synthesize fullNameField = _fullNameField;
@synthesize ageField = _ageField;
@synthesize keyboardRemover = _keyboardRemover;
@synthesize avatarSheet = _avatarSheet;
@synthesize avatarImage = _avatarImage;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.keyboardRemover = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    self.resigneFields = [NSMutableArray array];
    UIActionSheet * action = [[UIActionSheet alloc] initWithTitle:APP_NAME delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:TAKE_PHOTO_FROM_CAMERA, TAKE_PHOTO_FROM_ALBUM, nil];
    self.avatarSheet = action;

}

- (void)viewDidUnload
{
    [self setResigneFields:nil];
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
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == REQUIRED_SECTION) {
        return NUMBER_OF_ROWS_IN_REQUIRED_SECTION;
    }else if (section == OPTIONAL_SECTION)
        return NUMBER_OF_ROWS_IN_OPTIONAL_SECTION;
    // Return the number of rows in the section.
    return 0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    self.resigneFields = [NSArray arrayWithObjects:
                          _loginField, _passwordField,
                          _passwordConfirmationField,
                          _fullNameField, _ageField,
                          nil];
    for(UITextField * field in _resigneFields)
    {
        [field addTarget:self action:@selector(onShowKeyboard:) forControlEvents:UIControlEventEditingDidBegin];
    }

    if (section == REQUIRED_SECTION) {
        return REQUIERD_HEADER_TITLE;
    }else if (section == OPTIONAL_SECTION)
        return OPTIONAL_HEADER_TITLE;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == REQUIRED_SECTION) {
        if (indexPath.row == AVATAR_ROW) {
            return AVATAR_CELL_HEIGHT;
        }
    }
    return STANDART_CELL_HEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     if (indexPath.section == REQUIRED_SECTION) {
        if (indexPath.row == LOGIN_ROW) {
            static NSString *CellIdentifier = @"Simple Cell";
            
            organizerSimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[organizerSimpleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cell.nameLabel.text = @"Login:";
             _loginField = cell.inputName;
            return cell;
        }else if ((indexPath.row == PASSWORD_ROW) || (indexPath.row == PASSWORD_CONFIRM_ROW))
        {
            static NSString *CellIdentifier = @"Password Cell";
            
            organizerPasswordCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[organizerPasswordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            if (indexPath.row == PASSWORD_ROW) {
                cell.passwordLabel.text = @"Password:";
                _passwordField = cell.passwordField;
            }else
            {
                cell.passwordLabel.text = @"Confirmation:";
                _passwordConfirmationField = cell.passwordField;
            }
            
            cell.passwordField.secureTextEntry = YES;
            cell.passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
            return cell;
        }else if (indexPath.row == AVATAR_ROW)
        {
            static NSString *CellIdentifier = @"Avatar Cell";
            
            organizerAvatarCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[organizerAvatarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            _avatarImage = cell.avatarImage;
            NSLog(@"View %@ Width = %f, radius %f",NSStringFromCGRect(self.avatarImage.frame), self.avatarImage.frame.size.width, self.avatarImage.frame.size.width/2.0);
            cell.avatarImage.layer.cornerRadius = self.avatarImage.frame.size.width/2.0;
            cell.avatarImage.layer.masksToBounds = YES;
            
            [cell.takePhotoButton addTarget:self action:@selector(makeAvatar:) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
    }
    else if (indexPath.section == OPTIONAL_SECTION)
    {
        if (indexPath.row == FULL_NAME_ROW) {
            static NSString *CellIdentifier = @"Simple Cell";
            
            organizerSimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[organizerSimpleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cell.nameLabel.text = @"Full Name:";
            _fullNameField = cell.inputName;
            return cell;
        }else if (indexPath.row == AGE_ROW)
        {
            static NSString *CellIdentifier = @"Simple Cell";
            
            organizerSimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[organizerSimpleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cell.nameLabel.text = @"Age:";
            _ageField = cell.inputName;
            cell.inputName.keyboardType = UIKeyboardTypeDecimalPad;                
            return cell;
        }
    }
    
}


#pragma mark - Table view delegate

-(void) onShowKeyboard:(id)sender
{
    [self.tableView addGestureRecognizer:_keyboardRemover];
}
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    for (UITextField * field in self.resigneFields) {
        [field resignFirstResponder];
    }
    [self.tableView removeGestureRecognizer:_keyboardRemover];
}

- (IBAction)makeRegistration:(UIButton *)sender {
    if ([self testRegistration]) {
        User *newContact = [User userWithLogin:_loginField.text password:_passwordField.text andContext:DELEGATE.managedObjectContext];
        newContact.photo = UIImageJPEGRepresentation(_avatarImage.image, 1.0);
        newContact.fullName = _fullNameField.text;
        newContact.age = [NSDecimalNumber decimalNumberWithString:_ageField.text];
        
        NSError *error;
        [DELEGATE.managedObjectContext save:&error];
        if (error) {
            NSLog(@"Problems with saving");
            [self cancelRegistration:nil];
        }
        else
        {
           [self cancelRegistration:nil];
        }
    }    
}

-(BOOL) testRegistration
{
    NSString * errorMessage = nil;
    if ([_loginField.text isStringEmpty])
        errorMessage = LOGIN_FIELD_IS_EMPTY;
    else if ([_passwordField.text isStringEmpty] || [_passwordConfirmationField.text isStringEmpty])
        errorMessage = PASSWORD_EMPTY;
    else if (![_passwordField.text isEqualToString:_passwordConfirmationField.text])
        errorMessage = PASSWORD_AND_CONFIRMATION;
    else if (_avatarImage == nil)
        errorMessage = AVATAR_EMPTY;
    if (errorMessage) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:APP_NAME message:errorMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return NO;
    }
    return YES;
}
- (IBAction)cancelRegistration:(UIButton *)sender {
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma Take Photo
- (void)makeAvatar:(UIButton *)sender {
    NSLog(@"Make Avatar");
    [_avatarSheet showInView:self.view];      
}

#pragma mark - UIActionSheetDelegate method's
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button index %d", buttonIndex);
    if (buttonIndex == 1) {
        [self showAlbum];
    }
}

-(void)showAlbum
{
    AGImagePickerController *imagePickerController = [[AGImagePickerController alloc] initWithFailureBlock:^(NSError *error) {
        
        if (error == nil)
        {
            NSLog(@"User has cancelled.");
            [self dismissModalViewControllerAnimated:YES];
        } else
        {
            NSLog(@"Error: %@", error);
            
            // Wait for the view controller to show first and hide it after that
            double delayInSeconds = 0.5;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self dismissModalViewControllerAnimated:YES];
            });
        }
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        
    } andSuccessBlock:^(NSArray *info) {
        NSLog(@"Info: %@", info);
        [self dismissModalViewControllerAnimated:YES];
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    }];
    imagePickerController.delegate = self;
    [self presentModalViewController:imagePickerController animated:YES];
}

#pragma mark AGImagePickerDelegate methods
- (void)agImagePickerController:(AGImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    ALAsset * photo = [info objectAtIndex:0];
    UIImage * avatar = [UIImage imageWithCGImage:photo.defaultRepresentation.fullResolutionImage];
    self.avatarImage.image = [avatar needsSize:self.avatarImage.frame.size];
    [self.tableView reloadData];
}
- (void)agImagePickerController:(AGImagePickerController *)picker didFail:(NSError *)error
{
    
}

@end
