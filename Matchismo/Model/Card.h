//
//  Card.h
//  Matchismo
//
//  Created by Jason Cheung on 7/3/13.
//  Copyright (c) 2013 Jason Cheung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (nonatomic, strong) NSString *contents;
@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;
@end
