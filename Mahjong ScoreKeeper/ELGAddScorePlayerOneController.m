//
//  ELGAddScorePlayerOneController.m
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import "ELGAddScorePlayerOneController.h"
#import "ELGDefinitions.h"
#import "ELGPlayer.h"

@interface ELGAddScorePlayerOneController ()

@end

@implementation ELGAddScorePlayerOneController
@synthesize playerArray;

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
}

#pragma mark - Action Methods
- (IBAction)doneButton:(id)sender
{
    [self calculateRoundPoints];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"donePlayerOne"
                                                        object:nil];
    
    [self.window close];
}

#pragma mark - Additional Helper Methods
- (void)calculateRoundPoints
{
    int tempRoundPoints = 0;
    // Gets values from inputted fields
    int OPRegularCount = [[[oPRegular selectedItem] title] integerValue];
    int OPOneOrNineCount = [[[oPOneOrNine selectedItem] title] integerValue];
    int OPWindCount = [[[oPWind selectedItem] title] integerValue];
    int OPDragonCount = [[[oPDragon selectedItem] title] integerValue];
    int OKRegularCount = [[[oKRegular selectedItem] title] integerValue];
    int OKOneOrNineCount = [[[oKOneOrNine selectedItem] title] integerValue];
    int OKWindCount = [[[oKWind selectedItem] title] integerValue];
    int OKDragonCount = [[[oKDragon selectedItem] title] integerValue];
    int CPRegularCount = [[[cPRegular selectedItem] title] integerValue];
    int CPOneOrNineCount = [[[cPOneOrNine selectedItem] title] integerValue];
    int CPWindCount = [[[cPWind selectedItem] title] integerValue];
    int CPDragonCount = [[[cPDragon selectedItem] title] integerValue];
    int CKRegularCount = [[[cKRegular selectedItem] title] integerValue];
    int CKOneOrNineCount = [[[cKOneOrNine selectedItem] title] integerValue];
    int CKWindCount = [[[cKWind selectedItem] title] integerValue];
    int CKDragonCount = [[[cKDragon selectedItem] title] integerValue];
    tempRoundPoints
    = (OPRegularCount * OP_REGULAR)
    + (OPOneOrNineCount * OP_ONEORNINE)
    + (OPDragonCount * OP_DRAGON)
    + (OPWindCount * OP_WIND)
    + (OKRegularCount * OK_REGULAR)
    + (OKOneOrNineCount * OK_ONEORNINE)
    + (OKDragonCount * OK_DRAGON)
    + (OKWindCount * OK_WIND)
    + (CPRegularCount * CP_REGULAR)
    + (CPOneOrNineCount * CP_ONEORNINE)
    + (CPDragonCount * CP_DRAGON)
    + (CPWindCount * CP_WIND)
    + (CKRegularCount * CK_REGULAR)
    + (CKOneOrNineCount * CK_ONEORNINE)
    + (CKDragonCount * CK_DRAGON)
    + (CKWindCount * CK_WIND);
    
    ELGPlayer *player = playerArray[0];
    BOOL winner = [winnerOfRound isEnabled];
    [player setRoundWinner:winner];
    if ([winnerOfRound isEnabled]) {
        tempRoundPoints = tempRoundPoints + 10;
    }
    if ([zeroPoints isEnabled]) {
        tempRoundPoints = 20;
    }
    if ([drawThemselves isEnabled]) {
        tempRoundPoints = tempRoundPoints + 2;
    }
    if ([onlyWinningPiece isEnabled]) {
        tempRoundPoints = tempRoundPoints + 2;
    }
    int flowerCount = [[[flowers selectedItem] title] integerValue];
    tempRoundPoints = tempRoundPoints + (flowerCount * FLOWER);
    int dragonWindPairCount = [[[dWPair selectedItem] title] integerValue];
    tempRoundPoints = tempRoundPoints + (dragonWindPairCount * DWPAIR);
    int ownFlowerCount = [[[ownFlowers selectedItem] title] integerValue];
    if (ownFlowerCount > 0) {
        tempRoundPoints = tempRoundPoints * (ownFlowerCount * OWNFLOWER);
    }
    int pkDragonCount = [[[pKDragon selectedItem] title] integerValue];
    if (pkDragonCount > 0) {
        tempRoundPoints = tempRoundPoints * (pkDragonCount * PKDRAGON);
    }
    if ([pKOwnWind state] == TRUE) {
        tempRoundPoints = tempRoundPoints * 2;
    }
    if ([groupAndDW isEnabled]) {
        tempRoundPoints = tempRoundPoints * 2;
    }
    if ([noStraights isEnabled]) {
        tempRoundPoints = tempRoundPoints * 2;
    }
    if ([singleGroup isEnabled]) {
        tempRoundPoints = tempRoundPoints * 6;
    }
    if ([fromDeadWall isEnabled]) {
        tempRoundPoints = tempRoundPoints * 2;
    }
    if ([lastPossiblePiece isEnabled]) {
        tempRoundPoints = tempRoundPoints * 2;
    }
    if ([firstCardFromWall isEnabled]) {
        tempRoundPoints = 300;
    }
    if ([firstDiscardedPiece isEnabled]) {
        tempRoundPoints = 300;
    }
    
    player.roundPoints = tempRoundPoints;
    [playerArray replaceObjectAtIndex:0 withObject:player];
}

@end
