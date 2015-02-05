//
//  ELGAppDelegate.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class ELGAppController;
@class ELGPreferencePaneController;

@interface ELGAppDelegate : NSObject <NSApplicationDelegate>
{
    ELGAppController *appController;
    ELGPreferencePaneController *preferencePaneController;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)openPreferences:(id)sender;
- (void)initializePreferences;

@end
