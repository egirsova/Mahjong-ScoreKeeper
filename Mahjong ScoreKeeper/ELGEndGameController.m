//
//  ELGEndGameController.m
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/26/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import "ELGEndGameController.h"
#import "ELGPlayer.h"

@interface ELGEndGameController ()

@end

@implementation ELGEndGameController
@synthesize playerArray;

#pragma mark - Initialization Methods
- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

// Overrides the typical initWithWindowNibName to also read in the playerArray
- (id)initWithWindowNibName:(NSString *)windowNibName playerArray:(NSMutableArray *)array
{
    self = [super initWithWindowNibName:windowNibName];
    if (self) {
        self.playerArray = array;
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self initializeAllLabels];
}

- (void)initializeAllLabels
{
    // Makes sure players are ranked first
    [self rankPlayers];
    
    // Player One Labels
    ELGPlayer *playerOne = playerArray[0];
    [playerOneName setStringValue:([playerOne name])];
    NSString *playerOneRW = [NSString stringWithFormat:@"%d", [playerOne roundsWon]];
    [playerOneRoundsWon setStringValue:playerOneRW];
    NSString *playerOneTP = [NSString stringWithFormat:@"%d", [playerOne totalPoints]];
    [playerOneTotalPoints setStringValue:playerOneTP];
    
    // Player Two Labels
    ELGPlayer *playerTwo = playerArray[1];
    [playerTwoName setStringValue:([playerTwo name])];
    NSString *playerTwoRW = [NSString stringWithFormat:@"%d", [playerTwo roundsWon]];
    [playerTwoRoundsWon setStringValue:playerTwoRW];
    NSString *playerTwoTP = [NSString stringWithFormat:@"%d", [playerTwo totalPoints]];
    [playerTwoTotalPoints setStringValue:playerTwoTP];
    
    // Player Three Labels
    ELGPlayer *playerThree = playerArray[2];
    [playerThreeName setStringValue:([playerThree name])];
    NSString *playerThreeRW = [NSString stringWithFormat:@"%d", [playerThree roundsWon]];
    [playerThreeRoundsWon setStringValue:playerThreeRW];
    NSString *playerThreeTP = [NSString stringWithFormat:@"%d", [playerThree totalPoints]];
    [playerThreeTotalPoints setStringValue:playerThreeTP];
    
    // Player Four Labels
    ELGPlayer *playerFour = playerArray[3];
    [playerFourName setStringValue:([playerFour name])];
    NSString *playerFourRW = [NSString stringWithFormat:@"%d", [playerFour roundsWon]];
    [playerFourRoundsWon setStringValue:playerFourRW];
    NSString *playerFourTP = [NSString stringWithFormat:@"%d", [playerFour totalPoints]];
    [playerFourTotalPoints setStringValue:playerFourTP];
}

- (void)rankPlayers
{
    NSSortDescriptor *totalPointsSort = [NSSortDescriptor sortDescriptorWithKey:@"totalPoints" ascending:NO];
    [playerArray sortUsingDescriptors:@[totalPointsSort]];
}

#pragma mark - IBAction Methods
- (IBAction)quitGame:(id)selector
{
    [NSApp terminate:self];
}

@end
