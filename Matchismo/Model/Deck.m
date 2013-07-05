//
//  Deck.m
//  Matchismo
//
//  Created by Jason Cheung on 7/3/13.
//  Copyright (c) 2013 Jason Cheung. All rights reserved.
//

#import "Deck.h"
@interface Deck()
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation Deck
- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

- (Card *)drawRandomCard
{
    Card *randomCard;
    if (self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = [self.cards objectAtIndexedSubscript:index];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end