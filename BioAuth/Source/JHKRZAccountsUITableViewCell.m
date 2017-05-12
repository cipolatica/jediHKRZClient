//
//  JHKRZAccountsUITableViewCell.m
//  BioAuth
//
//  Created by Alberto Plata on 5/12/17.
//  Copyright © 2017 jediHKRZ. All rights reserved.
//

#import "JHKRZAccountsUITableViewCell.h"

@interface JHKRZAccountsUITableViewCell ()

@property NSDictionary *data;
@property UIView *containerView;

@end

@implementation JHKRZAccountsUITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.containerView = [self createContainerView];
        [self addSubview:self.containerView];
        [self setBackgroundColor:[UIColor clearColor]];
        
    }
    return self;
}

- (UIView *) createContainerView {
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, [UIScreen mainScreen].bounds.size.width-10, 40)];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, 35, [UIScreen mainScreen].bounds.size.width-15, 1)];
    [lineView setBackgroundColor:[UIColor grayColor]];
    
    [containerView addSubview:lineView];
    return containerView;
}

- (void) updateCellWithData:(NSDictionary *)data {
    
    self.data = data;
    
    [self.containerView setBackgroundColor:(UIColor *)[data objectForKey:@"color"]];
    [self updateNameLabel];
}

- (void) updateNameLabel {
    
    if (self.nameLabel) {
        [self.nameLabel removeFromSuperview];
        self.nameLabel = nil;
    }
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 20)];
    [self.nameLabel setText:(NSString *)[self.data objectForKey:@"name"]];
    [self.nameLabel setTextColor:[UIColor whiteColor]];
    [self.containerView addSubview:self.nameLabel];
}

@end
