//
//  Player.m
//  2w1d6_snakesAndLadders_multiPlayer
//
//  Created by Seantastic31 on 01/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
        _name = name;
    }
    return self;
}

@end
