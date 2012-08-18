//
//  organizerAvatarCell.m
//  G-Organizer
//
//  Created by Max on 15.08.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import "organizerAvatarCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation organizerAvatarCell
@synthesize avatarImage;
@synthesize takePhotoButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
