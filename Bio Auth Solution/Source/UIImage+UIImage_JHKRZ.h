//
//  UIImage+UIImage_JHKRZ.h
//  Bio Auth Solution
//
//  Created by Alberto Plata on 4/26/17.
//  Copyright © 2017 jediHKRZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImage_JHKRZ)

/**
 * Will modify the images color to be of the specified tinted color.
 */
- (UIImage *)tintedImageWithColor:(UIColor *)tintColor;

/**
 * Rotates an the specified number of degrees then returns that image
 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

/**
 * Returns an image representing whatever is currently displayed on the device's screen.
 */
+ (UIImage *)currentScreenImage;

/**
 * Scales the image at the specified with
 */
- (UIImage *)imageScaledToWidth:(CGFloat)width;

/**
 * Scales the image at the specified with and interpolates it using specified interpolationQuality
 */
- (UIImage *)imageScaledToWidth:(CGFloat)width andInterpolationQuality:(CGInterpolationQuality)interpolationQuality;

/**
 * Returns an gray scale version of the image
 */
- (UIImage *)grayScaleImage;
@end
