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
@end

@implementation CardResultViewController

- (void)updateUI
{
    NSString *displayText = @"";
    for (GameResult *result in [GameResult allGameResults]) {
        displayText = [displayText stringByAppendingFormat:@"Score: %d(%@, %g)\n",result.score, result.end, round(result.duration)];
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






@end
