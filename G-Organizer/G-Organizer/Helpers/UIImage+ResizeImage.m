//
//  UIImage+ResizeImage.m
//  G-Organizer
//
//  Created by Max on 19.08.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import "UIImage+ResizeImage.h"
#import "UIImage+Crop.h"

@implementation UIImage (ResizeImage)
- (UIImage *)needsSize:(CGSize)newSize
{
    CGRect correctRect ;
    if (self.size.width > self.size.height) {
        CGFloat diff = (self.size.width - self.size.height)/2;
        correctRect = CGRectMake(diff, 0, self.size.height, self.size.height);
    }
    else if (self.size.height >= self.size.width ){
        CGFloat diff = (self.size.height - self.size.width )/2;
        correctRect = CGRectMake(0, diff, self.size.width, self.size.width);
    }
    UIImage *correctedImage = [self crop:correctRect];
    return correctedImage;
}
@end
