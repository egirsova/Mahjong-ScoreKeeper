//
//  ELGAppDelegate.m
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import "ELGAppDelegate.h"
#import "ELGAppController.h"
#import "ELGPreferencePaneController.h"
#import "ELGDefinitions.h"

@implementation ELGAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    appController = [[ELGAppController alloc] init];
    [self initializePreferences];
}

- (void)initializePreferences
{
    // Takes care of initializing prefs instance variable
    NSMutableDictionary *defaultPrefs = [NSMutableDictionary dictionary];
    
    [defaultPrefs setObject:@OP_REGULAR forKey:@"openPongRegular"];
    [defaultPrefs setObject:@OP_ONEORNINE forKey:@"openPongOneOrNine"];
    [defaultPrefs setObject:@OP_WIND forKey:@"openPongWind"];
    [defaultPrefs setObject:@OP_DRAGON forKey:@"openPongDragon"];
    
    [defaultPrefs setObject:@CP_REGULAR forKey:@"closedPongRegular"];
    [defaultPrefs setObject:@CP_ONEORNINE forKey:@"closedPongOneOrNine"];
    [defaultPrefs setObject:@CP_WIND forKey:@"closedPongWind"];
    [defaultPrefs setObject:@CP_DRAGON forKey:@"closedPongDragon"];
    
    [defaultPrefs setObject:@OK_REGULAR forKey:@"openKongRegular"];
    [defaultPrefs setObject:@OK_ONEORNINE forKey:@"openKongOneOrNine"];
    [defaultPrefs setObject:@OK_WIND forKey:@"openKongWind"];
    [defaultPrefs setObject:@OK_DRAGON forKey:@"openKongDragon"];
    
    [defaultPrefs setObject:@CK_REGULAR forKey:@"closedKongRegular"];
    [defaultPrefs setObject:@CK_ONEORNINE forKey:@"closedKongOneOrNine"];
    [defaultPrefs setObject:@CK_WIND forKey:@"closedKongWind"];
    [defaultPrefs setObject:@CK_DRAGON forKey:@"closedKongDragon"];
    
    [defaultPrefs setObject:@WINNER forKey:@"winner"];
    [defaultPrefs setObject:@WINNER_ZEROPOINTS forKey:@"winnerZeroPoints"];
    [defaultPrefs setObject:@FLOWER forKey:@"flower"];
    [defaultPrefs setObject:@YES forKey:@"doublePointsWinEast"];
    [defaultPrefs setObject:@YES forKey:@"limitMaxPoints"];
    [defaultPrefs setObject:@LIMIT forKey:@"limit"];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs registerDefaults:defaultPrefs];
    [prefs synchronize];
}

- (IBAction)openPreferences:(id)sender
{
    // Initializes addPlayerController
    if(!preferencePaneController){
        preferencePaneController = [[ELGPreferencePaneController alloc] initWithWindowNibName:@"ELGPreferencePaneController"];
    }
    [preferencePaneController.window center];
    [preferencePaneController showWindow:self];
}

@end
