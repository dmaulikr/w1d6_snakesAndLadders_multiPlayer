//
//  PlayerManager.m
//  2w1d6_snakesAndLadders_multiPlayer
//
//  Created by Seantastic31 on 01/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "PlayerManager.h"

@implementation PlayerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _gameLogic = @{@4:@14, @9:@31, @17:@7, @20:@38, @28:@84, @40:@59, @51:@67, @63:@81, @64:@60, @89:@26, @95:@75, @99:@78};
        _gameOver = NO;
        _players = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)createPlayers:(NSInteger)numberOfPlayers
{
    for (int i = 0; i <= numberOfPlayers; i++)
    {
        Player *player = [[Player alloc]initWithName:[NSString stringWithFormat:@"Player %d", i ]];
        [self.players addObject:player];
    }
}

- (void)rollForPlayer
//- (void)rollDice
{
    // instatiate activePlayer
    Player *activePlayer = self.currentPlayer;
    // roll dice
    Dice *die = [[Dice alloc]init];
    [die rollDice];
    // advance activePlayer
    //self.currentSquare += dieValue;
    activePlayer.currentSquare += die.dieValue;
    // record latest square
    //NSInteger previousSquare = self.currentSquare;
    NSInteger previousSquare = activePlayer.currentSquare;
    
    //if (self.currentSquare >= 100)
    if (activePlayer.currentSquare >= 100)
    {
        self.gameOver = YES;
        NSLog(@"You reached 100! You win!");
    }
    else
    {
        //NSNumber *key = [NSNumber numberWithInteger:self.currentSquare];
        NSNumber *key = [NSNumber numberWithInteger:activePlayer.currentSquare];
        if ([self.gameLogic objectForKey:key])
        {
            //NSNumber *boardSquare = [self.gameLogic objectForKey:[NSNumber numberWithInteger:self.currentSquare]];
            NSNumber *boardSquare = [self.gameLogic objectForKey:[NSNumber numberWithInteger:activePlayer.currentSquare]];
            NSInteger specialSquare = [boardSquare integerValue];
            
            //if (self.currentSquare > specialSquare)
            if (activePlayer.currentSquare > specialSquare)
            {
                //self.currentSquare = specialSquare;
                activePlayer.currentSquare = specialSquare;
                //NSLog(@"Yikes! You landed on a snake and you slid down to %ld from %ld", specialSquare, previousSquare);
                NSLog(@"Yikes! %@ landed on a snake and you slid down to %ld from %ld", activePlayer.name, specialSquare, previousSquare);
                
            }
            else
            {
                //self.currentSquare = specialSquare;
                activePlayer.currentSquare = specialSquare;
                //NSLog(@"Stairway to heaven! You jumped to %ld from %ld", specialSquare, previousSquare);
                NSLog(@"Stairway to heaven! %@ jumped to %ld from %ld", activePlayer.name, specialSquare, previousSquare);
            }
            
        }
        else
        {
            //NSLog(@"You landed on %ld", self.currentSquare);
            NSLog(@"%@ landed on %ld", activePlayer.name, activePlayer.currentSquare);
        }
        // increment index to move to next activePlayer
        self.currentIndex += 1;
    }
}

- (Player*)currentPlayer
{
    // use modulus (%) to carousel through players
    return self.players[self.currentIndex % self.players.count];
}

@end
