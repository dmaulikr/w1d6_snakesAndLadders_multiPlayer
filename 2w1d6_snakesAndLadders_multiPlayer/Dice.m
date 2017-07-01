//
//  Dice.m
//  2w1d6_snakesAndLadders_multiPlayer
//
//  Created by Seantastic31 on 01/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (void)rollDice
{
    //NSInteger dieValue = arc4random_uniform(5) + 1;
    self.dieValue = arc4random_uniform(5) + 1;
    //NSLog(@"You rolled a %ld", dieValue);
    NSLog(@"You rolled a %ld", self.dieValue);
}

@end
