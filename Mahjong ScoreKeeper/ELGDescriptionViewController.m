//
//  ELGDescriptionViewController.m
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 2/5/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import "ELGDescriptionViewController.h"

@interface ELGDescriptionViewController ()

@end

@implementation ELGDescriptionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)awakeFromNib
{
    [self populateTextView];
}

- (void)populateTextView
{
    [description readRTFDFromFile:[[NSBundle mainBundle] pathForResource: @"description" ofType: @"rtf"]];
}

@end
