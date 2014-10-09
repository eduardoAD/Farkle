//
//  DieLabel.m
//  Farkle
//
//  Created by Eduardo Alvarado Díaz on 10/8/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel

- (IBAction)onTapped:(UITapGestureRecognizer *)sender{
    DieLabel *label = (DieLabel*)sender.view;
    if ([label.backgroundColor isEqual:[UIColor cyanColor]]) {
        label.backgroundColor = [UIColor blueColor];
    }else{
        label.backgroundColor = [UIColor cyanColor];
    }
    [self.delegate didDieLabelTapped:label];
}

- (void)roll{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.text = @(arc4random_uniform(6)+1).description;
    });
    self.text = @"rolling";
}


@end
