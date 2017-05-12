//
//  JHKRZAccountsUIViewController.h
//  BioAuth
//
//  Created by Alberto Plata on 5/5/17.
//  Copyright © 2017 jediHKRZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHKRZAccountsUIViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) UITableView *tableView;

- (instancetype) initWithData:(id)data;

@end
