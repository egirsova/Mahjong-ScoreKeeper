//
//  ELGAddPlayersController.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class ELGPlayer;
@class ELGMainWindowController;

@interface ELGAddPlayersController : NSWindowController
{
    ELGMainWindowController *mainWindowController;
    
    IBOutlet NSTextField *playerOneNameTF;
    IBOutlet NSTextField *playerTwoNameTF;
    IBOutlet NSTextField *playerThreeNameTF;
    IBOutlet NSTextField *playerFourNameTF;
    
    IBOutlet NSPopUpButton *playerOneWindPU;
    IBOutlet NSPopUpButton *playerTwoWindPU;
    IBOutlet NSPopUpButton *playerThreeWindPU;
    IBOutlet NSPopUpButton *playerFourWindPU;
    
    int startGameButtonCount;
}

@property (nonatomic) NSMutableArray *playerArray;

- (IBAction)submitButtonPressed:(id)sender;
- (void)populatePopUpButtons;
- (BOOL)checkOverlap;
- (BOOL)namesNotEntered;
- (int)stringWindToInt:(NSString *)wind;
- (void)initializePlayers;


@end
