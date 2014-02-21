//
//  AddressDataController.h
//  AddressBook
//
//  Created by 加賀谷 祐平 on 2014/01/29.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//


#import <Foundation/Foundation.h>

// 前方宣言。コンパイラにクラスがある旨、約束している
@class Address;

/*
 以下の機能が必要（要は配列）
 - Addressオブジェクトの集合を配列で管理する機能
 - 特定の位置のAddressオブジェクトを返す機能
 - Addressの追加
 */
@interface AddressDataController : NSObject

@property (nonatomic, copy) NSMutableArray *list;
- (void)initializeData;
- (NSUInteger)count;
- (Address *)objectAtIndex:(NSUInteger)index;
- (void)add:(Address *)address;
@end
