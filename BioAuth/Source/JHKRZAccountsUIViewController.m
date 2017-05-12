//
//  JHKRZAccountsUIViewController.m
//  BioAuth
//
//  Created by Alberto Plata on 5/5/17.
//  Copyright © 2017 jediHKRZ. All rights reserved.
//

#import "JHKRZAccountsUIViewController.h"
#import "JHKRZAccountsUITableViewCell.h"

@interface JHKRZAccountsUIViewController ()

@property id data;
@property (nonatomic, strong) NSMutableArray *model;

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
    
    self.title = @"Accounts";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(signOutPressed)];
    [self.navigationItem setLeftBarButtonItem:newBackButton];
    
    self.model = @[
                   @{@"name"            : @"Checking - 1234",
                     @"color"           : [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5],
                     @"balance"         : @"$3,122.25",
                     @"balanceName"     : @"Available Balance"},
                   @{@"name"            : @"Savings - 8008",
                     @"color"           : [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5],
                     @"balance"         : @"$27,873.20",
                     @"balanceName"     : @"Available Balance"},
                   @{@"name"            : @"Visa - 8452",
                     @"color"           : [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5],
                     @"balance"         : @"$1,340.93",
                     @"balanceName"     : @"Current Balance"}];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setTableHeaderView:[self createHeaderImage]];
    [self.tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    [self.view addSubview:self.tableView];
}

- (UIImageView *) createHeaderImage {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, [UIScreen mainScreen].bounds.size.width-30, ([UIScreen mainScreen].bounds.size.width-30)/2)];
    [imageView setImage:[UIImage imageNamed:@"sf"]];
    return imageView;
}

- (void) signOutPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *tableIdentifier = @"TableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:tableIdentifier];
    }
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    [cell.contentView setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.text = [((NSDictionary *)[self.model objectAtIndex:indexPath.row]) objectForKey:@"name"];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    cell.detailTextLabel.text = [((NSDictionary *)[self.model objectAtIndex:indexPath.row]) objectForKey:@"balance"];
    return cell;
}


@end
