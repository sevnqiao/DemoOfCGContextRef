//
//  ViewController.m
//  DemoOfCGContextRef
//
//  Created by world on 2018/8/7.
//  Copyright © 2018年 world. All rights reserved.
//

#import "ViewController.h"
#import "CGContextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    CGContextView *view = [[CGContextView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:view];
}





@end
