//
//  Player.m
//  2w1d6_snakesAndLadders_multiPlayer
//
//  Created by Seantastic31 on 01/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
        _gameLogic = @{@4:@14, @9:@31, @17:@7, @20:@38, @28:@84, @40:@59, @51:@67, @63:@81, @64:@60, @89:@26, @95:@75, @99:@78};
        _gameOver = NO;
    }
    return self;
}


- (void)rollDice
{
    NSInteger dieValue = arc4random_uniform(5) + 1;
    NSLog(@"You rolled a %ld", dieValue);
    self.currentSquare += dieValue;
    
    // track previous square before advancing player
    NSInteger previousSquare = self.currentSquare;
    
    if (self.currentSquare >= 100)
    {
        self.gameOver = YES;
        NSLog(@"You reached 100! You win!");
    }
    else
    {
        // check to see if player lands on special square
        NSNumber *key = [NSNumber numberWithInteger:self.currentSquare];
        if ([self.gameLogic objectForKey:key])
        {
            // if key in dictionary then pull value
            NSNumber *boardSquare = [self.gameLogic objectForKey:[NSNumber numberWithInteger:self.currentSquare]];
            NSInteger specialSquare = [boardSquare integerValue];
            // if currentSquare higher than specialSquare then snake
            if (self.currentSquare > specialSquare)
            {
                self.currentSquare = specialSquare;
                //NSLog(@"Yikes! You landed on a snake and you slid down to %ld", self.currentSquare);
                NSLog(@"Yikes! You landed on a snake and you slid down to %ld from %ld", specialSquare, previousSquare);
            }
            else
            {
                self.currentSquare = specialSquare;
                //NSLog(@"Stairway to heaven! You jumped to %ld", self.currentSquare);
                NSLog(@"Stairway to heaven! You jumped to %ld from %ld", specialSquare, previousSquare);
            }
            
        }
        else
        {
            NSLog(@"You landed on %ld", self.currentSquare);
        }
    }
    
    
    
    
    
    
}

@end
