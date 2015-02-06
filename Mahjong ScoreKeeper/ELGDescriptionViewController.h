//
//  ELGDescriptionViewController.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 2/5/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ELGDescriptionViewController : NSViewController
{
    IBOutlet NSTextView *description;
}

- (void)populateTextView;

@end
