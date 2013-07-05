//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Jason Cheung on 7/6/13.
//  Copyright (c) 2013 Jason Cheung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject
@property (readonly, nonatomic) int score;

- (void)flipCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck;
@end
