//
//  main.m
//  2w1d6_snakesAndLadders_multiPlayer
//
//  Created by Seantastic31 on 01/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL gameOn = YES;
        
        Player *player1 = [Player new];
        
        //NSLog(@"Type 'roll' or 'r' to begin the game");
        NSLog(@"Welcome to snakes & ladders");
        
        while (gameOn)
        {
            if (player1.gameOver)
            {
                NSLog(@"See you next time!");
                break;
            }
            
            NSLog(@"Type 'roll' or 'r' to begin the game");
            NSString *input = [InputCollector readPlayerInput];
            
            if ([input isEqualToString:@"roll"] || [input isEqualToString:@"r"])
            {
                [player1 rollDice];
            }
        }
    }
    return 0;
}
