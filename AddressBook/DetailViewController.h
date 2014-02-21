//
//  DetailViewController.h
//  AddressBook
//
//  Created by 加賀谷 祐平 on 2014/02/20.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Address;

@interface DetailViewController : UITableViewController

@property (strong, nonatomic) Address *address;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdLabel;

@end
