//
//  PlayingCard.h
//  Matchismo
//
//  Created by Jason Cheung on 7/4/13.
//  Copyright (c) 2013 Jason Cheung. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSArray *)rankStrings;
+ (NSUInteger)maxRank;
@end
