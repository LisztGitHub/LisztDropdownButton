//
//  ViewController.m
//  LisztDropdownButtonProject
//
//  Created by LisztCoder on 2018/1/27.
//  Copyright © 2018年 http://www.lisztcoder.com. All rights reserved.
//

#import "ViewController.h"
#import "LisztDropdownButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *titleArray = @[@"省-市-区",@"编程语言",@"Simplified Chinese",@"English",@"请选择年龄"];
    [titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LisztDropdownButton *dropdownButton = [[LisztDropdownButton alloc] initWithFrame:CGRectMake(100, 150 + idx * (20 + 30), 0, 30)];
        [dropdownButton setTitle:titleArray[idx]];
        dropdownButton.tag = idx;
        [dropdownButton addTarget:self action:@selector(dropdownAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:dropdownButton];
    }];
    
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
}

- (void)dropdownAction:(LisztDropdownButton *)sender{
    NSArray *titleArray = @[@"省-市-区",@"编程语言",@"Simplified Chinese",@"English",@"请选择年龄"];
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:titleArray[sender.tag] message:@"个人博客:http://www.lisztcoder.com" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alertVC animated:YES completion:nil];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^(void) {
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
            [alertVC dismissViewControllerAnimated:YES completion:nil];
        });
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
