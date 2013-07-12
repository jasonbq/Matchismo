//
//  CardResultViewController.m
//  Matchismo
//
//  Created by Jason Cheung on 7/12/13.
//  Copyright (c) 2013 Jason Cheung. All rights reserved.
//

#import "CardResultViewController.h"
#import "GameResult.h"
@interface CardResultViewController()

@property (weak, nonatomic) IBOutlet UITextView *display;
@property (nonatomic) SEL sortSelector;
@end

@implementation CardResultViewController
@synthesize sortSelector = _sortSelector;


// setter and getter of sortSelector
- (SEL)sortSelector
{
    if (!_sortSelector) {
        _sortSelector = @selector(compareScoreToGameResult:);
    }
    return _sortSelector;
}

- (void)setSortSelector:(SEL)sortSelector
{
    _sortSelector = sortSelector;
    [self updateUI];
}



- (void)updateUI
{
    NSString *displayText = @"";
    // format date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    for (GameResult *result in [[GameResult allGameResults] sortedArrayUsingSelector:self.sortSelector]) {
        displayText = [displayText stringByAppendingFormat:@"Score: %d(%@, %g)\n",result.score, [formatter stringFromDate:result.end], round(result.duration)];
    }
    self.display.text = displayText;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)setup
{
    // initilization can't wait until viewDidLoad.
    
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}


#pragma mark - sorting the game result
- (IBAction)sortByDate
{
    self.sortSelector = @selector(compareEndDateToGameResult:);
}

- (IBAction)sortByScore
{
    self.sortSelector = @selector(compareScoreToGameResult:);
}

- (IBAction)sortByDuration
{
    self.sortSelector = @selector(compareDurationToGameResult:);
    
}







@end
