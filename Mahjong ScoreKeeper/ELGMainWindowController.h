//
//  ELGMainWindowController.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class ELGAddScoresController;

@interface ELGMainWindowController : NSWindowController

{    
    ELGAddScoresController *addScoresController;
    
    IBOutlet NSTextField *northPlayerNameLabel;
    IBOutlet NSTextField *southPlayerNameLabel;
    IBOutlet NSTextField *eastPlayerNameLabel;
    IBOutlet NSTextField *westPlayerNameLabel;
    
    IBOutlet NSTextField *northPlayerScoreLabel;
    IBOutlet NSTextField *southPlayerScoreLabel;
    IBOutlet NSTextField *eastPlayerScoreLabel;
    IBOutlet NSTextField *westPlayerScoreLabel;
}

@property (nonatomic) NSMutableArray *playerArray;

- (id)initWithWindowNibName:(NSString *)windowNibName playerArray:(NSMutableArray *)array;

@end
