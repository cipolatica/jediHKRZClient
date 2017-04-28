//
//  JHKRZSignOnUIViewController.m
//  Bio Auth Solution
//
//  Created by Alberto Plata on 4/25/17.
//  Copyright © 2017 jediHKRZ. All rights reserved.
//

#import "JHKRZSignOnUIViewController.h"
#import "UIImage+UIImage_JHKRZ.h"

@interface JHKRZSignOnUIViewController ()

@end

@implementation JHKRZSignOnUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:19/255.0 green:32/255.0 blue:41/255.0 alpha:1]];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat yCenter = 160.0;
    CGFloat radius = 35;
    UIColor *color = [UIColor colorWithRed:0/255.0 green:252/255.0 blue:252/255.0 alpha:1];
    
    [self addCircleWithCenter:CGPointMake(width/2, yCenter - radius) color:color alpha:0.8];
    [self addCircleWithCenter:CGPointMake((width/2)-(radius*0.951), yCenter - (radius*0.309)) color:color alpha:0.8];
    [self addCircleWithCenter:CGPointMake((width/2)+(radius*0.951), yCenter - (radius*0.309)) color:color alpha:0.8];
    [self addCircleWithCenter:CGPointMake((width/2)-(radius*0.588), yCenter + (radius*0.809)) color:color alpha:0.8];
    [self addCircleWithCenter:CGPointMake((width/2)+(radius*0.588), yCenter + (radius*0.809)) color:color alpha:0.8];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 230, [UIScreen mainScreen].bounds.size.width, 50)];
    [nameLabel setFont:[UIFont fontWithName:@"Thonburi-Light" size:24]];
    [nameLabel setText:@"#jediHKRZ"];
    [nameLabel setTextColor:[UIColor whiteColor]];
    [nameLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:nameLabel];
    
    
    CGFloat height = 45;
    UITextField *textField = [self createTextFieldWithFrame:CGRectMake(75, 350, width-150, height)];
    [textField setPlaceholder:@"Username"];
    [self.view addSubview:textField];
    
    UITextField *textField2 = [self createTextFieldWithFrame:CGRectMake(75, 425, width-150, height)];
    [textField2 setPlaceholder:@"Password"];
    textField2.secureTextEntry = YES;
    [self.view addSubview:textField2];
    
    UIButton *signOnButton = [self createSignOnButtonWithFrame:CGRectMake(75, 500, width-150, height)];
    [signOnButton addTarget:self action:@selector(signOnTapped) forControlEvents:UIControlEventTouchUpInside];
    [signOnButton setTitle:@"Sign On" forState:UIControlStateNormal];
    [self.view addSubview:signOnButton];
    
    CGFloat imageInset = 9.5;
    UIColor *imageColor = [UIColor colorWithRed:0/255.0 green:252/255.0 blue:252/255.0 alpha:1];
    UIButton *b1 = [self createBioButtonWithFrame:CGRectMake(75, 575, height-1, height-1)];
    [b1 setImage:[[UIImage imageNamed:@"voice"] tintedImageWithColor:imageColor] forState:UIControlStateNormal];
    b1.imageEdgeInsets = UIEdgeInsetsMake(imageInset, imageInset, imageInset, imageInset);
    [self.view addSubview:b1];
    
    UIButton *b2 = [self createBioButtonWithFrame:CGRectMake(width/2 -22.5, 575, height-1, height-1)];
    [b2 setImage:[[UIImage imageNamed:@"fingerprint"] tintedImageWithColor:imageColor] forState:UIControlStateNormal];
    b2.imageEdgeInsets = UIEdgeInsetsMake(imageInset, imageInset, imageInset, imageInset);
    [self.view addSubview:b2];
    
    UIButton *b3 = [self createBioButtonWithFrame:CGRectMake(width-(75 + height), 575, height-1, height-1)];
    [b3 setImage:[[UIImage imageNamed:@"selfie"] tintedImageWithColor:imageColor] forState:UIControlStateNormal];
    b3.imageEdgeInsets = UIEdgeInsetsMake(imageInset, imageInset, imageInset, imageInset);
    [self.view addSubview:b3];
}

- (void) signOnTapped {
    
}

- (UITextField *) createTextFieldWithFrame:(CGRect)frame {
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.layer.cornerRadius = frame.size.height/2.0;
    [textField setBackgroundColor:[UIColor whiteColor]];
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.textAlignment = NSTextAlignmentCenter;
    
    return textField;
}

- (UIButton *) createBioButtonWithFrame:(CGRect)frame {
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.layer.cornerRadius = frame.size.height/2.0;
    button.layer.borderWidth = 1;
    [button.layer setBorderColor:[UIColor whiteColor].CGColor];
    
    return button;
}

- (UIButton *) createSignOnButtonWithFrame:(CGRect)frame {
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.layer.cornerRadius = frame.size.height/2.0;
    [button setBackgroundColor:[UIColor whiteColor]];
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = button.layer.bounds;
    
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[UIColor colorWithRed:111/255.0 green:218/255.0 blue:156/255.0 alpha:1].CGColor,
                            (id)[UIColor colorWithRed:86/255.0 green:196/255.0 blue:237/255.0 alpha:1].CGColor,
                            nil];
    
    gradientLayer.locations = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0f],
                               [NSNumber numberWithFloat:1.0f],
                               nil];
    
    gradientLayer.cornerRadius = button.layer.cornerRadius;
    [button.layer addSublayer:gradientLayer];
    
    return button;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addCircleWithCenter:(CGPoint)center color:(UIColor *)color alpha:(CGFloat)alpha {
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat size = 70;
    UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(width/2-100, 160, size, size)];
    circle.layer.cornerRadius = size/2.0;
    circle.layer.masksToBounds = YES;
    circle.center = center;
    [circle setBackgroundColor:color];
    [circle setAlpha:alpha];
    [self.view addSubview:circle];
}

@end
