//
//  DTextField.m
//  ios2688shop
//
//  Created by dong on 17/4/25.
//  Copyright © 2017年 2688. All rights reserved.
//

#import "DTextField.h"
#import "toolBar.h"
#import "NSObject+PublicCategory.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface DTextField ()<UITextFieldDelegate>
@property (nonatomic,strong) toolBar * bar;
@end

@implementation DTextField

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
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    self.backgroundColor = [UIColor whiteColor];
    self.returnKeyType = UIReturnKeyDone;
    self.font = [UIFont systemFontOfSize:13];
    self.textColor = [@"333333" getColor];
    self.delegate = self;
    [self addTarget:self action:@selector(fieldTextChanged:) forControlEvents:UIControlEventEditingChanged];
    
    UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, self.height)];
    self.leftView = leftView;
//    self.leftView.x = 6;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.dx_openBorder = YES;
    self.dx_borderColor = @"d4d4d4";
    self.dx_holderFont = 12;
    self.dx_holderColor = @"c1c1c1";
    self.dx_limitMaxNumber = 0;
    self.dx_textType = D_Text_Default;
    self.dx_hidenCancelBtn = YES;
    self.dx_addInputView = YES;
    self.dx_keyBoard = D_KeyBoard_Default;
    self.dx_canInput = YES;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
}

//- (CGRect)leftViewRectForBounds:(CGRect)bounds
//{
//    CGRect iconRect = [super leftViewRectForBounds:bounds];
//    iconRect.origin.x += 6; //像右边偏15
//    return iconRect;
//}

//UITextField 文字与输入框的距离
//- (CGRect)textRectForBounds:(CGRect)bounds{
//    
//    return CGRectInset(bounds, 45, 0);
//    
//}

//控制文本的位置
//- (CGRect)editingRectForBounds:(CGRect)bounds{
//    
//    return CGRectInset(bounds, 45, 0);
//}

- (void)setDx_leftViewImg:(NSString *)dx_leftViewImg{
    _dx_leftViewImg = dx_leftViewImg;
    [self.leftView removeFromSuperview];
    UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    UIImageView * img = [[UIImageView alloc]initWithFrame:leftView.bounds];
    img.image = [UIImage imageNamed:dx_leftViewImg];
    img.centerY = leftView.centerY;

    img.contentMode = UIViewContentModeCenter;
    [leftView addSubview:img];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setDx_holderFont:(NSInteger)dx_holderFont{
    _dx_holderFont = dx_holderFont;
}

- (void)setDx_holderColor:(NSString *)dx_holderColor{
    _dx_holderColor = dx_holderColor;
}

- (void)setDx_holder:(NSString *)dx_holder{
    _dx_holder = dx_holder;
    self.placeholder = dx_holder;
    if (self.placeholder.length>0) {
        NSMutableParagraphStyle *style = [self.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
        style.minimumLineHeight = self.font.lineHeight - (self.font.lineHeight - [UIFont systemFontOfSize:_dx_holderFont].lineHeight) / 2.0;
        self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:[_dx_holderColor getColor],NSFontAttributeName:[UIFont systemFontOfSize:_dx_holderFont],NSParagraphStyleAttributeName:style}];
    }
}

- (void)setDx_openBorder:(BOOL)dx_openBorder{
    _dx_openBorder = dx_openBorder;
    if (dx_openBorder) {
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [[_dx_borderColor getColor]CGColor];
    }else{
        self.layer.borderColor = [[UIColor clearColor]CGColor];
    }
}

- (void)setDx_borderColor:(NSString *)dx_borderColor{
    _dx_borderColor = dx_borderColor;
    self.layer.borderColor = [[dx_borderColor getColor]CGColor];
}

- (void)setDx_radius:(CGFloat)dx_radius{
    _dx_radius = dx_radius;
    self.layer.cornerRadius = dx_radius;
    self.layer.masksToBounds = YES;
}

//- (void)setDx_limitMinNumber:(int)dx_limitMinNumber{
//    _dx_limitMinNumber = dx_limitMinNumber;
//}
- (void)setDx_limitMaxNumber:(int)dx_limitMaxNumber{
    _dx_limitMaxNumber = dx_limitMaxNumber;
}

- (void)setDx_autoResignResponder:(BOOL)dx_autoResignResponder{
    _dx_autoResignResponder = dx_autoResignResponder;
}

- (void)setDx_secureEntry:(BOOL)dx_secureEntry{
    _dx_secureEntry = dx_secureEntry;
    self.secureTextEntry = dx_secureEntry;
}

- (void)setDx_canInput:(BOOL)dx_canInput{
    _dx_canInput = dx_canInput;
}
- (void)setDx_textType:(D_ENTER_TYPE)dx_textType{
    _dx_textType = dx_textType;
}

- (void)setDx_keyBoard:(D_KeyBoardType)dx_keyBoard{
    _dx_keyBoard = dx_keyBoard;
    switch (dx_keyBoard) {
        case D_KeyBoard_Default:
        {
            self.keyboardType = UIKeyboardTypeDefault;
            break;
        }
        case D_KeyBoard_Number:{
            self.keyboardType = UIKeyboardTypeNumberPad;
            break;
        }
        case D_KeyBoard_Point:{
            self.keyboardType = UIKeyboardTypeDecimalPad;
            break;
        }
        default:
            break;
    }
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

- (void)setDx_hidenCancelBtn:(BOOL)dx_hidenCancelBtn{
    _dx_hidenCancelBtn = dx_hidenCancelBtn;
    _bar.hidenCancelBtn = dx_hidenCancelBtn;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return _dx_canInput;
}

- (void)fieldTextChanged:(UITextField *)textField {
    if (_dx_limitMaxNumber>0) {
        if (textField.text.length >= _dx_limitMaxNumber) {
            textField.text = [textField.text substringToIndex:_dx_limitMaxNumber];
            if (_dx_autoResignResponder) {
                [self clickedWithSureBtn:YES];
            }
        }
    }
    if (self.dx_textBlock) {
        self.dx_textBlock(textField.text);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self clickedWithSureBtn:YES];
    return YES;
}

- (void)clickedWithSureBtn:(BOOL)sure{
    if (self.dx_sureBlock) {
#pragma mark 点击return 确定按钮
        if (sure) {
            self.dx_sureBlock(YES);
        }else{
#pragma mark 点击return 取消按钮
            self.dx_sureBlock(NO);
        }
    }
    [self resignFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (_dx_textType == D_Text_Interger || _dx_textType == D_Text_Point) {
        return [self validateNumber:string filed:self];
    }else{
        return YES;
    }
}

- (BOOL)validateNumber:(NSString*)number filed:(UITextField *)textField{
    BOOL exitPoint = NO;
    BOOL res = YES;
    
    NSString * point = @"";
    if (_dx_textType == D_Text_Interger) {
        point = @"0123456789";
    }else if (_dx_textType == D_Text_Point){
        point = @"0123456789.";
    }
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:point];
    int i = 0;
    while (i < number.length) {
        //不合法的字符
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        if (_dx_textType == D_Text_Interger) {
            //第一个字符是0，以后的字符不能是123456789
            if (textField.text.length>0) {
                NSString*subString=[textField.text substringWithRange:NSMakeRange(0, 1)];
                if ([subString isEqualToString:@"0"]) {
                    NSCharacterSet* subSet = [NSCharacterSet characterSetWithCharactersInString:@"123456789"];
                    NSRange subRange = [number rangeOfCharacterFromSet:subSet];
                    if (subRange.length != 0) {
                        res = NO;
                        break;
                    }
                }
            }
        }else if (_dx_textType == D_Text_Point){
            //第一个字符不能是小数点
            if ((textField.text.length==0)&&([string isEqualToString:@"."])) {
                res=NO;
                break;
            }
            //只能有一个小数点
            if ([string isEqualToString:@"."]) {
                exitPoint = YES;
                NSString * str =textField.text;
                NSRange range = [str rangeOfString:@"."];
                if (range.length>0) {
                    res = NO;
                    break;
                }
            }
            //小数点后两位
            NSRange rangePoint = [textField.text rangeOfString:@"."];
            if (rangePoint.length>0) {
                NSString * point = [[textField.text componentsSeparatedByString:@"."]lastObject];
                if (point.length>=2) {
                    res = NO;
                    break;
                }
            }
        }

        i++;
    }
    return res;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.dx_endEditing) {
        self.dx_endEditing();
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (self.dx_begainEditing) {
        self.dx_begainEditing();
    }
}
@end
