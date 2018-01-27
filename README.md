
![](https://img.shields.io/badge/LisztDropdownButton-v1.0-ed900c.svg)
![](https://img.shields.io/badge/Objective--C-Compatible-1098f7.svg)
###实现原理
####1.首先创建一个LisztDropdownButton继承于UIControl
	@interface LisztDropdownButton : UIControl
	@end
###2.在H文件中声明对外的属性
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
###3.在M文件中实现声明的方法,并且重写TintColor.在initWithFrame方法中设置默认值
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
###重要代码提示
####1.计算文本高度代码如下:
	#pragma mark - Utils
	- (CGFloat)getWidthText:(NSString *)text font:(UIFont *)font labelHeight:(CGFloat)height{
	    NSDictionary *attrDic = @{NSFontAttributeName:font};
	    CGRect strRect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:attrDic context:nil];
	    return strRect.size.width;
	}
####2.绘制三角形代码如下:
	UIBezierPath *polygonPath = [UIBezierPath bezierPath];
	CGFloat arrow_x = arrowBgWidth / 2 - arrowWidth / 2;
	CGFloat arrow_y = (CGRectGetHeight(self.bounds) - arrowWidth / 2) / 2;
	[polygonPath moveToPoint:CGPointMake(arrow_x, arrow_y)];
	[polygonPath addLineToPoint:CGPointMake(arrow_x + arrowWidth, arrow_y)];
	[polygonPath addLineToPoint:CGPointMake(arrow_x + arrowWidth / 2, arrow_y + arrowWidth / 2)];
	[polygonPath closePath];
	
####3.示例
	LisztDropdownButton *dropdownButtonExample = [[LisztDropdownButton alloc] initWithFrame:CGRectMake(100, 100, 0, 30)];
    /** 设置标题 */
    [dropdownButtonExample setTitle:@"示例"];
    /** 设置标题颜色 */
    [dropdownButtonExample setTitleColor:[UIColor colorWithRed:16/255.f green:152/255.f blue:247/255.f alpha:1]];
    /** 设置字体 */
    [dropdownButtonExample setFont:[UIFont systemFontOfSize:12]];
    /** 设置箭头颜色 */
    [dropdownButtonExample setArrowColor:[UIColor whiteColor]];
    /** TintColor(箭头背景和边框颜色) */
    [dropdownButtonExample setTintColor:[UIColor colorWithRed:16/255.f green:152/255.f blue:247/255.f alpha:1]];
    /** 添加点击事件 */
    [dropdownButtonExample addTarget:self action:@selector(dropdownAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dropdownButtonExample];
###效果图:
![](https://coding.net/u/LisztCoder/p/icons/git/raw/master/DemeExample/%25E7%25A4%25BA%25E4%25BE%258B.gif)


###欢迎查看关于我
