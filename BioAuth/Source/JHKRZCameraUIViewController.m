//
//  JHKRZCameraUIViewController.m
//  BioAuth
//
//  Created by Alberto Plata on 5/1/17.
//  Copyright © 2017 jediHKRZ. All rights reserved.
//

#import "JHKRZCameraUIViewController.h"
#import "JHKRZAccountsUIViewController.h"

@interface JHKRZCameraUIViewController ()

@property UIView *spinnerView;
@property UIActivityIndicatorView *spinner;

@end

@implementation JHKRZCameraUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-20)];
    [self.navigationController setNavigationBarHidden:NO];
    [self.view setBackgroundColor:[UIColor greenColor]];
    [self setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self setCameraDevice:UIImagePickerControllerCameraDeviceFront];
    [self setDelegate:self];
    // Do any additional setup after loading the view.
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSLog(@"info: %@ ",info);
    
    for (NSString *str in [info allKeys]) {
        NSLog(@"str: %@",str);
    }
//    [self.navigationController pushViewController:[JHKRZAccountsUIViewController new] animated:NO];
//    [self.myDelegate viewControllerDismissedWithData:[info objectForKey:@"UIImagePickerControllerOriginalImage"]];
//    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController dismissViewControllerAnimated:NO completion:nil];
//
//    [self.navigationController pushViewController:[JHKRZAccountsUIViewController new] animated:NO];
    
//    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleProminent];
//    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    blurEffectView.frame = self.view.bounds;
//    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    
    self.spinnerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.spinnerView setBackgroundColor:[UIColor blackColor]];
    [self.spinnerView setAlpha:0.7];
    
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.spinner setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2)];
    [self.spinnerView addSubview:self.spinner];
    [self.view addSubview:self.spinnerView];
    [self.spinner startAnimating];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *picture = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
            UIImage *flippedImage = [UIImage imageWithCGImage:picture.CGImage scale:picture.scale orientation:UIImageOrientationLeftMirrored];
            [self.myDelegate viewControllerDismissedWithData:flippedImage];
            [self dismissViewControllerAnimated:YES completion:nil];
        });
    });

    
}
@end
