//
//  LisztDropdownButton.m
//  LisztDropdownButtonProject
//
//  Created by LisztCoder on 2018/1/27.
//  Copyright © 2018年 http://www.lisztcoder.com. All rights reserved.
//

#import "LisztDropdownButton.h"

@interface LisztDropdownButton(){
    /** 标题 */
    UILabel *_titleLabel;
    /** 按钮背景(初始化的时候直接添加了箭头) */
    UIView *_arrowBgView;
    /** 箭头 */
    CAShapeLayer *_arrowLayer;
}
@end

@implementation LisztDropdownButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tintColor = [UIColor redColor];
        [self setTitle:@"第一页"];
        [self setFont:[UIFont systemFontOfSize:14.f]];
        [self setTitleColor:[UIColor blackColor]];
        [self setArrowColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
}

- (void)setTitleColor:(UIColor *)titleColor{
    self.titleLabel.textColor = titleColor;
}

- (void)setFont:(UIFont *)font{
    self.titleLabel.font = font;
}

- (void)setTintColor:(UIColor *)tintColor{
    self.arrowBgView.backgroundColor = tintColor;
    
    self.layer.cornerRadius = 3;
    self.layer.borderWidth = 1;
    self.clipsToBounds = YES;
    self.layer.borderColor = tintColor.CGColor;
}

- (void)setArrowColor:(UIColor *)arrowColor{
    self.arrowLayer.fillColor = arrowColor.CGColor;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect selfFrame = self.frame;
    CGFloat width = [self getWidthText:self.titleLabel.text font:self.titleLabel.font labelHeight:0];
    selfFrame.size = CGSizeMake(width + arrowBgWidth + 20, selfFrame.size.height);
    self.frame = selfFrame;

    CGRect arrowFrame = CGRectZero;
    arrowFrame.size = CGSizeMake(arrowBgWidth, CGRectGetHeight(self.bounds));
    arrowFrame.origin = CGPointMake(CGRectGetWidth(self.bounds) - arrowBgWidth, 0);
    
    self.arrowBgView.frame = arrowFrame;
    
    CGRect titleLabelFrame = CGRectZero;
    titleLabelFrame.size = CGSizeMake(CGRectGetWidth(self.bounds) - arrowBgWidth, CGRectGetHeight(self.bounds));
    titleLabelFrame.origin = CGPointMake(0, 0);
    
    self.titleLabel.frame = titleLabelFrame;
}

#pragma Mark - 懒加载
- (UILabel *)titleLabel{
    if(!_titleLabel){
        UILabel *titleLabel = [UILabel new];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel = titleLabel];
    }
    return _titleLabel;
}

- (UIView *)arrowBgView{
    if(!_arrowBgView){
        UIView *arrowBgView = [UIView new];
        arrowBgView.userInteractionEnabled = NO;
        [self addSubview:_arrowBgView = arrowBgView];
        
        /** 添加箭头 */
        [_arrowBgView.layer addSublayer:self.arrowLayer];
    }
    return _arrowBgView;
}

- (CAShapeLayer *)arrowLayer{
    if(!_arrowLayer){
        UIBezierPath *polygonPath = [UIBezierPath bezierPath];
        CGFloat arrow_x = arrowBgWidth / 2 - arrowWidth / 2;
        CGFloat arrow_y = (CGRectGetHeight(self.bounds) - arrowWidth / 2) / 2;
        [polygonPath moveToPoint:CGPointMake(arrow_x, arrow_y)];
        [polygonPath addLineToPoint:CGPointMake(arrow_x + arrowWidth, arrow_y)];
        [polygonPath addLineToPoint:CGPointMake(arrow_x + arrowWidth / 2, arrow_y + arrowWidth / 2)];
        [polygonPath closePath];
        
        CAShapeLayer *arrowLayer = [CAShapeLayer layer];
        arrowLayer.lineWidth = 0;
        arrowLayer.strokeColor = [UIColor greenColor].CGColor;
        arrowLayer.path = polygonPath.CGPath;
        arrowLayer.fillColor = self.tintColor.CGColor;
        
        _arrowLayer = arrowLayer;
    }
    return _arrowLayer;
}

#pragma mark - Utils
- (CGFloat)getWidthText:(NSString *)text font:(UIFont *)font labelHeight:(CGFloat)height{
    NSDictionary *attrDic = @{NSFontAttributeName:font};
    CGRect strRect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:attrDic context:nil];
    return strRect.size.width;
}

@end
