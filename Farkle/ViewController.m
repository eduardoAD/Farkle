//
//  ViewController.m
//  Farkle
//
//  Created by Eduardo Alvarado Díaz on 10/8/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet DieLabel *label1;
@property (strong, nonatomic) IBOutlet DieLabel *label2;
@property (strong, nonatomic) IBOutlet DieLabel *label3;
@property (strong, nonatomic) IBOutlet DieLabel *label4;
@property (strong, nonatomic) IBOutlet DieLabel *label5;
@property (strong, nonatomic) IBOutlet DieLabel *label6;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.label1 roll];
    [self.label2 roll];
    [self.label3 roll];
    [self.label4 roll];
    [self.label5 roll];
    [self.label6 roll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
