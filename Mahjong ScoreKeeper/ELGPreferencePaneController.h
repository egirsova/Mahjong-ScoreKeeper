//
//  ELGPreferencePaneController.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/30/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class ELGSettingsViewController;
@class ELGDescriptionViewController;

@interface ELGPreferencePaneController : NSWindowController
{
    
    ELGSettingsViewController *settingsViewController;
    ELGDescriptionViewController *descriptionViewController;
    
}
@property (nonatomic) IBOutlet NSTabView *tabView;

@end
