//
//  ELGAppDelegate.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class ELGAppController;

@interface ELGAppDelegate : NSObject <NSApplicationDelegate>
{
    ELGAppController *appController;
}

@property (assign) IBOutlet NSWindow *window;

@end
