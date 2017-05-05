//
//  JHKRZCameraUIViewController.h
//  BioAuth
//
//  Created by Alberto Plata on 5/1/17.
//  Copyright © 2017 jediHKRZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JHKRZCameraUIViewControllerDelegate <NSObject>

- (void) viewControllerDismissedWithData:(id)data;

@end

@interface JHKRZCameraUIViewController : UIImagePickerController <UIImagePickerControllerDelegate>

@property(nonatomic, strong) id <JHKRZCameraUIViewControllerDelegate> myDelegate;

@end
