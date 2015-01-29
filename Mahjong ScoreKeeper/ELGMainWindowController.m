//
//  ELGMainWindowController.m
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import "ELGMainWindowController.h"
#import "ELGDefinitions.h"
#import "ELGPlayer.h"
#import "ELGAddScoresController.h"
#import "ELGEndGameController.h"

@interface ELGMainWindowController ()

@end

@implementation ELGMainWindowController
@synthesize playerArray;
@synthesize scoresList;

#pragma mark - Initializers
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
        scoresList = [NSMutableArray array];
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self initializeLabels];
    NSString *roundStr = [NSString stringWithFormat:@"Round %d", [playerArray[0] roundsPlayed]];
    [roundCountLabel setStringValue:roundStr];
}

- (void)awakeFromNib
{
    // Listens to notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateAllNecessaryItems)
                                                 name:@"submitScores"
                                               object:nil];
}

# pragma mark - Additional Helper Methods
- (void)updateHistory
{
    for(int i = 0; i < 4; i++){
        ELGPlayer *player = [[ELGPlayer alloc] init];
        player = [playerArray[i] copy];
        [scoresList addObject:player];
    }
    // Creates a "dummy" player so that we have an empty row in-between rounds
    ELGPlayer *empty = [[ELGPlayer alloc] init];
    [empty setName:@""];
    [empty setWind:-1];
    [empty setRoundsPlayed:0];
    [empty setRoundPoints:0];
    [empty setRoundsWon:0];
    [empty setTotalPoints:0];
    [scoresList addObject:empty];
    [roundHistory reloadData];
    
}

- (void)updatePlayerScores
{
    for(int i = 0; i < 4; i++){
        int totalPoints = [playerArray[i] totalPoints]+[playerArray[i] roundPoints];
        [playerArray[i] setTotalPoints:totalPoints];
    }
}

- (void)initializeLabels
{
    [self setWindLabels];
    [self updateScoreLabels];
}

- (void)updateAllNecessaryItems
{
    // Update Scores
    [self updatePlayerScores];
    
    // Update Round History Table
    [self updateHistory];
    
    // Update Winds
    [self updatePlayerWinds];
    
    [self updateRoundCount];
    
    // Update Labels
    [self setWindLabels];
    [self updateScoreLabels];
    NSString *roundStr = [NSString stringWithFormat:@"Round %d", [playerArray[0] roundsPlayed]];
    [roundCountLabel setStringValue:roundStr];
    
    // Set All roundWinners to FALSE
    for (int i = 0; i < 4; i++)
    {
        if([playerArray[i] roundWinner])
            [playerArray[i] setRoundWinner:FALSE];
    }
    
    // Set All roundPoints to 0
    for (int i = 0; i < 4; i++)
    {
        [playerArray[i] setRoundPoints:0];
    }
    
    [self rotateCompass];
    
}

- (void)setWindLabels
{
    for (int i = 0; i < 4; i++){
        ELGPlayer *player = [playerArray objectAtIndex:i];
        int windInt = player.wind;
        NSString *name = player.name;
        switch(windInt){
            case EAST:
                [eastPlayerNameLabel setStringValue:name];
                break;
            case NORTH:
                [northPlayerNameLabel setStringValue:name];
                break;
            case WEST:
                [westPlayerNameLabel setStringValue:name];
                break;
            case SOUTH:
                [southPlayerNameLabel setStringValue:name];
                break;
                
        }
    }
}

- (NSString *)convertWindToString:(int)wind
{
    switch(wind)
    {
        case EAST:
            return @"East";
            break;
        case NORTH:
            return @"North";
            break;
        case WEST:
            return @"West";
            break;
        case SOUTH:
            return @"South";
            break;
    }
    
}

- (void)updateScoreLabels
{
    for (int i = 0; i < 4; i++){
        ELGPlayer *player = playerArray[i];
        int windInt = player.wind;
        int totalScore = player.totalPoints;
        NSString *scoreString = @"Score: ";
        NSString *totalScoreString = [@(totalScore) stringValue];
        switch(windInt){
            case EAST:
                [eastPlayerScoreLabel setStringValue:[scoreString stringByAppendingString:totalScoreString]];
                break;
            case NORTH:
                [northPlayerScoreLabel setStringValue:[scoreString stringByAppendingString:totalScoreString]];
                break;
            case WEST:
                [westPlayerScoreLabel setStringValue:[scoreString stringByAppendingString:totalScoreString]];
                break;
            case SOUTH:
                [southPlayerScoreLabel setStringValue:[scoreString stringByAppendingString:totalScoreString]];
                break;
                
        }
    }
}

- (void)updatePlayerWinds
{
    // Does not update player winds if the East player is the round winner
    for(int i = 0; i < 4; i++){
        if([playerArray[i] roundWinner] && [playerArray[i] wind] == EAST)
            return;
    }
    // Else updates the winds
    for (int i = 0; i < 4; i++) {
        switch ([playerArray[i] wind]) {
            case EAST:
                [playerArray[i] setWind:SOUTH];
                break;
            case NORTH:
                [playerArray[i] setWind:EAST];
                break;
            case WEST:
                [playerArray[i] setWind:NORTH];
                break;
            case SOUTH:
                [playerArray[i] setWind:WEST];
                break;
        }
    }
}

- (void)updateRoundCount
{
    for(int i = 0; i < 4; i++){
        int rounds = [playerArray[i] roundsPlayed];
        rounds++;
        [playerArray[i] setRoundsPlayed:rounds];
    }
}

- (void)rotateCompass
{
    [compass rotateByAngle:(90)];
}

- (void)closeAddScoresController
{
    addScoresController = nil;
}

#pragma mark - Action Methods
- (IBAction)addScoresButton:(id)sender
{
    // Makes sure to instantiate a new addScoresController each time
    if(addScoresController){
        [self closeAddScoresController];
    }
    if(!addScoresController){
        addScoresController = [[ELGAddScoresController alloc] initWithWindowNibName:@"ELGAddScoresController" playerArray:playerArray];
    }
    [addScoresController showWindow:self];
    
}

- (IBAction)endGameButton:(id)sender
{
    if(!endGameController){
        endGameController = [[ELGEndGameController alloc] initWithWindowNibName:@"ELGEndGameController" playerArray:playerArray];
    }
    [endGameController showWindow:self];
}

#pragma mark - Data Source Methods
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv
{
    // The number of entries in table view should be same as number of roundsPlayed *5
    return [scoresList count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    ELGPlayer *player = [scoresList objectAtIndex:row];
    
    NSString *identifier = [tableColumn identifier];
    
    // Takes care of formatting when player is winner
    if([identifier isEqual:@"name"] && [player roundWinner])
    {
        NSString *asterisk = @"*";
        NSString *oldName = [player valueForKey:identifier];
        NSString *newName = [asterisk stringByAppendingString:oldName];
        return newName;
    }
    
    if([identifier isEqual:@"wind"]){
        // Takes care of "empty row" case
        if([player wind] == -1)
            return @"";
        else{
            NSString *w = [self convertWindToString:[player wind]];
            return w;
        }
    }
    
    // Takes care of the "empty row" case
    if([identifier isEqual:@"roundPoints"] && [[player name] isEqual:@""])
    {
        return @"";
    }
    
    if([identifier isEqual:@"totalPoints"] && [[player name] isEqual:@""])
    {
        return @"";
    }
    
    return [player valueForKey:identifier];
}


@end
