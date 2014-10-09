//
//  ViewController.m
//  Farkle
//
//  Created by Eduardo Alvarado Díaz on 10/8/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <DieLabelProtocol>
@property (strong, nonatomic) IBOutlet DieLabel *label1;
@property (strong, nonatomic) IBOutlet DieLabel *label2;
@property (strong, nonatomic) IBOutlet DieLabel *label3;
@property (strong, nonatomic) IBOutlet DieLabel *label4;
@property (strong, nonatomic) IBOutlet DieLabel *label5;
@property (strong, nonatomic) IBOutlet DieLabel *label6;
@property (strong, nonatomic) IBOutlet UILabel *userScore;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@property IBOutletCollection(DieLabel) NSArray *labels;
@property NSMutableArray *dice;
@property NSMutableArray *freeDice;
@property BOOL firstLoad;
@property int score;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dice = [[NSMutableArray alloc]init];
    self.freeDice = [[NSMutableArray alloc]init];
    self.firstLoad = YES;
    self.statusLabel.text = @"";
    self.score = 0;

    self.labels = [[NSArray alloc] initWithObjects:self.label1, self.label2,
                   self.label3, self.label4, self.label5, self.label6,nil];
    for (DieLabel *label in self.labels) {
        label.delegate = self;
        [self.freeDice addObject:label];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onRollButtonPressed:(id)sender {
    for (DieLabel *label in self.freeDice) {
        [label roll];
    }
    if (self.firstLoad == YES) {
        self.firstLoad = NO;
    }
    [self checkAfterRoll];
}

- (void)didDieLabelTapped:(UILabel *)label{
    if ([label.backgroundColor isEqual:[UIColor blueColor]]) {
        [self.dice addObject:(DieLabel *)label];
        [self.freeDice removeObject:(DieLabel *)label];
    }else{
        [self.dice removeObject:(DieLabel *)label];
        [self.freeDice addObject:(DieLabel *)label];
    }
    [self checkAfterDieLabelTapped];
}

- (void) checkAfterRoll{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        NSString *advice = [[NSString alloc]init];
        NSMutableArray *data = [[NSMutableArray alloc]init];
        for (DieLabel *label in self.freeDice) {
            [data addObject:label];
        }
        NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:@"text" ascending:YES];
        NSArray *dataOrdered = [data sortedArrayUsingDescriptors:@[sd]];

        NSMutableString *result = [[NSMutableString alloc]init];
        for (DieLabel *value in dataOrdered) {
            [result appendString: value.text];
        }

        NSLog(@"%@",result);
        if (result.length == 6) {
            if ([result containsString:@"123456"]) {
                advice = @"Hot dice";
            }
        }
        if ([result containsString:@"111"]) {
            advice = @"Three 1's";
        }else if ([result containsString:@"222"]) {
            advice = @"Three 2's";
        }else if ([result containsString:@"333"]) {
            advice = @"Three 3's";
        }else if ([result containsString:@"444"]) {
            advice = @"Three 4's";
        }else if ([result containsString:@"555"]) {
            advice = @"Three 5's";
        }else if ([result containsString:@"666"]) {
            advice = @"Three 6's";
        }else if ([result containsString:@"1"]) {
            advice = @"Have 1";
        }else if ([result containsString:@"5"]) {
            advice = @"Have 5";
        }else{
            advice = @"Farkled";
            self.score = 0;
            self.userScore.text = @"0";
        }
        self.statusLabel.text = advice;
    });
}

- (void) checkAfterDieLabelTapped{
    NSMutableArray *data = [[NSMutableArray alloc]init];
    for (DieLabel *label in self.dice) {
        [data addObject:label];
    }
    NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:@"text" ascending:YES];
    NSArray *dataOrdered = [data sortedArrayUsingDescriptors:@[sd]];

    NSMutableString *result = [[NSMutableString alloc]init];
    for (DieLabel *value in dataOrdered) {
        [result appendString: value.text];
    }

    NSLog(@"%@",result);

    if ([result containsString:@"111"]) {
        self.score += 1000;
    }else if ([result containsString:@"222"]) {
        self.score += 200;
    }else if ([result containsString:@"333"]) {
        self.score += 300;
    }else if ([result containsString:@"444"]) {
        self.score += 400;
    }else if ([result containsString:@"555"]) {
        self.score += 500;
    }else if ([result containsString:@"666"]) {
        self.score += 600;
    }else if ([result containsString:@"1"]) {
        self.score += 100;
    }else if ([result containsString:@"5"]) {
        self.score += 50;
    }
    self.userScore.text = @(self.score).description;
}

@end
