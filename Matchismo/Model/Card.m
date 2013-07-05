//
//  Card.m
//  Matchismo
//
//  Created by Jason Cheung on 7/3/13.
//  Copyright (c) 2013 Jason Cheung. All rights reserved.
//

#import "Card.h"
@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards) {
        if ([self.contents isEqualToString:card.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
