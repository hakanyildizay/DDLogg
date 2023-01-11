//
//  DDViewController.m
//  DDLogg
//
//  Created by Aneesh on 01/09/2023.
//  Copyright (c) 2023 Aneesh. All rights reserved.
//

#import "DDViewController.h"
@import DDLogg;

@interface DDViewController ()

@end

@implementation DDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    DDBridge *log = [[DDBridge alloc]init];
    NSDictionary *dic = [[NSDictionary alloc]init];
    [log logToRemote: @"" with:dic];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
