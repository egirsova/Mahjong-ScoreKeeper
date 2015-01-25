//
//  ELGAppController.m
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import "ELGAppController.h"
#import "ELGAddPlayersController.h"

@implementation ELGAppController

- (id)init
{
    self = [super init];
    if(self){
        // Opens AddPlayersController
        [self showAddPlayersWindow];
        
    }
    return self;
}

- (void)showAddPlayersWindow
{
    // Initializes addPlayerController
    if(!addPlayersController){
        addPlayersController = [[ELGAddPlayersController alloc] initWithWindowNibName:@"ELGAddPlayersController"];
    }
    [addPlayersController showWindow:self];
}

@end
