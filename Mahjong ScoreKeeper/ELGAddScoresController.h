//
//  ELGAddScoresController.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class ELGAddScorePlayerController;

@interface ELGAddScoresController : NSWindowController
{
    // Separate instances for each players
    ELGAddScorePlayerController *addScorePlayerOneController;
    ELGAddScorePlayerController *addScorePlayerTwoController;
    ELGAddScorePlayerController *addScorePlayerThreeController;
    ELGAddScorePlayerController *addScorePlayerFourController;
    
    IBOutlet NSTextField *playerOneNameLabel;
    IBOutlet NSTextField *playerTwoNameLabel;
    IBOutlet NSTextField *playerThreeNameLabel;
    IBOutlet NSTextField *playerFourNameLabel;
    
    IBOutlet NSTextField *playerOneScoreLabel;
    IBOutlet NSTextField *playerTwoScoreLabel;
    IBOutlet NSTextField *playerThreeScoreLabel;
    IBOutlet NSTextField *playerFourScoreLabel;
    
    IBOutlet NSTextField *roundCountLabel;
    int submitButtonCount;
}

@property (nonatomic) NSMutableArray *playerArray;

- (id)initWithWindowNibName:(NSString *)windowNibName playerArray:(NSMutableArray *)array;

- (IBAction)playerOneCalculate:(id)sender;
- (IBAction)playerTwoCalculate:(id)sender;
- (IBAction)playerThreeCalculate:(id)sender;
- (IBAction)playerFourCalculate:(id)sender;
- (IBAction)submitButton:(id)sender;

- (void)updateNameLabels;
- (void)updateScoreLabels;
- (BOOL)checkWinnerDuplicates;

@end
