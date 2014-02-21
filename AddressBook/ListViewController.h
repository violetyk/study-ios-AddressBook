//
//  FirstViewController.h
//  AddressBook
//
//  Created by 加賀谷 祐平 on 2014/02/10.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddressDataController;

@interface ListViewController : UITableViewController
@property (strong, nonatomic) AddressDataController *addressDataController;

- (IBAction)doneActionForSegue:(UIStoryboardSegue *)segue;
- (IBAction)cancelActionForSegue:(UIStoryboardSegue *)segue;
@end
