//
//  JHKRZAccountsUIViewController.m
//  BioAuth
//
//  Created by Alberto Plata on 5/5/17.
//  Copyright © 2017 jediHKRZ. All rights reserved.
//

#import "JHKRZAccountsUIViewController.h"

@interface JHKRZAccountsUIViewController ()
@property id data;

@end

@implementation JHKRZAccountsUIViewController

- (instancetype) initWithData:(id)data {
    if (self = [super init]) {
        self.data = data;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:19/255.0 green:32/255.0 blue:41/255.0 alpha:1]];
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:19/255.0 green:32/255.0 blue:41/255.0 alpha:1]];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
//    self.navigationController.navigationBar.translucent = YES;
    
    self.title = @"Accounts";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(signOutPressed)];
//    [newBackButton setTintColor:[UIColor whiteColor]];
    [self.navigationItem setLeftBarButtonItem:newBackButton];
    
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
//    [imageView setImage:(UIImage *)self.data];
//    [self.view addSubview:imageView];
}

- (void) signOutPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
