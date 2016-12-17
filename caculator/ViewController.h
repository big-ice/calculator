//
//  ViewController.h
//  caculator
//
//  Created by 潘若冰 on 2016/11/13.
//  Copyright © 2016年 潘若冰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property(retain,nonatomic) UILabel *label;
@property(retain,nonatomic) NSString *content;
@property(retain,nonatomic) NSMutableString *string;
@property(assign,nonatomic) double num1,num2,num3;
@property(assign,nonatomic) NSString *str;
@property(retain,nonatomic) NSMutableString *tstr;

@end

