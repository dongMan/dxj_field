//
//  DTextView.m
//  ios2688supply
//
//  Created by dong on 2017/5/5.
//  Copyright © 2017年 2688. All rights reserved.
//

#import "DTextView.h"
#import "ToolBar.h"
#import "NSObject+PublicCategory.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface DTextView ()<UITextViewDelegate>
@property (nonatomic,strong) toolBar * bar;
@property (nonatomic,strong) UILabel * holder;
@end

@implementation DTextView
- (instancetype)init{
    self = [super init];
    if (self) {
        [self initConfig];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfig];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initConfig];
    }
    return self;
}

- (void)initConfig {
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    self.backgroundColor = [UIColor whiteColor];
    self.returnKeyType = UIReturnKeyDone;
    self.font = [UIFont systemFontOfSize:13];
    self.textColor = [@"333333" getColor];
    self.delegate = self;
    self.textContainerInset = UIEdgeInsetsMake(10, 7, 10, 7);
    
    self.dx_holderFont = 13;
    self.dx_holderColor = @"999999";
    self.dx_limitMaxNumber = 0;
    self.dx_hidenCancelBtn = YES;
    self.dx_addInputView = YES;
    self.dx_canInput = YES;
}

- (void)setDx_holderFont:(NSInteger)dx_holderFont{
    _dx_holderFont = dx_holderFont;
}

- (void)setDx_holderColor:(NSString *)dx_holderColor{
    _dx_holderColor = dx_holderColor;
}

- (void)setDx_holder:(NSString *)dx_holder{
    _dx_holder = dx_holder;
    [self addSubview:self.holder];
    self.holder.text = dx_holder;
}

- (UILabel *)holder{
    if (!_holder) {
        _holder = [[UILabel alloc]initWithFrame:CGRectMake(13, 10, self.width-15, 15)];
        _holder.font = [UIFont systemFontOfSize:_dx_holderFont];
        _holder.textColor = [_dx_holderColor getColor];
    }
    return _holder;
}

- (void)setDx_limitMaxNumber:(int)dx_limitMaxNumber{
    _dx_limitMaxNumber = dx_limitMaxNumber;
    self.textContainerInset = UIEdgeInsetsMake(10, 7, 15, 7);
}

- (void)setDx_addInputView:(BOOL)dx_addInputView{
    if (dx_addInputView) {
        _dx_addInputView = dx_addInputView;
        _bar = [[toolBar alloc]init];
        WS(weakSelf);
        _bar.barBlock = ^(BOOL sureBtnClicked){
            [weakSelf clickedWithSureBtn:sureBtnClicked];
        };
        _bar.hidenCancelBtn = _dx_hidenCancelBtn;
        self.inputAccessoryView = _bar;
    }else{
        self.inputAccessoryView = nil;
    }
}

- (void)setDx_canInput:(BOOL)dx_canInput{
    _dx_canInput = dx_canInput;
}

- (void)setDx_text:(NSString *)dx_text{
    _dx_text = dx_text;
    self.text = dx_text;
    [self textChanged];
}

- (void)setDx_hidenCancelBtn:(BOOL)dx_hidenCancelBtn{
    _dx_hidenCancelBtn = dx_hidenCancelBtn;
    _bar.hidenCancelBtn = dx_hidenCancelBtn;
}

- (void)clickedWithSureBtn:(BOOL)sure{
    [self resignFirstResponder];
    if (self.dx_sureBlock) {
#pragma mark 点击return 确定按钮
        if (sure) {
            self.dx_sureBlock(YES);
        }else{
#pragma mark 点击return 取消按钮
            self.dx_sureBlock(NO);
        }
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (_dx_holder) {
        if(![text isEqualToString:@""])
        {
            [_holder setHidden:YES];
        }
        if ([text isEqualToString:@""] && range.location == 0 && range.length == 1)
        {
            _holder.hidden = NO;
        }
        
    }
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    if (self.dx_textBlock) {
        self.dx_textBlock(textView.text);
    }
}
- (void)textViewDidChange:(UITextView *)textView
{
    [self textChanged];
    /*
     当前高度
    CGSize size=[self boundingRectWithSize:CGSizeMake(textView.width, MAXFLOAT) font:[UIFont systemFontOfSize:24] text:textView.text];
    if (size.height>24) {
        self.height=size.height+25;
    }
     */
}

- (void)textChanged{
    if (_dx_holder) {
        if (self.text.length == 0) {
            _holder.hidden = NO;
        }else
        {
            _holder.hidden = YES;
        }
    }
    if (_dx_limitMaxNumber > 0) {
        NSInteger a = [self.text length];
        //        NSUInteger len = 0;
        if (a <= _dx_limitMaxNumber) {
            //            len = self.text.length;
        }else if (a > _dx_limitMaxNumber) {
            self.text = [self.text substringToIndex:_dx_limitMaxNumber];
        }
    }
    
    if (self.dx_textBlock) {
        self.dx_textBlock(self.text);
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return _dx_canInput;
}
@end
