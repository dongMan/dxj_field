//
//  toolBar.m
//  ios2688webshop
//
//  Created by dong on 16/10/14.
//  Copyright © 2016年 zhangzl. All rights reserved.
//

#import "toolBar.h"
#import "NSObject+PublicCategory.h"
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)

@interface toolBar ()
//@property (nonatomic,strong)UIBarButtonItem *cancelItem;
@property (nonatomic,strong)UIBarButtonItem *spaceItem;
@property (nonatomic,strong)UIBarButtonItem *doneItem;


@end
@implementation toolBar

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.bounds = CGRectMake(0, 0, ScreenWidth, 44);
//        _cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
//        _cancelItem.tintColor = [color6_6 getColor];
        _spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        _doneItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(done)];
        _doneItem.tintColor = [@"333333" getColor];
        [self setItems:[NSArray arrayWithObjects:_spaceItem,_doneItem, nil]];
    }
    return self;
}

- (void)setHidenCancelBtn:(BOOL)hidenCancelBtn{
    if (hidenCancelBtn) {
        [self setItems:[NSArray arrayWithObjects:_spaceItem,_doneItem, nil]];
    }
}

- (void)cancel {
    if (self.barBlock) {
        self.barBlock(false);
    }
}

- (void)done {
    if (self.barBlock) {
        self.barBlock(true);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
