//
//  JHKRZAccountsUITableViewCell.h
//  BioAuth
//
//  Created by Alberto Plata on 5/12/17.
//  Copyright © 2017 jediHKRZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHKRZAccountsUITableViewCell : UITableViewCell

@property UILabel *nameLabel;
@property UILabel *balanceLabel;
@property UILabel *balanceNameLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

- (void) updateCellWithData:(NSDictionary *)data;

@end
