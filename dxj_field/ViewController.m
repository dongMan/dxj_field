//
//  ViewController.m
//  dxj_field
//
//  Created by 董雪娇 on 2017/6/26.
//  Copyright © 2017年 董雪娇. All rights reserved.
//

#import "ViewController.h"
#import "DTextView.h"
#import "DTextField.h"
@interface ViewController ()
@property (nonatomic,strong)DTextField * field;
@property (nonatomic,strong)DTextView * textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setField];
    [self setTextView];
}

- (void)setField {
    _field = [[DTextField alloc]init];
    _field.frame = CGRectMake(50, 100, 300, 30);
    _field.dx_holderFont = 15;
    _field.dx_holderColor = @"999999";
    _field.dx_holder = @"测试一下！";
    _field.dx_leftViewImg = @"搜索灰色";
    _field.dx_borderColor = @"ff0000";
    _field.dx_radius = 5;
    //最大字数100
    _field.dx_limitMaxNumber = 10;
    //整数型
    _field.dx_textType = D_Text_Interger;
    //编辑结束
    _field.dx_endEditing = ^{
    
    };
    //编辑开始
    _field.dx_begainEditing = ^{
    
    };
    //内容变化监测
    _field.dx_textBlock = ^(NSString * text){
    
    };
    //inputAccessoryView 点击确定
    _field.dx_sureBlock = ^(BOOL sure){
    
    };

    [self.view addSubview:_field];
}

- (void)setTextView{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
