//
//  FirstViewController.m
//  AddressBook
//
//  Created by 加賀谷 祐平 on 2014/02/10.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import "ListViewController.h"
#import "AddViewController.h"
#import "DetailViewController.h"
#import "AddressDataController.h"
#import "Address.h"

//クラスエクステンション
@interface ListViewController ()

@end

@implementation ListViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 一番最初に呼ばれるコールバック
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.addressDataController = [[AddressDataController alloc] init];
}

// 画面表示の度に呼ばれるコールバック
- (void)viewDidLoad
{
    [super viewDidLoad];
    // ビューを(一般にnibから)ロードした後、追加のセットアップ。
    
    /* ナビゲーションアイテムにボタンを置く処理。いらない。
     // Do any additional setup after loading the view, typically from a nib.
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
     
     UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
     self.navigationItem.rightBarButtonItem = addButton;
     */
}


/* 別のメソッドに置き換える部分
 - (void)insertNewObject:(id)sender
 {
 if (!_objects) {
 _objects = [[NSMutableArray alloc] init];
 }
 [_objects insertObject:[NSDate date] atIndex:0];
 NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
 [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
 }
 
 */

#pragma mark - Table View

/*
 UITableViewControllerとして動作させるために実装が必要なメソッド。
 セクションの数を返す。
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/*
 UITableViewControllerとして動作させるために実装が必要なメソッド。
 テーブルの行数を返す。
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.addressDataController count];
}

/*
 indexPathの位置に新しいセルを作ってセルの情報を返す。
 MasterViewControllerとして実装する必要があるメソッド。
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{


    // 引数でもらうindexPath.rowの位置にあるAddressオブジェクトを取得
    Address *address = [self.addressDataController objectAtIndex:indexPath.row];
    
    // ストーリーボード上で、TableViewCell > Attribute Inspector > Identifierで設定する値
    static NSString *CellIdentifier = @"AddressCell";

    // Cellの見てくれを設定
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [[cell textLabel] setText:address.name];
    //[[cell detailTextLabel] setText:address.tel];
    return cell;
}


/*
 指定した項目を編集したい場合はYES;
*/
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}



/*
 AddViewControllerからの巻き戻しセグエ。
 DoneAction
 */
- (IBAction)doneActionForSegue:(UIStoryboardSegue *)segue
{
    NSLog(@"done");
    
    if ([[segue identifier] isEqualToString:@"DoneAction"]) {
        // sourceViewControllerメソッドで、segueから直前のビューを取得する。
        AddViewController *addViewController = [segue sourceViewController];
        if (addViewController.address) {
            [self.addressDataController add:addViewController.address];
            // TableVieWの再描画
            [[self tableView] reloadData];
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

/*
 AddViewControllerからの巻き戻しセグエ。
 CancelAction
 */
- (IBAction)cancelActionForSegue:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelAction"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"DetailAction"]) {
        
        // destinationViewControllerメソッドで、segueの次のビューを取得している
        // （反対はsourceViewController）？
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.address = [self.addressDataController
                                        objectAtIndex:[self.tableView indexPathForSelectedRow].row
                                        ];
    }
}


@end
