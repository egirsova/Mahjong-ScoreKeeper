//
//  ELGAddScorePlayerOneController.m
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import "ELGAddScorePlayerController.h"
#import "ELGDefinitions.h"
#import "ELGPlayer.h"

@interface ELGAddScorePlayerController ()

@end

@implementation ELGAddScorePlayerController
@synthesize playerArray;
@synthesize playerInt;

#pragma mark - Initialization
- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

// Overrides the typical initWithWindowNibName to also read in the playerArray
- (id)initWithWindowNibName:(NSString *)windowNibName playerArray:(NSMutableArray *)array playerInt:(int)player
{
    self = [super initWithWindowNibName:windowNibName];
    if (self) {
        self.playerArray = array;
        self.playerInt = player;
        
        // Initializes prefs so it can read values from it
        prefs = [NSUserDefaults standardUserDefaults];
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self initializePopUpButtons];
}

#pragma mark - Action Methods
- (IBAction)doneButton:(id)sender
{
    [self calculateRoundPoints];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"doneAddScore"
                                                        object:nil];
    
    [self.window close];
}

#pragma mark - Additional Helper Methods
- (void)initializePopUpButtons
{
    // Open Pong PopUp Buttons
    [oPRegular removeAllItems];
    [oPRegular addItemWithTitle:@"0"];
    [oPRegular addItemWithTitle:@"1"];
    [oPRegular addItemWithTitle:@"2"];
    [oPRegular addItemWithTitle:@"3"];
    [oPRegular addItemWithTitle:@"4"];
    
    [oPOneOrNine removeAllItems];
    [oPOneOrNine addItemWithTitle:@"0"];
    [oPOneOrNine addItemWithTitle:@"1"];
    [oPOneOrNine addItemWithTitle:@"2"];
    [oPOneOrNine addItemWithTitle:@"3"];
    [oPOneOrNine addItemWithTitle:@"4"];
    
    [oPWind removeAllItems];
    [oPWind addItemWithTitle:@"0"];
    [oPWind addItemWithTitle:@"1"];
    [oPWind addItemWithTitle:@"2"];
    [oPWind addItemWithTitle:@"3"];
    [oPWind addItemWithTitle:@"4"];
    
    [oPDragon removeAllItems];
    [oPDragon addItemWithTitle:@"0"];
    [oPDragon addItemWithTitle:@"1"];
    [oPDragon addItemWithTitle:@"2"];
    [oPDragon addItemWithTitle:@"3"];
    [oPDragon addItemWithTitle:@"4"];
    
    // Closed Pong PopUp Buttons
    [cPRegular removeAllItems];
    [cPRegular addItemWithTitle:@"0"];
    [cPRegular addItemWithTitle:@"1"];
    [cPRegular addItemWithTitle:@"2"];
    [cPRegular addItemWithTitle:@"3"];
    [cPRegular addItemWithTitle:@"4"];
    
    [cPOneOrNine removeAllItems];
    [cPOneOrNine addItemWithTitle:@"0"];
    [cPOneOrNine addItemWithTitle:@"1"];
    [cPOneOrNine addItemWithTitle:@"2"];
    [cPOneOrNine addItemWithTitle:@"3"];
    [cPOneOrNine addItemWithTitle:@"4"];
    
    [cPWind removeAllItems];
    [cPWind addItemWithTitle:@"0"];
    [cPWind addItemWithTitle:@"1"];
    [cPWind addItemWithTitle:@"2"];
    [cPWind addItemWithTitle:@"3"];
    [cPWind addItemWithTitle:@"4"];
    
    [cPDragon removeAllItems];
    [cPDragon addItemWithTitle:@"0"];
    [cPDragon addItemWithTitle:@"1"];
    [cPDragon addItemWithTitle:@"2"];
    [cPDragon addItemWithTitle:@"3"];
    [cPDragon addItemWithTitle:@"4"];
    
    // Open Kong PopUp Buttons
    [oKRegular removeAllItems];
    [oKRegular addItemWithTitle:@"0"];
    [oKRegular addItemWithTitle:@"1"];
    [oKRegular addItemWithTitle:@"2"];
    [oKRegular addItemWithTitle:@"3"];
    [oKRegular addItemWithTitle:@"4"];
    
    [oKOneOrNine removeAllItems];
    [oKOneOrNine addItemWithTitle:@"0"];
    [oKOneOrNine addItemWithTitle:@"1"];
    [oKOneOrNine addItemWithTitle:@"2"];
    [oKOneOrNine addItemWithTitle:@"3"];
    [oKOneOrNine addItemWithTitle:@"4"];
    
    [oKWind removeAllItems];
    [oKWind addItemWithTitle:@"0"];
    [oKWind addItemWithTitle:@"1"];
    [oKWind addItemWithTitle:@"2"];
    [oKWind addItemWithTitle:@"3"];
    [oKWind addItemWithTitle:@"4"];
    
    [oKDragon removeAllItems];
    [oKDragon addItemWithTitle:@"0"];
    [oKDragon addItemWithTitle:@"1"];
    [oKDragon addItemWithTitle:@"2"];
    [oKDragon addItemWithTitle:@"3"];
    [oKDragon addItemWithTitle:@"4"];
    
    // Closed Kong PopUp Buttons
    [cKRegular removeAllItems];
    [cKRegular addItemWithTitle:@"0"];
    [cKRegular addItemWithTitle:@"1"];
    [cKRegular addItemWithTitle:@"2"];
    [cKRegular addItemWithTitle:@"3"];
    [cKRegular addItemWithTitle:@"4"];
    
    [cKOneOrNine removeAllItems];
    [cKOneOrNine addItemWithTitle:@"0"];
    [cKOneOrNine addItemWithTitle:@"1"];
    [cKOneOrNine addItemWithTitle:@"2"];
    [cKOneOrNine addItemWithTitle:@"3"];
    [cKOneOrNine addItemWithTitle:@"4"];
    
    [cKWind removeAllItems];
    [cKWind addItemWithTitle:@"0"];
    [cKWind addItemWithTitle:@"1"];
    [cKWind addItemWithTitle:@"2"];
    [cKWind addItemWithTitle:@"3"];
    [cKWind addItemWithTitle:@"4"];
    
    [cKDragon removeAllItems];
    [cKDragon addItemWithTitle:@"0"];
    [cKDragon addItemWithTitle:@"1"];
    [cKDragon addItemWithTitle:@"2"];
    [cKDragon addItemWithTitle:@"3"];
    [cKDragon addItemWithTitle:@"4"];
    
    // Additional Points Buttons
    [dWPair removeAllItems];
    [dWPair addItemWithTitle:@"0"];
    [dWPair addItemWithTitle:@"1"];
    [dWPair addItemWithTitle:@"2"];
    [dWPair addItemWithTitle:@"3"];
    [dWPair addItemWithTitle:@"4"];
    
    [pKDragon removeAllItems];
    [pKDragon addItemWithTitle:@"0"];
    [pKDragon addItemWithTitle:@"1"];
    [pKDragon addItemWithTitle:@"2"];
    [pKDragon addItemWithTitle:@"3"];
    
    [flowers removeAllItems];
    [flowers addItemWithTitle:@"0"];
    [flowers addItemWithTitle:@"1"];
    [flowers addItemWithTitle:@"2"];
    [flowers addItemWithTitle:@"3"];
    [flowers addItemWithTitle:@"4"];
    [flowers addItemWithTitle:@"5"];
    [flowers addItemWithTitle:@"6"];
    [flowers addItemWithTitle:@"7"];
    [flowers addItemWithTitle:@"8"];
    
    [ownFlowers removeAllItems];
    [ownFlowers addItemWithTitle:@"0"];
    [ownFlowers addItemWithTitle:@"1"];
    [ownFlowers addItemWithTitle:@"2"];
    
}

- (void)calculateRoundPoints
{
    NSInteger tempRoundPoints = 0;
    // Gets values from inputted fields
    NSInteger OPRegularCount = [[[oPRegular selectedItem] title] integerValue];
    NSInteger OPOneOrNineCount = [[[oPOneOrNine selectedItem] title] integerValue];
    NSInteger OPWindCount = [[[oPWind selectedItem] title] integerValue];
    NSInteger OPDragonCount = [[[oPDragon selectedItem] title] integerValue];
    NSInteger OKRegularCount = [[[oKRegular selectedItem] title] integerValue];
    NSInteger OKOneOrNineCount = [[[oKOneOrNine selectedItem] title] integerValue];
    NSInteger OKWindCount = [[[oKWind selectedItem] title] integerValue];
    NSInteger OKDragonCount = [[[oKDragon selectedItem] title] integerValue];
    NSInteger CPRegularCount = [[[cPRegular selectedItem] title] integerValue];
    NSInteger CPOneOrNineCount = [[[cPOneOrNine selectedItem] title] integerValue];
    NSInteger CPWindCount = [[[cPWind selectedItem] title] integerValue];
    NSInteger CPDragonCount = [[[cPDragon selectedItem] title] integerValue];
    NSInteger CKRegularCount = [[[cKRegular selectedItem] title] integerValue];
    NSInteger CKOneOrNineCount = [[[cKOneOrNine selectedItem] title] integerValue];
    NSInteger CKWindCount = [[[cKWind selectedItem] title] integerValue];
    NSInteger CKDragonCount = [[[cKDragon selectedItem] title] integerValue];
    tempRoundPoints
    = (OPRegularCount * [[prefs stringForKey:@"openPongRegular"] intValue])
    + (OPOneOrNineCount * [[prefs stringForKey:@"openPongOneOrNine"] intValue])
    + (OPDragonCount * [[prefs stringForKey:@"openPongDragon"] intValue])
    + (OPWindCount * [[prefs stringForKey:@"openPongWind"] intValue])
    + (OKRegularCount * [[prefs stringForKey:@"openKongRegular"] intValue])
    + (OKOneOrNineCount * [[prefs stringForKey:@"openKongOneOrNine"] intValue])
    + (OKDragonCount * [[prefs stringForKey:@"openKongDragon"] intValue])
    + (OKWindCount * [[prefs stringForKey:@"openKongWind"] intValue])
    + (CPRegularCount * [[prefs stringForKey:@"closedPongRegular"] intValue])
    + (CPOneOrNineCount * [[prefs stringForKey:@"closedPongOneOrNine"] intValue])
    + (CPDragonCount * [[prefs stringForKey:@"closedPongDragon"] intValue])
    + (CPWindCount * [[prefs stringForKey:@"closedPongWind"] intValue])
    + (CKRegularCount * [[prefs stringForKey:@"closedKongRegular"] intValue])
    + (CKOneOrNineCount * [[prefs stringForKey:@"closedKongOneOrNine"] intValue])
    + (CKDragonCount * [[prefs stringForKey:@"closedKongDragon"] intValue])
    + (CKWindCount * [[prefs stringForKey:@"closedKongWind"] intValue]);
    
    BOOL winner = [winnerOfRound state] == NSOnState;
    [playerArray[playerInt] setRoundWinner:winner];
    
    if ([winnerOfRound state] == NSOnState) {
        tempRoundPoints = tempRoundPoints + [[prefs stringForKey:@"winner"] intValue];
        int roundsWon = [playerArray[playerInt] roundsWon];
        roundsWon++;
        [playerArray[playerInt] setRoundsWon:roundsWon];
    }
    if ([zeroPoints state] == NSOnState) {
        tempRoundPoints = [[prefs stringForKey:@"winnerZeroPoints"] intValue];
    }
    if ([drawThemselves state] == NSOnState) {
        tempRoundPoints = tempRoundPoints + 2;
    }
    if ([onlyWinningPiece state] == NSOnState) {
        tempRoundPoints = tempRoundPoints + 2;
    }
    NSInteger flowerCount = [[[flowers selectedItem] title] integerValue];
    tempRoundPoints = tempRoundPoints + (flowerCount * [[prefs stringForKey:@"flower"] intValue]);
    NSInteger dragonWindPairCount = [[[dWPair selectedItem] title] integerValue];
    tempRoundPoints = tempRoundPoints + (dragonWindPairCount * DWPAIR);
    NSInteger ownFlowerCount = [[[ownFlowers selectedItem] title] integerValue];
    
    if([prefs boolForKey:@"doublePointsOwnFlower"]){
        if (ownFlowerCount > 0) {
            tempRoundPoints = tempRoundPoints * (ownFlowerCount * OWNFLOWER);
        }
    }
    
    NSInteger pkDragonCount = [[[pKDragon selectedItem] title] integerValue];
    if (pkDragonCount > 0) {
        tempRoundPoints = tempRoundPoints * (pkDragonCount * PKDRAGON);
    }
    
    if ([pKOwnWind state] == NSOnState) {
        tempRoundPoints = tempRoundPoints * 2;
    }
    
    if ([groupAndDW state] == NSOnState) {
        tempRoundPoints = tempRoundPoints * 2;
    }
    
    if ([noStraights state] == NSOnState) {
        tempRoundPoints = tempRoundPoints * 2;
    }
    
    if ([singleGroup state] == NSOnState) {
        tempRoundPoints = tempRoundPoints * 6;
    }
    
    if ([fromDeadWall state] == NSOnState) {
        tempRoundPoints = tempRoundPoints * 2;
    }
    
    if ([lastPossiblePiece state] == NSOnState) {
        tempRoundPoints = tempRoundPoints * 2;
    }
    
    if ([firstCardFromWall state] == NSOnState) {
        tempRoundPoints = 300;
    }
    
    if ([firstDiscardedPiece state] == NSOnState) {
        tempRoundPoints = 300;
    }
    
    if([playerArray[playerInt] wind] == EAST){
        if([prefs boolForKey:@"doublePointsWinEast"]){
            if([winnerOfRound state] == NSOnState){
                tempRoundPoints = tempRoundPoints*2;
            } else{
                tempRoundPoints = tempRoundPoints/2;
            }
        }
    }
    
    if([prefs boolForKey:@"limitMaxPoints"]){
        int limit = [[prefs stringForKey:@"limit"] intValue];
        if(tempRoundPoints >= limit){
            tempRoundPoints = limit;
        }
    }
    
    [playerArray[playerInt] setRoundPoints:tempRoundPoints];
    
}

@end
