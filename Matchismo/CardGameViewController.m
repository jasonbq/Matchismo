//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Jason Cheung on 7/3/13.
//  Copyright (c) 2013 Jason Cheung. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@end

@implementation CardGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    NSLog(@"size of the array is: %d", array.count);
    [array insertObject:@"str1" atIndex:0];
    NSLog(@"size of the array is: %d", array.count);
    [array insertObject:@"str2" atIndex:0];
    [array insertObject:@"str3" atIndex:0];
    [array insertObject:@"str4" atIndex:0];
    NSLog(@"size of the array is: %d", array.count);
    for (NSString *str in array){
        NSLog(@"%@n",str);
    }
    
    //add object
    [array addObject:@"str5"];
    [array addObject:@"str6"];
    [array addObject:@"str7"];
    [array addObject:@"str8"];
    NSLog(@"size of the array is: %d", array.count);
    for (NSString *str in array){
        NSLog(@"%@n",str);
    }
   
    




}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", flipCount];
}

- (IBAction)flipCard:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    self.flipCount++;
}

@end
