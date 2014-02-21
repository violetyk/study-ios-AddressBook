//
//  AddressDataController.m
//  AddressBook
//
//  Created by 加賀谷 祐平 on 2014/01/29.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import "AddressDataController.h"
#import "Address.h"

@implementation AddressDataController

-(id)init {
    if (self = [super init]) {
        [self initializeData];
        return self;
    }
    return nil;
}

-(void)initializeData {
    self.list = [[NSMutableArray alloc] init];
 
//
//    NSString * title = @"タイトル";
//    NSURL *url = [NSURL URLWithString:@"http://nanapi.jp"];
//    NSString *description = @"本文";
//    NSDate *today = [NSDate date];
//
//    Entry *entry;
//    entry = [[Entry alloc] initEntry:title リンクだよ:url 本文かも:description 公開日:today];
//    [self add:entry];
    /*
    BirdSighting *sighting;
    NSDate *today = [NSDate date];
    sighting = [[BirdSighting alloc] initWithName:@"Pigeon"
                                         location:@"Everywhere" date:today];
    [self addBirdSightingWithSighting:sighting];
     */
}

//インスタンス変数のセッターをオーバーライド
- (void)setList:(NSMutableArray *)list {
    if (_list != list) {
        _list = [list mutableCopy];
    }
}

-(void)add:(Address *)address {
    [self.list addObject:address];
}

-(NSUInteger)count {
    return [self.list count];
}

-(Address *)objectAtIndex:(NSUInteger)index {
    return [self.list objectAtIndex:index];
}


@end
