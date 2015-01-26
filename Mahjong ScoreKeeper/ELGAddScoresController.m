//
//  ELGAddScoresController.m
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import "ELGAddScoresController.h"
#import "ELGAddScorePlayerController.h"
#import "ELGPlayer.h"

@interface ELGAddScoresController ()

@end

@implementation ELGAddScoresController
@synthesize playerArray;

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
    [self updateNameLabels];
    int rounds = [playerArray[0] roundsPlayed];
    NSString *roundLabel = [NSString stringWithFormat:@"Round %d Scores", rounds];
    [roundCountLabel setStringValue:roundLabel];
    submitButtonCount = 0;
    
}

- (void)awakeFromNib
{
    // Listens to notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateScoreLabels)
                                                 name:@"doneAddScore"
                                               object:nil];
}

- (void)updateNameLabels
{
    [playerOneNameLabel setStringValue:[[playerArray[0] name] stringByAppendingString:@":"]];
    [playerTwoNameLabel setStringValue:[[playerArray[1] name] stringByAppendingString:@":"]];
    [playerThreeNameLabel setStringValue:[[playerArray[2] name] stringByAppendingString:@":"]];
    [playerFourNameLabel setStringValue:[[playerArray[3] name] stringByAppendingString:@":"]];
}

- (void)updateScoreLabels
{
    ELGPlayer *player = playerArray[0];
    [playerOneScoreLabel setStringValue:[@(player.roundPoints) stringValue]];
    player = playerArray[1];
    [playerTwoScoreLabel setStringValue:[@(player.roundPoints) stringValue]];
    player = playerArray[2];
    [playerThreeScoreLabel setStringValue:[@(player.roundPoints) stringValue]];
    player = playerArray[3];
    [playerFourScoreLabel setStringValue:[@(player.roundPoints) stringValue]];
}

- (BOOL)checkWinnerDuplicates
{
    int winnersCount = 0;
    for(int i = 0; i < 4; i++)
    {
        if([playerArray[i] roundWinner]){
            winnersCount++;
        }
    }
    if(winnersCount > 1)
        return true;
    else
        return false;
}

- (IBAction)playerOneCalculate:(id)sender
{
    if(!addScorePlayerOneController)
    {
        addScorePlayerOneController = [[ELGAddScorePlayerController alloc] initWithWindowNibName:@"ELGAddScorePlayerController" playerArray:playerArray playerInt:0];
    }
    [addScorePlayerOneController showWindow:self];
}

- (IBAction)playerTwoCalculate:(id)sender
{
    if(!addScorePlayerTwoController)
    {
        addScorePlayerTwoController = [[ELGAddScorePlayerController alloc] initWithWindowNibName:@"ELGAddScorePlayerController" playerArray:playerArray playerInt:1];
    }
    [addScorePlayerTwoController showWindow:self];
}

- (IBAction)playerThreeCalculate:(id)sender
{
    if(!addScorePlayerThreeController)
    {
        addScorePlayerThreeController = [[ELGAddScorePlayerController alloc] initWithWindowNibName:@"ELGAddScorePlayerController" playerArray:playerArray playerInt:2];
    }
    [addScorePlayerThreeController showWindow:self];
}

- (IBAction)playerFourCalculate:(id)sender
{
    if(!addScorePlayerFourController)
    {
        addScorePlayerFourController = [[ELGAddScorePlayerController alloc] initWithWindowNibName:@"ELGAddScorePlayerController" playerArray:playerArray playerInt:3];
    }
    [addScorePlayerFourController showWindow:self];
}

- (IBAction)submitButton:(id)sender
{
    // Check if more than one player has "winner" checked
    if([self checkWinnerDuplicates]){
        
        // Initializes errorLabel if it has not been initialized yet
        if(submitButtonCount == 0){
        NSTextField *errorLabel = [[NSTextField alloc] initWithFrame:CGRectMake(10, 10, 300, 27)];
        [errorLabel setStringValue:@"Error: more than one winner indicated"];
        [errorLabel setTextColor:[NSColor redColor]];
        [errorLabel setBezeled:NO];
        [errorLabel setDrawsBackground:NO];
        [errorLabel setEditable:NO];
        [errorLabel setSelectable:NO];
        [self.window.contentView addSubview:errorLabel];
        }
    }
    else {     
        [[NSNotificationCenter defaultCenter] postNotificationName:@"submitScores"
                                                            object:nil];        
        [self.window close];
        
    }
    submitButtonCount++;
    
}

@end
