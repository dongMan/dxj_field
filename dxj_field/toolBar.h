//
//  toolBar.h
//  ios2688webshop
//
//  Created by dong on 16/10/14.
//  Copyright © 2016年 zhangzl. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ToolBarClick)(BOOL sureBtnClicked);
@interface toolBar : UIToolbar
@property (nonatomic,copy)ToolBarClick barBlock;
@property (nonatomic,assign)BOOL hidenCancelBtn;
@end
