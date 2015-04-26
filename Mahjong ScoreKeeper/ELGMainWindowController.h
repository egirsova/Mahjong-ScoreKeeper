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
@class ELGPlayer;

@interface ELGMainWindowController : NSWindowController <NSTableViewDataSource>

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
    
    IBOutlet NSTableView *roundHistory;
    IBOutlet NSTextField *roundCountLabel;
    
    IBOutlet NSImageView *_compass;
    
    int rotation;
    
}

@property (nonatomic) NSMutableArray *playerArray;
@property (nonatomic) NSMutableArray *scoresList;

- (id)initWithWindowNibName:(NSString *)windowNibName playerArray:(NSMutableArray *)array;

- (void)updateHistory;
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
