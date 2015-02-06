//
//  ELGSettingsViewController.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 2/5/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class ELGPreferencePaneController;

@interface ELGSettingsViewController : NSViewController
{
    // Open Pong TextField
    IBOutlet NSTextField *oPRegular;
    IBOutlet NSTextField *oPOneOrNine;
    IBOutlet NSTextField *oPWind;
    IBOutlet NSTextField *oPDragon;
    
    // Closed Pong TextField
    IBOutlet NSTextField *cPRegular;
    IBOutlet NSTextField *cPOneOrNine;
    IBOutlet NSTextField *cPWind;
    IBOutlet NSTextField *cPDragon;
    
    // Open Kong TextField
    IBOutlet NSTextField *oKRegular;
    IBOutlet NSTextField *oKOneOrNine;
    IBOutlet NSTextField *oKWind;
    IBOutlet NSTextField *oKDragon;
    
    // Closed Kong TextField
    IBOutlet NSTextField *cKRegular;
    IBOutlet NSTextField *cKOneOrNine;
    IBOutlet NSTextField *cKWind;
    IBOutlet NSTextField *cKDragon;
    
    // Additional Points
    IBOutlet NSTextField *mahjong;
    IBOutlet NSTextField *zeroPointsMahjong;
    IBOutlet NSTextField *perFlowers;
    IBOutlet NSButton *doublePointsEast;
    IBOutlet NSButton *limitMaxPoints;
    IBOutlet NSTextField *limit;
    
    NSUserDefaults *prefs;
    
    
}
@property (nonatomic) ELGPreferencePaneController *parentWindow;

- (IBAction)limitTurnedOff:(id)sender;
- (IBAction)submitChangesButton:(id)sender;
- (IBAction)resetToDefaults:(id)sender;

@end
