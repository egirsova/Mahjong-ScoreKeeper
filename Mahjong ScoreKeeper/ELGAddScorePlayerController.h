//
//  ELGAddScorePlayerOneController.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ELGAddScorePlayerController : NSWindowController
{
    // Open Pong PopUp Buttons
    IBOutlet NSPopUpButton *oPRegular;
    IBOutlet NSPopUpButton *oPOneOrNine;
    IBOutlet NSPopUpButton *oPWind;
    IBOutlet NSPopUpButton *oPDragon;
    
    // Closed Pong PopUp Buttons
    IBOutlet NSPopUpButton *cPRegular;
    IBOutlet NSPopUpButton *cPOneOrNine;
    IBOutlet NSPopUpButton *cPWind;
    IBOutlet NSPopUpButton *cPDragon;
    
    // Open Kong PopUp Buttons
    IBOutlet NSPopUpButton *oKRegular;
    IBOutlet NSPopUpButton *oKOneOrNine;
    IBOutlet NSPopUpButton *oKWind;
    IBOutlet NSPopUpButton *oKDragon;
    
    // Closed Kong PopUp Buttons
    IBOutlet NSPopUpButton *cKRegular;
    IBOutlet NSPopUpButton *cKOneOrNine;
    IBOutlet NSPopUpButton *cKWind;
    IBOutlet NSPopUpButton *cKDragon;
    
    // Additional Points Buttons
    IBOutlet NSPopUpButton *dWPair;
    IBOutlet NSPopUpButton *pKDragon;
    IBOutlet NSButton *pKOwnWind;
    IBOutlet NSPopUpButton *flowers;
    IBOutlet NSPopUpButton *ownFlowers;
    
    // Winning Hand Only Buttons
    IBOutlet NSButton *winnerOfRound;
    IBOutlet NSButton *zeroPoints;
    IBOutlet NSButton *noStraights;
    IBOutlet NSButton *groupAndDW;
    IBOutlet NSButton *singleGroup;
    IBOutlet NSButton *lastPossiblePiece;
    IBOutlet NSButton *fromDeadWall;
    IBOutlet NSButton *drawThemselves;
    IBOutlet NSButton *onlyWinningPiece;
    IBOutlet NSButton *firstCardFromWall;
    IBOutlet NSButton *firstDiscardedPiece;
}
@property (nonatomic) NSMutableArray *playerArray;
@property (nonatomic) int playerInt;

- (id)initWithWindowNibName:(NSString *)windowNibName playerArray:(NSMutableArray *)array playerInt:(int)player;

- (IBAction)doneButton:(id)sender;

- (void)initializePopUpButtons;
- (void)calculateRoundPoints;

@end
