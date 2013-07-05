//
//  Deck.h
//  Matchismo
//
//  Created by Jason Cheung on 7/3/13.
//  Copyright (c) 2013 Jason Cheung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void)addCard:(Card *) card atTop:(BOOL)atTop;
- (Card *)drawRandomCard;
@end
