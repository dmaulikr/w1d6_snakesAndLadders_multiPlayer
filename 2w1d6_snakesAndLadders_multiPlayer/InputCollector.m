//
//  InputCollector.m
//  2w1d6_snakesAndLadders_multiPlayer
//
//  Created by Seantastic31 on 01/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

// reads in player input and returns trimmed NSString
+ (NSString*)readPlayerInput
{
    char inputChars[255];
    
    // read a line of input and convert to NSString
    fgets(inputChars, 255, stdin);
    NSString *inputString = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
    
    // trim string to remove whitespace and newline characters
    NSString *trimmedString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return trimmedString;
}

@end
