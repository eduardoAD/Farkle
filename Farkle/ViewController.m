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

@property (strong, nonatomic) IBOutletCollection(DieLabel) NSArray *labels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labels = [[NSArray alloc] initWithObjects:self.label1, self.label2,
                   self.label3, self.label4, self.label5, self.label6,nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onRollButtonPressed:(id)sender {
    for (DieLabel *label in self.labels) {
        [label roll];
    }
}


@end
