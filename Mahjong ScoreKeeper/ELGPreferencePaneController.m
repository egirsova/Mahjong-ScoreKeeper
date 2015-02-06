//
//  ELGPreferencePaneController.m
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/30/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import "ELGPreferencePaneController.h"
#import "ELGDefinitions.h"
#import "ELGSettingsViewController.h"
#import "ELGDescriptionViewController.h"

@interface ELGPreferencePaneController ()

@end

@implementation ELGPreferencePaneController
@synthesize tabView;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        
        settingsViewController = [[ELGSettingsViewController alloc] initWithNibName:@"ELGSettingsViewController" bundle:nil];
        [settingsViewController setParentWindow:self];
        
        descriptionViewController = [[ELGDescriptionViewController alloc] initWithNibName:@"ELGDescriptionViewController" bundle:nil];
        
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    NSTabViewItem *item;
    item = [[self tabView] tabViewItemAtIndex:0];
    [item setView:[settingsViewController view]];
    
    item = [[self tabView] tabViewItemAtIndex:1];
    [item setView:[descriptionViewController view]];
    
    }

@end
