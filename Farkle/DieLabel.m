//
//  DieLabel.m
//  Farkle
//
//  Created by Eduardo Alvarado Díaz on 10/8/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)onTapped:(UITapGestureRecognizer *)sender{
    //NSLog(@"sender: %@",sender);
}

- (void)roll{
    self.text = @(arc4random_uniform(6)+1).description;
}


@end
