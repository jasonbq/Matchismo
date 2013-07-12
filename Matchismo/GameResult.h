//
//  GameResult.h
//  Matchismo
//
//  Created by Jason Cheung on 7/12/13.
//  Copyright (c) 2013 Jason Cheung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject
@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;

+ (NSArray *)allGameResults; // of GameResult
- (NSComparisonResult)compareScoreToGameResult:(GameResult *)otherResult;
- (NSComparisonResult)compareEndDateToGameResult:(GameResult *)otherResult;
- (NSComparisonResult)compareDurationToGameResult:(GameResult *)otherResult;
@end
