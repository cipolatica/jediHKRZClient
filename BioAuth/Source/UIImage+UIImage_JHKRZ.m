//
//  UIImage+UIImage_JHKRZ.m
//  Bio Auth Solution
//
//  Created by Alberto Plata on 4/26/17.
//  Copyright © 2017 jediHKRZ. All rights reserved.
//

#import "UIImage+UIImage_JHKRZ.h"

static CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};

@implementation UIImage (UIImage_JHKRZ)

- (UIImage*) tintedImageWithColor:(UIColor *)tintColor {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    // draw alpha-mask
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextDrawImage(context, rect, self.CGImage);
    
    // draw tint color, preserving alpha values of original image
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    CGContextSetFillColorWithColor(context, tintColor.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *coloredImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return coloredImage;
}

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees
{
    // calculate the size of the rotated view's containing box for our drawing space
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
    CGAffineTransform t = CGAffineTransformMakeRotation(DegreesToRadians(degrees));
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
    
    // Create the bitmap context
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
    // Move the origin to the middle of the image so we will rotate and scale around the center.
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    
    //   // Rotate the image context
    CGContextRotateCTM(bitmap, DegreesToRadians(degrees));
    
    // Now, draw the rotated/scaled image into the context
    CGContextScaleCTM(bitmap, 1.0, -1.0f);
    CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}

+ (UIImage *)currentScreenImage {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions([UIScreen mainScreen].bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    
    for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
        [window.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *screenshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenshotImage;
}

// Returns a gray scaled copy of the image
- (UIImage *)grayScaleImage {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // Draw a white background
    CGContextSetRGBFillColor(ctx, 1.0f, 1.0f, 1.0f, 1.0f);
    CGContextFillRect(ctx, imageRect);
    
    // Draw the luminosity on top of the white background to get grayscale
    [self drawInRect:imageRect blendMode:kCGBlendModeLuminosity alpha:1.0f];
    
    // Apply the source image's alpha
    [self drawInRect:imageRect blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    
    UIImage* grayscaleImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return grayscaleImage;
}


// Returns a copy of this image that is sized to match the given width
- (UIImage *)imageScaledToWidth:(CGFloat)width {
    CGFloat oldWidth = self.size.width;
    CGFloat scaleFactor = width / oldWidth;
    
    CGFloat newHeight = self.size.height * scaleFactor;
    CGFloat newWidth = oldWidth * scaleFactor;
    
    return [self imageWithSize:CGSizeMake(newWidth, newHeight) andInterpolationQuality:kCGInterpolationDefault];
}

// Returns a copy of this image that is sized to match the given width using specified interpolationQuality
- (UIImage *)imageScaledToWidth:(CGFloat)width andInterpolationQuality:(CGInterpolationQuality)interpolationQuality {
    CGFloat oldWidth = self.size.width;
    CGFloat scaleFactor = width / oldWidth;
    
    CGFloat newHeight = self.size.height * scaleFactor;
    CGFloat newWidth = oldWidth * scaleFactor;
    
    return [self imageWithSize:CGSizeMake(newWidth, newHeight) andInterpolationQuality:interpolationQuality];
}

#pragma mark - Private methods
// Returns a copy of the image using specified interpolationQuality
- (UIImage *)imageWithSize:(CGSize)newSize andInterpolationQuality:(CGInterpolationQuality)interpolationQuality {
    CGRect newRect = CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height));
    CGImageRef imageRef = self.CGImage;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef bitmap = CGBitmapContextCreate(
                                                NULL,
                                                newRect.size.width,
                                                newRect.size.height,
                                                8, /* bits per channel */
                                                0,
                                                colorSpace,
                                                (CGBitmapInfo) kCGImageAlphaPremultipliedLast
                                                );
    CGColorSpaceRelease(colorSpace);
    
    // Set the quality level to use when rescaling
    CGContextSetInterpolationQuality(bitmap, interpolationQuality);
    
    // Draw into the context; this scales the image
    CGContextDrawImage(bitmap, newRect, imageRef);
    
    // Get the resized image from the context and a UIImage
    CGImageRef newImageRef = CGBitmapContextCreateImage(bitmap);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:self.scale orientation:UIImageOrientationUp];
    
    // Clean up
    CGContextRelease(bitmap);
    CGImageRelease(newImageRef);
    
    return newImage;
}

@end
