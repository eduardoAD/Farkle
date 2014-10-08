//
//  DieLabel.h
//  Farkle
//
//  Created by Eduardo Alvarado Díaz on 10/8/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DieLabelProtocol

- (void) didDieLabelTapped:(UILabel *)label;

@end
@interface DieLabel : UILabel

- (void)roll;
@property id<DieLabelProtocol>delegate;

@end
