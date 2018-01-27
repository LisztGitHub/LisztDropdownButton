//
//  LisztDropdownButton.h
//  LisztDropdownButtonProject
//
//  Created by LisztCoder on 2018/1/27.
//  Copyright © 2018年 http://www.lisztcoder.com. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 箭头背景宽度 */
static CGFloat arrowBgWidth = 30;
/** 箭头宽度 */
static CGFloat arrowWidth = 10;


@interface LisztDropdownButton : UIControl
/** 标题控件 */
@property (nonatomic, readonly, weak) UILabel *titleLabel;
/** 箭头背景(在初始化的时候绘制了三角形按钮) */
@property (nonatomic, readonly, weak) UIView *arrowBgView;
/** 箭头形状 */
@property (nonatomic, readonly, weak) CAShapeLayer *arrowLayer;

/** 设置标题 */
- (void)setTitle:(NSString *)title;
/** 设置字体颜色 */
- (void)setTitleColor:(UIColor *)titleColor;
/** 设置字体 */
- (void)setFont:(UIFont *)font;
/** 箭头颜色 */
- (void)setArrowColor:(UIColor *)arrowColor;
@end
