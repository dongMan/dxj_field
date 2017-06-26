//
//  DTextField.h
//  ios2688shop
//
//  Created by dong on 17/4/25.
//  Copyright © 2017年 2688. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ClickedSureBtn)(BOOL sure);
typedef void (^CurrentText)(NSString * text);
typedef void (^CurrentIsEndEditing)(void);
typedef void (^CurrentIsBegainEditing)(void);
typedef enum : NSUInteger {
    D_Text_Default,
    D_Text_Interger,//整数型
    D_Text_Point,//小数点后两位
} D_ENTER_TYPE;

typedef enum : NSUInteger {
    D_KeyBoard_Default,
    D_KeyBoard_Number,//只有数字
    D_KeyBoard_Point,//只有数字和小数点
} D_KeyBoardType;

@interface DTextField : UITextField
/**设置holderFont 要在holer之前设置才有效 默认12*/
@property (nonatomic,assign)NSInteger dx_holderFont;
/**设置holderColor 要在holer之前设置才有效 默认c1c1c1*/
@property (nonatomic,copy)NSString * dx_holderColor;

@property (nonatomic,copy)NSString * dx_holder;
/**默认无*/
@property (nonatomic,strong)NSString * dx_leftViewImg;
/**默认开启边框*/
@property (nonatomic,assign)BOOL dx_openBorder;
/**边框颜色 默认黑色*/
@property (nonatomic,copy)NSString * dx_borderColor;
/**边框圆角 默认无*/
@property (nonatomic,assign)CGFloat dx_radius;
/**inputAccessoryView 默认添加*/
@property (nonatomic,assign)BOOL dx_addInputView;
/**是否隐藏inputAccessoryView上的取消按钮 默认YES 隐藏*/
@property (nonatomic,assign)BOOL dx_hidenCancelBtn;

/**是否是密码类型*/
@property (nonatomic,assign)BOOL dx_secureEntry;
/**长度最大限制 默认无限制number = 0*/
@property (nonatomic,assign)int dx_limitMaxNumber;
/**最大限制时是否自动取消键盘 dx_limitMaxNumber>0*/
@property (nonatomic,assign)BOOL dx_autoResignResponder;
/**是否允许输入更改 默认允许*/
@property (nonatomic,assign)BOOL dx_canInput;
/**点击确定按钮回调*/
@property (nonatomic,copy)ClickedSureBtn dx_sureBlock;

/**实时回调当前text内容*/
@property (nonatomic,copy)CurrentText dx_textBlock;

/**默认default 不限制*/
@property (nonatomic,assign)D_ENTER_TYPE dx_textType;

/**键盘类型*/
@property (nonatomic,assign)D_KeyBoardType dx_keyBoard;


@property (nonatomic,copy)CurrentIsEndEditing dx_endEditing;

@property (nonatomic,copy)CurrentIsBegainEditing dx_begainEditing;
@end
