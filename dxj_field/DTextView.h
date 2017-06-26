//
//  DTextView.h
//  ios2688supply
//
//  Created by dong on 2017/5/5.
//  Copyright © 2017年 2688. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ClickedSureBtn)(BOOL sure);
typedef void (^CurrentText)(NSString * text);
@interface DTextView : UITextView

/**设置holderFont 要在holer之前设置才有效 默认12*/
@property (nonatomic,assign)NSInteger dx_holderFont;
/**设置holderColor 要在holer之前设置才有效 默认c1c1c1*/
@property (nonatomic,copy)NSString * dx_holderColor;

@property (nonatomic,copy)NSString * dx_holder;

@property (nonatomic,copy)NSString * dx_text;

/**inputAccessoryView 默认添加*/
@property (nonatomic,assign)BOOL dx_addInputView;

/**是否隐藏inputAccessoryView上的取消按钮 默认YES 隐藏*/
@property (nonatomic,assign)BOOL dx_hidenCancelBtn;

/**长度最大限制 默认无限制number = 0*/
@property (nonatomic,assign)int dx_limitMaxNumber;

@property (nonatomic,assign)BOOL dx_canInput;

/**点击确定按钮回调*/
@property (nonatomic,copy)ClickedSureBtn dx_sureBlock;

/**实时回调当前text内容*/
@property (nonatomic,copy)CurrentText dx_textBlock;

@end
