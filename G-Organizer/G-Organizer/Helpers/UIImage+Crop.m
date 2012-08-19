//
//  UIImage+Crop.m
//  G-Organizer
//
//  Created by Max on 19.08.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import "UIImage+Crop.h"

@implementation UIImage (Crop)
- (UIImage *)crop:(CGRect)rect {
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *result = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return result;
}
@end
