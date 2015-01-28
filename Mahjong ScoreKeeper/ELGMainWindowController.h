//
//  ELGMainWindowController.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class ELGAddScoresController;
@class ELGEndGameController;

@interface ELGMainWindowController : NSWindowController

{    
    ELGAddScoresController *addScoresController;
    ELGEndGameController *endGameController;
    
    IBOutlet NSTextField *northPlayerNameLabel;
    IBOutlet NSTextField *southPlayerNameLabel;
    IBOutlet NSTextField *eastPlayerNameLabel;
    IBOutlet NSTextField *westPlayerNameLabel;
    
    IBOutlet NSTextField *northPlayerScoreLabel;
    IBOutlet NSTextField *southPlayerScoreLabel;
    IBOutlet NSTextField *eastPlayerScoreLabel;
    IBOutlet NSTextField *westPlayerScoreLabel;
    
    IBOutlet NSTextView *roundHistory;
    IBOutlet NSTextField *roundCountLabel;
    
    IBOutlet NSImageView *compass;
}

@property (nonatomic) NSMutableArray *playerArray;

- (id)initWithWindowNibName:(NSString *)windowNibName playerArray:(NSMutableArray *)array;

- (void)updateHistory;
- (void)appendToTextView:(NSString *)text;
- (void)updatePlayerScores;
- (void)updateAllNecessaryItems;
- (void)initializeLabels;
- (void)setWindLabels;
- (void)updatePlayerWinds;
- (void)updateRoundCount;
- (NSString *)convertWindToString:(int)wind;
- (void)updateScoreLabels;
- (void)closeAddScoresController;
- (void)rotateCompass;

- (IBAction)addScoresButton:(id)sender;
- (IBAction)endGameButton:(id)sender;

@end
