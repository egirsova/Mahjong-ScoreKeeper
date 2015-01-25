//
//  ELGAppController.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ELGAddPlayersController;

@interface ELGAppController : NSObject
{
    ELGAddPlayersController *addPlayersController;
}

- (void)showAddPlayersWindow;

@end
