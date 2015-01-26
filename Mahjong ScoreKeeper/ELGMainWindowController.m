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

@interface ELGMainWindowController ()

@end

@implementation ELGMainWindowController
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
    [self updateAllLabels];
}

- (void)updateAllLabels
{
    [self setWindLabels];
    [self updateScoreLabels];
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

- (void)updateScoreLabels
{
    for (int i = 0; i < 4; i++){
        ELGPlayer *player = [playerArray objectAtIndex:i];
        int windInt = player.wind;
        NSString *name = player.name;
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

- (IBAction)addScoresButton:(id)sender
{
    if(!addScoresController){
        addScoresController = [[ELGAddScoresController alloc] initWithWindowNibName:@"ELGAddScoresController" playerArray:playerArray];
    }
    [addScoresController showWindow:self];
    
}


@end
