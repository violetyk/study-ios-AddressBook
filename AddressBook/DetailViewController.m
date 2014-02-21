//
//  DetailViewController.m
//  AddressBook
//
//  Created by 加賀谷 祐平 on 2014/02/20.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import "DetailViewController.h"
#import "Address.h"

// クラスエクステンション：リンカの柔軟性を保証し、プライベートメソッドの実装漏れを防ぐ仕組み
@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // ビューを(一般にnibから)ロードした後、追加のセットアップ。
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 カスタムsetterを作って、新しいオブジェクトがインスタンス変数にセットされたらビューを更新する処理を加える。
 */
-(void)setAddress:(Address *)newAddress {
    if (_address != newAddress) {
        _address = newAddress;
        [self configureView];
    }
}

-(void)configureView {
//    NSLog(@"unko");
    self.nameLabel.text = self.address.name;
    self.telLabel.text = self.address.tel;
    self.emailLabel.text = self.address.email;
    
    // 登録日をCellに表示してみる
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    [self.createdLabel setText:[formatter stringFromDate:(NSDate *)self.address.created]];
}

@end
