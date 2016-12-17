//
//  ViewController.m
//  caculator
//
//  Created by 潘若冰 on 2016/11/13.
//  Copyright © 2016年 潘若冰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    int i;
    self.view.backgroundColor = [UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1.00];
    UIButton * btn[19];
    float Height,Width,Long;
    Height = [[UIScreen mainScreen]bounds].size.height;
    Width = [[UIScreen mainScreen]bounds].size.width;
    Long = (Width-3)/4;
    NSArray * title=@[@"C",@"+/-",@"%",@"÷",@"7",@"8",@"9",@"×",@"4",@"5",@"6",@"－",@"1",@"2",@"3",@"+",@"0",@".",@"="];
    for (i = 0; i<19; i++) {
        btn[i] = [UIButton buttonWithType:UIButtonTypeSystem];

        btn[i].frame = CGRectMake((i%4)*(Long+1),Height-(5-i/4)*Long-(4-i/4),Long, Long);
        switch (i) {
            case 0:case 1:case 2:
                btn[i].backgroundColor = [UIColor colorWithRed:198/255.0 green:199/255.0 blue:201/255.0 alpha:1.00];
                break;
            case 3:case 7:case 11:case 15:case 18:
                btn[i].backgroundColor = [UIColor colorWithRed:0.99 green:0.55 blue:0.20 alpha:1.00];
                break;
            case 4:case 5:case 6:case 8:case 9:case 10:case 12:case 13:case 14:case 16:case 17:
                btn[i].backgroundColor = [UIColor colorWithRed:0.82 green:0.83 blue:0.84 alpha:1.00];
                break;
          
            default:
                break;
        }
        [btn[i] setTitle:[title objectAtIndex:i] forState:UIControlStateNormal];
        [btn[i] setTintColor:[UIColor blackColor]];
        switch (i) {
            case 3:case 7:case 11:case 15:case 18:
                [btn[i] setTintColor:[UIColor whiteColor]];
                break;
        }
        btn[i].titleLabel.font = [UIFont systemFontOfSize: 24.0];
        [self.view addSubview:btn[i]];
        btn[i].tag = i;
    }
    
    btn[16].frame = CGRectMake(0,Height-Long,2*Long+1, Long);
    btn[17].frame = CGRectMake(2*Long+2,Height-Long,Long, Long);
    btn[18].frame = CGRectMake(3*Long+3,Height-Long,Long, Long);
    
    //初始化
    [self clear];
    [self.string setString:@""];
    //数字按钮上的点击事件
    [btn[4] addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchUpInside];
    [btn[5] addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchUpInside];
    [btn[6] addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchUpInside];
    [btn[8] addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchUpInside];
    [btn[9] addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchUpInside];
    [btn[10] addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchUpInside];
    [btn[12] addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchUpInside];
    [btn[13] addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchUpInside];
    [btn[14] addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchUpInside];
    [btn[16] addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchUpInside];
    
    //C按钮上的方法
    [btn[0] addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    
    //.按钮上的方法
    [btn[17] addTarget:self action:@selector(dot) forControlEvents:UIControlEventTouchUpInside];
   
    //百分数的方法
    [btn[2] addTarget:self action:@selector(percentage) forControlEvents:UIControlEventTouchUpInside];

    //相反数
    [btn[1] addTarget:self action:@selector(oppositenum) forControlEvents:UIControlEventTouchUpInside];

    //乘法
    [btn[7] addTarget:self action:@selector(multiply) forControlEvents:UIControlEventTouchUpInside];
    
    //除法
    [btn[3] addTarget:self action:@selector(divide) forControlEvents:UIControlEventTouchUpInside];
    
    //加法
    [btn[15] addTarget:self action:@selector(plus) forControlEvents:UIControlEventTouchUpInside];
    
    //减法
    [btn[11] addTarget:self action:@selector(mimus) forControlEvents:UIControlEventTouchUpInside];
    
    //等于
    [btn[18] addTarget:self action:@selector(equal) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    _label = [[UILabel alloc]init];
    _label.frame = CGRectMake(0, Height-6*Long+1/3.0*Long, Width, 2/3.0*Long);
    _label.backgroundColor = [UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1.00];
    _label.textColor = [UIColor whiteColor];
    _label.font = [UIFont systemFontOfSize:60];

    _label.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:_label];

    
}
//0-9方法
-(void)number:(id)sender
{
    UIButton *btn =(UIButton *)sender;
    NSString *tnum;
    if ([self.str isEqualToString:@"="]) {
        self.string = [[NSMutableString alloc] initWithString:@"0"];
        _str = @"";
    }
    switch (btn.tag) {
        case 4:
            tnum = @"7";
            break;
        case 5:
            tnum = @"8";
            break;
        case 6:
            tnum = @"9";
            break;
        case 8:
            tnum = @"4";
            break;
        case 9:
            tnum = @"5";
            break;
        case 10:
            tnum = @"6";
            break;
        case 12:
            tnum = @"1";
            break;
        case 13:
            tnum = @"2";
            break;
        case 14:
            tnum = @"3";
            break;
        case 16:
            tnum = @"0";
            break;
        default:
            break;
    }
    if ([self.string hasPrefix:@"0"]&&![self.string hasPrefix:@"0."]&&btn.tag==16) {
        tnum = @"";
    }
    else if([self.string hasPrefix:@"0"]&&![self.string hasPrefix:@"0."]&&btn.tag!=16){
        [self.string setString:tnum];
        [self show];
        return;
    }
    else if([self.string hasPrefix:@"-0"]&&![self.string hasPrefix:@"0."]&&btn.tag!=16){
        [self.string setString:@"-"];
        [self.string appendString:tnum];
        [self show];
        return;
    }
    
    [self.string appendString:tnum];
    [self show];
    
}
//初始化方法
-(void)clear
{
    _num1 = 0;
    _num2 = 0;
    _num3 = 0;
    self.string = [[NSMutableString alloc] initWithString:@"0"];
    self.str = @"";
    _content = _string;
    _label.text = _content;
}

//显示label的方法
-(void)show
{
    _content = _string;
    _label.text = _content;
    

}

//.方法
-(void)dot
{
    if (self.string.length==0) {
        return;
    }
    for (int i = 0; i<self.string.length; i++) {
        char c = [self.string characterAtIndex:i];
        if (c == '.') {
            return;
        }
    }
    [self.string appendString:@"."];
}

// +/-的方法
-(void)oppositenum
{
    if (([self.str isEqualToString:@"+"]||[self.str isEqualToString:@"-"]||[self.str isEqualToString:@"*"]||[self.str isEqualToString:@"/"])&&(_num2 == [self.label.text doubleValue])) {
//        _str = @"-";
        [self.string setString:@"-0"];
        [self show];
        return;
    }
    self.num1 = [self.label.text doubleValue];
    _num1 = _num1*(-1);
    self.string = [NSMutableString stringWithFormat:@"%g",_num1];
    [self show];

}

//百分数
-(void)percentage
{
    if ([self.str isEqualToString:@"+"]||[self.str isEqualToString:@"-"]) {
        if (_num2 == [self.label.text doubleValue]){
            self.num1 = [self.label.text doubleValue];
            self.string = [NSMutableString stringWithFormat:@"%g",_num1*_num1/100];
            _num1 = _num1*_num1/100;
            [self show];
            return;
        }else{
            _num1 = [self.label.text doubleValue];
            self.string = [NSMutableString stringWithFormat:@"%g",_num1*_num2/100];
            _num1 = _num1*_num2/100;
            [self show];
            return;
        }
    }
    
    self.num1 = [self.label.text doubleValue];
    self.string = [NSMutableString stringWithFormat:@"%g",_num1/100];
    [self show];
    _num1 = _num1/100;
    [self.string setString:@"0"];
}

//乘法
-(void)multiply
{
    if ([self.str isEqualToString:@"*"]||([self.str isEqualToString:@"/"] )) {
        if (_num2 == [self.label.text doubleValue]) {
            _str = @"*";
            return;
        }
        [self showresult];
        _num2 = [self.label.text doubleValue];
        [self.string setString:@"0"];
        _str = @"*";

    }
    else if ([self.str isEqualToString:@"+"]) {
        if(_num2 == [self.label.text doubleValue]){
            _str =@"*";
            return;
        }else{
        _num3 = _num2;
        _num2 = [self.label.text doubleValue];
        [self.string setString:@"0"];
        _str = @"*";
        }
    }
    else if ([self.str isEqualToString:@"-"]){
        if(_num2 == [self.label.text doubleValue]){
            _str =@"*";
            return;
        }else{
            _num3 = _num2;
            _num2 = [self.label.text doubleValue];
            [self.string setString:@"0"];
            _str = @"*";
        }
    }
    else if ([self.str isEqualToString:@""]){
    _num2 = [self.label.text doubleValue];
    [self.string setString:@"0"];
    _str = @"*";
    }
    _num2 = [self.label.text doubleValue];
    [self.string setString:@"0"];
    _str = @"*";
}

//除法
-(void)divide
{
    if ([self.str isEqualToString:@"*"]||[self.str isEqualToString:@"/"]) {
        if (_num2 == [self.label.text doubleValue]) {
            _str = @"/";
            return;
        }
        [self showresult];
        _num2 = [self.label.text doubleValue];
        [self.string setString:@"0"];
        _str = @"/";

    }
    if ([self.str isEqualToString:@"+"]) {
        if(_num2 == [self.label.text doubleValue]){
            _str =@"/";
            return;
        }else{
            _num3 = _num2;
            _num2 = [self.label.text doubleValue];
            [self.string setString:@"0"];
            _str = @"/";
        }
    }
    else if ([self.str isEqualToString:@"-"]){
        if(_num2 == [self.label.text doubleValue]){
            _str =@"/";
            return;
        }else{
            _num3 = _num2;
            _num2 = [self.label.text doubleValue];
            [self.string setString:@"0"];
            _str = @"/";
        }    }
    else if ([self.str isEqualToString:@""]){
        _num2 = [self.label.text doubleValue];
        [self.string setString:@"0"];
        _str = @"/";
    }
    _num2 = [self.label.text doubleValue];
    [self.string setString:@"0"];
    _str = @"/";

}


//加法
-(void)plus
{
    if ([self.str isEqualToString:@"*"]||[self.str isEqualToString:@"/"]||[self.str isEqualToString:@"+"]||[self.str isEqualToString:@"-"]) {
        if (_num2 == [self.label.text doubleValue]) {
            _str = @"+";
            return;
        }
        [self showresult];
    }
    
    _num2 = [self.label.text doubleValue];
    [self.string setString:@"0"];
    _str = @"+";
    
}

//减法
-(void)mimus
{
    if ([self.str isEqualToString:@"*"]||[self.str isEqualToString:@"/"]||[self.str isEqualToString:@"+"]||[self.str isEqualToString:@"-"]) {
        if (_num2 == [self.label.text doubleValue]) {
            _str = @"-";
            return;
        }
        [self showresult];
    }
    _num2 = [self.label.text doubleValue];
    [self.string setString:@"0"];
    _str = @"-";
    
}


//显示结果
-(void)showresult
{
    if ([self.str isEqualToString:@"*"]) {
        _num1 = [self.label.text doubleValue];
        self.string = [NSMutableString stringWithFormat:@"%g",_num1*_num2+_num3];
        [self show];
        
    }
    else if ([self.str isEqualToString:@"/"]){
        _num1 = [self.label.text doubleValue];
        self.string = [NSMutableString stringWithFormat:@"%g",_num2/_num1+_num3];
        [self show];

    }
    else if ([self.str isEqualToString:@"+"]){
        _num1 = [self.label.text doubleValue];
        self.string = [NSMutableString stringWithFormat:@"%g",_num1+_num2];
        [self show];

    }
    else if ([self.str isEqualToString:@"-"]){
        _num1 = [self.label.text doubleValue];
        self.string = [NSMutableString stringWithFormat:@"%g",_num2-_num1];
        [self show];

    }
}

//等于
-(void)equal
{
    [self showresult];
    _str = @"=";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
