//
//  AddViewController.h
//  AddressBook
//
//  Created by 加賀谷 祐平 on 2014/02/12.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Address;

/*
 ストーリーボード＞テキストフィールドをシーンドックにCtrl＋ドラッグしてOutletのdelegateして、
 TextFieldDelegateプロトコルを採用する。
*/
@interface AddViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *NameInput;
@property (weak, nonatomic) IBOutlet UITextField *TelInput;
@property (weak, nonatomic) IBOutlet UITextField *EmailInput;
@property (strong, nonatomic) Address *address;
@end
