//
//  ViewController.m
//  MBProgress+KKHint
//
//  Created by KING on 2016/10/8.
//  Copyright © 2016年 King. All rights reserved.
//

#import "ViewController.h"

#import "UIView+Hint.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.view makeHintWithTitle:@"我是默认的"];
    [self.view makeHintWithTitle:@"我是 1 可击穿" identity:@"1" tapIn:YES superTop:20.0f];
    [self.view makeCTHintWithTitle:@"我是 2 一直存在" identity:@"2" superBot:20.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
