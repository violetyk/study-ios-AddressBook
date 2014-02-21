//
//  AddViewController.m
//  AddressBook
//
//  Created by 加賀谷 祐平 on 2014/02/12.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import "AddViewController.h"
#import "Address.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"DoneAction"]) {
        if (
            [self.NameInput.text length] ||
            [self.TelInput.text length] ||
            [self.EmailInput.text length]
            ) {
            
            Address *a;
            a = [[Address alloc] initAddress:self.NameInput.text
                                            :self.TelInput.text
                                            :self.EmailInput.text
                                            :[NSURL URLWithString:@"http://nanapi.jp"]
                 ];
            self.address = a;
        }
    }
}
/*
 テキストフィールドのデリゲートメソッドの実装。
 テキスト入力エリアでエンターを押したときに、キーボードが消えるようにする
 =ファーストレスポンダの状態を無効にする
 ファーストレスポンダとは、フォーカスが当たっているGUI部品のこと。
 そして、タッチ以外のイベントを最初に受け取るオブジェクト。
*/
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.TelInput
        || textField == self.NameInput
        || textField == self.EmailInput) {
        [textField resignFirstResponder];
    }
    return YES;
}


@end