//
//  GameResult.m
//  Matchismo
//
//  Created by Jason Cheung on 7/12/13.
//  Copyright (c) 2013 Jason Cheung. All rights reserved.
//

#import "GameResult.h"
@interface GameResult()
@property (readwrite, nonatomic) NSDate *start;
@property (readwrite, nonatomic) NSDate *end;
@end

@implementation GameResult
// top level name for saving all the result
#define ALL_RESULTS_KEY @"GameResult_All"
#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"

// Notice: NSMutableArray is a subclass of NSArray.
+ (NSArray *)allGameResults
{
    NSMutableArray *allGameResults = [[NSMutableArray alloc] init];
    for (id plist in [[[NSUserDefaults standardUserDefaults] valueForKey:ALL_RESULTS_KEY] allValues]) {
        GameResult *result= [[GameResult alloc] initFromPropertyList:plist];
        [allGameResults addObject:result];
    }
    return allGameResults;
}

- (id)initFromPropertyList:(id)plist
{
    self = [self init];
    if (self) {
        if ([plist isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDictionary = (NSDictionary *)plist;
            _start = resultDictionary[START_KEY];
            _end = resultDictionary[END_KEY];
            _score = [resultDictionary[SCORE_KEY] intValue];
            if (!_start || _end) {
                self = nil;
            }
        }
    }
    return self;
}


- (void)synchronize
{
    NSMutableDictionary *mutableGameResultsFromUserDefaults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if (!mutableGameResultsFromUserDefaults) {
        mutableGameResultsFromUserDefaults = [[NSMutableDictionary alloc] init];
    }
    mutableGameResultsFromUserDefaults[[self.start description]] = [self asPropertyList];
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResultsFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

// the reason put the return type here is beacause we may change the repersentation in the future
// we can use interspection to check the object type


- (id)asPropertyList
{
    return @{START_KEY: self.start, END_KEY: self.end, SCORE_KEY: @(self.score)};
}


- (id)init
{
    self = [super init];
    if (self) {
        _start = [NSDate date];
        _end = _start;
    }
    return self;
}

- (NSTimeInterval)duration
{
    return [self.end timeIntervalSinceDate:self.start];
}

// set the score when the game is ended;
- (void)setScore:(int)score
{
    _score = score;
    _end = [NSDate date];
    [self synchronize];
}
@end
