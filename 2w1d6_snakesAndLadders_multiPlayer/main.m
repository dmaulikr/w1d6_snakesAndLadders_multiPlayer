//
//  main.m
//  2w1d6_snakesAndLadders_multiPlayer
//
//  Created by Seantastic31 on 01/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "PlayerManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL gameOn = YES;
        
        //Player *player1 = [Player new];
        PlayerManager *playerManager = [[PlayerManager alloc]init];
        
        NSLog(@"Welcome to snakes & ladders");
        
        // create separate multiplayer loop
        while (playerManager.players.count == 0)
        {
            // create multiplayers
            NSLog(@"Enter number of players");
            NSString *numberOfPlayers = [InputCollector readPlayerInput];
            if ([numberOfPlayers intValue])
            {
                [playerManager createPlayers:[numberOfPlayers intValue]];
            }
        }
            
        while (gameOn)
        {
            //if (player1.gameOver)
            if (playerManager.gameOver)
            {
                NSLog(@"See you next time!");
                break;
            }
            
            NSLog(@"Type 'roll' or 'r' to begin the game");
            NSString *input = [InputCollector readPlayerInput];
            
            if ([input isEqualToString:@"roll"] || [input isEqualToString:@"r"])
            {
                //[player1 rollDice];
                [playerManager rollForPlayer];
            }
        }
    }
    return 0;
}
