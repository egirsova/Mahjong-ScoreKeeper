//
//  ELGEndGameController.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/26/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ELGEndGameController : NSWindowController
{
    IBOutlet NSTextField *playerOneName;
    IBOutlet NSTextField *playerTwoName;
    IBOutlet NSTextField *playerThreeName;
    IBOutlet NSTextField *playerFourName;
    
    IBOutlet NSTextField *playerOneRoundsWon;
    IBOutlet NSTextField *playerTwoRoundsWon;
    IBOutlet NSTextField *playerThreeRoundsWon;
    IBOutlet NSTextField *playerFourRoundsWon;
    
    IBOutlet NSTextField *playerOneTotalPoints;
    IBOutlet NSTextField *playerTwoTotalPoints;
    IBOutlet NSTextField *playerThreeTotalPoints;
    IBOutlet NSTextField *playerFourTotalPoints;
}
@property (nonatomic) NSMutableArray *playerArray;

- (id)initWithWindowNibName:(NSString *)windowNibName playerArray:(NSMutableArray *)array;

- (IBAction)quitGame:(id)selector;

- (void)initializeAllLabels;
- (void)rankPlayers;

@end
