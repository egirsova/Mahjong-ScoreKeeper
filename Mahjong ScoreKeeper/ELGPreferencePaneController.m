//
//  ELGPreferencePaneController.m
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/30/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import "ELGPreferencePaneController.h"
#import "ELGDefinitions.h"

@interface ELGPreferencePaneController ()

@end

@implementation ELGPreferencePaneController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        
        // Initializes user preferences
        prefs = [NSUserDefaults standardUserDefaults];
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Populate user interface based on user default preferences
    [oPRegular setStringValue:[prefs stringForKey:@"openPongRegular"]];
    [oPOneOrNine setStringValue:[prefs stringForKey:@"openPongOneOrNine"]];
    [oPWind setStringValue:[prefs stringForKey:@"openPongWind"]];
    [oPDragon setStringValue:[prefs stringForKey:@"openPongDragon"]];
    
    [cPRegular setStringValue:[prefs stringForKey:@"closedPongRegular"]];
    [cPOneOrNine setStringValue:[prefs stringForKey:@"closedPongOneOrNine"]];
    [cPWind setStringValue:[prefs stringForKey:@"closedPongWind"]];
    [cPDragon setStringValue:[prefs stringForKey:@"closedPongDragon"]];
    
    [oKRegular setStringValue:[prefs stringForKey:@"openKongRegular"]];
    [oKOneOrNine setStringValue:[prefs stringForKey:@"openKongOneOrNine"]];
    [oKWind setStringValue:[prefs stringForKey:@"openKongWind"]];
    [oKDragon setStringValue:[prefs stringForKey:@"openKongDragon"]];
    
    [cKRegular setStringValue:[prefs stringForKey:@"closedKongRegular"]];
    [cKOneOrNine setStringValue:[prefs stringForKey:@"closedKongOneOrNine"]];
    [cKWind setStringValue:[prefs stringForKey:@"closedKongWind"]];
    [cKDragon setStringValue:[prefs stringForKey:@"closedKongDragon"]];
    
    [mahjong setStringValue:[prefs stringForKey:@"winner"]];
    [zeroPointsMahjong setStringValue:[prefs stringForKey:@"winnerZeroPoints"]];
    [perFlowers setStringValue:[prefs stringForKey:@"flower"]];
    [doublePointsEast setState:[prefs boolForKey:@"doublePointsWinEast"]];
    [limitMaxPoints setState:[prefs boolForKey:@"limitMaxPoints"]];
    [limit setStringValue:[prefs stringForKey:@"limit"]];
    
    if([limitMaxPoints state] ==  NSOffState){
        [limit setEnabled:NO];
    } else {
        [limit setEnabled:YES];
    }
}

- (IBAction)submitChangesButton:(id)sender
{
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Are you sure you want to submit changes?"];
    [alert addButtonWithTitle:@"Continue"];
    [alert addButtonWithTitle:@"Cancel"];
    [alert setAlertStyle:NSWarningAlertStyle];
    
    if ([alert runModal] == NSAlertFirstButtonReturn) {
        
        // Updates preferences object
        [prefs setObject:[oPRegular stringValue] forKey:@"openPongRegular"];
        [prefs setObject:[oPOneOrNine stringValue] forKey:@"openPongOneOrNine"];
        [prefs setObject:[oPWind stringValue] forKey:@"openPongWind"];
        [prefs setObject:[oPDragon stringValue] forKey:@"openPongDragon"];
        
        [prefs setObject:[cPRegular stringValue] forKey:@"closedPongRegular"];
        [prefs setObject:[cPOneOrNine stringValue] forKey:@"closedPongOneOrNine"];
        [prefs setObject:[cPWind stringValue] forKey:@"closedPongWind"];
        [prefs setObject:[cPDragon stringValue] forKey:@"closedPongDragon"];
        
        [prefs setObject:[oKRegular stringValue] forKey:@"openKongRegular"];
        [prefs setObject:[oKOneOrNine stringValue] forKey:@"openKongOneOrNine"];
        [prefs setObject:[oKWind stringValue] forKey:@"openKongWind"];
        [prefs setObject:[oKDragon stringValue] forKey:@"openKongDragon"];
        
        [prefs setObject:[cKRegular stringValue] forKey:@"closedKongRegular"];
        [prefs setObject:[cKOneOrNine stringValue] forKey:@"closedKongOneOrNine"];
        [prefs setObject:[cKWind stringValue] forKey:@"closedKongWind"];
        [prefs setObject:[cKDragon stringValue] forKey:@"closedKongDragon"];
        
        [prefs setObject:[mahjong stringValue] forKey:@"winner"];
        [prefs setObject:[zeroPointsMahjong stringValue] forKey:@"winnerZeroPoints"];
        [prefs setObject:[perFlowers stringValue] forKey:@"flower"];
        [prefs setBool:[doublePointsEast state] forKey:@"doublePointsWinEast"];
        [prefs setBool:[limitMaxPoints state] forKey:@"limitMaxPoints"];
        [prefs setObject:[limit stringValue] forKey:@"limit"];
        [prefs synchronize];
        
        [self.window close];
        
    } else {
        return;
    }
}

- (IBAction)limitTurnedOff:(id)sender
{
    if([limitMaxPoints state] ==  NSOffState){
        [limit setEnabled:NO];
    } else {
        [limit setEnabled:YES];
    }
}

- (IBAction)resetToDefaults:(id)sender
{
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Are you sure you want to reset to defaults?\nAll changes will be lost."];
    [alert addButtonWithTitle:@"Continue"];
    [alert addButtonWithTitle:@"Cancel"];
    [alert setAlertStyle:NSWarningAlertStyle];
    
    if ([alert runModal] == NSAlertFirstButtonReturn) {
        // Continue button clicked
        
        // Resets preferences
        NSDictionary *defaultsDict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
        for (NSString *key in [defaultsDict allKeys])
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        
        // Populate user interface based on user default preferences
        [oPRegular setStringValue:[prefs stringForKey:@"openPongRegular"]];
        [oPOneOrNine setStringValue:[prefs stringForKey:@"openPongOneOrNine"]];
        [oPWind setStringValue:[prefs stringForKey:@"openPongWind"]];
        [oPDragon setStringValue:[prefs stringForKey:@"openPongDragon"]];
        
        [cPRegular setStringValue:[prefs stringForKey:@"closedPongRegular"]];
        [cPOneOrNine setStringValue:[prefs stringForKey:@"closedPongOneOrNine"]];
        [cPWind setStringValue:[prefs stringForKey:@"closedPongWind"]];
        [cPDragon setStringValue:[prefs stringForKey:@"closedPongDragon"]];
        
        [oKRegular setStringValue:[prefs stringForKey:@"openKongRegular"]];
        [oKOneOrNine setStringValue:[prefs stringForKey:@"openKongOneOrNine"]];
        [oKWind setStringValue:[prefs stringForKey:@"openKongWind"]];
        [oKDragon setStringValue:[prefs stringForKey:@"openKongDragon"]];
        
        [cKRegular setStringValue:[prefs stringForKey:@"closedKongRegular"]];
        [cKOneOrNine setStringValue:[prefs stringForKey:@"closedKongOneOrNine"]];
        [cKWind setStringValue:[prefs stringForKey:@"closedKongWind"]];
        [cKDragon setStringValue:[prefs stringForKey:@"closedKongDragon"]];
        
        [mahjong setStringValue:[prefs stringForKey:@"winner"]];
        [zeroPointsMahjong setStringValue:[prefs stringForKey:@"winnerZeroPoints"]];
        [perFlowers setStringValue:[prefs stringForKey:@"flower"]];
        [doublePointsEast setState:[prefs boolForKey:@"doublePointsWinEast"]];
        [limitMaxPoints setState:[prefs boolForKey:@"limitMaxPoints"]];
        [limit setStringValue:[prefs stringForKey:@"limit"]];
        
        if([limitMaxPoints state] ==  NSOffState){
            [limit setEnabled:NO];
        } else {
            [limit setEnabled:YES];
        }
        
    } else {
        return;
    }
}

@end
