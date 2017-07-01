//
//  PlayerManager.h
//  2w1d6_snakesAndLadders_multiPlayer
//
//  Created by Seantastic31 on 01/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Dice.h"

@interface PlayerManager : NSObject

@property (strong, nonatomic) NSDictionary *gameLogic;
@property (nonatomic) BOOL gameOver;
@property (strong, nonatomic) NSMutableArray *players;
@property (nonatomic) NSInteger currentIndex;

- (void)createPlayers:(NSInteger)numberOfPlayers;
- (void)rollForPlayer;
- (Player*)currentPlayer;

@end
