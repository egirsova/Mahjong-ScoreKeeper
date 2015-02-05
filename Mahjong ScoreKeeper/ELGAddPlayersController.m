//
//  ELGAddPlayersController.m
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import "ELGAddPlayersController.h"
#import "ELGDefinitions.h"
#import "ELGPlayer.h"
#import "ELGMainWindowController.h"

@interface ELGAddPlayersController ()

@end

@implementation ELGAddPlayersController
@synthesize playerArray;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
        playerArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    [self populatePopUpButtons];
    startGameButtonCount = 0;
}

- (IBAction)submitButtonPressed:(id)sender
{
    
    NSTextField *errorLabel = [[NSTextField alloc] initWithFrame:CGRectMake(10, 10, 300, 27)];
    
    // Initialize errorLabel
    if(startGameButtonCount == 0){
        [errorLabel setStringValue:@""];
        [errorLabel setTextColor:[NSColor redColor]];
        [errorLabel setBezeled:NO];
        [errorLabel setDrawsBackground:NO];
        [errorLabel setEditable:NO];
        [errorLabel setSelectable:NO];
        [self.window.contentView addSubview:errorLabel];
    }
    
    // Check if wind values overlap ONLY
    if([self checkOverlap] && ![self namesNotEntered]){
        [errorLabel setStringValue:@""];
        [errorLabel setStringValue:@"Error: winds must be unique"];
    }
    
    // Check if some names not entered ONLY
    if([self namesNotEntered] && ![self checkOverlap]){
        [errorLabel setStringValue:@""];
        [errorLabel setStringValue:@"Error: enter names"];
    }
    
    // Check if both some names not entered and winds not unique
    if([self namesNotEntered] && [self checkOverlap]){
        [errorLabel setStringValue:@""];
        [errorLabel setStringValue:@"Error: enter names and unique winds"];
    }
    
    // Check if all requirements are completed
    if(![self checkOverlap] && ![self namesNotEntered])
    {
        [self initializePlayers];
        
        /*[[NSNotificationCenter defaultCenter] postNotificationName:@"StartGame"
                                                            object:nil];*/
        [self.window close];
        
        // Initializes mainWindowController using overridden method
        if(!mainWindowController){
            mainWindowController = [[ELGMainWindowController alloc] initWithWindowNibName:@"ELGMainWindowController" playerArray:playerArray];
        }
        [mainWindowController showWindow:self];
        
    }
    
    startGameButtonCount++;
}

- (void)populatePopUpButtons
{
    [playerOneWindPU removeAllItems];
    [playerOneWindPU addItemWithTitle:@"North"];
    [playerOneWindPU addItemWithTitle:@"South"];
    [playerOneWindPU addItemWithTitle:@"East"];
    [playerOneWindPU addItemWithTitle:@"West"];
    
    [playerTwoWindPU removeAllItems];
    [playerTwoWindPU addItemWithTitle:@"North"];
    [playerTwoWindPU addItemWithTitle:@"South"];
    [playerTwoWindPU addItemWithTitle:@"East"];
    [playerTwoWindPU addItemWithTitle:@"West"];
    [playerTwoWindPU selectItemWithTitle:@"South"];
    
    [playerThreeWindPU removeAllItems];
    [playerThreeWindPU addItemWithTitle:@"North"];
    [playerThreeWindPU addItemWithTitle:@"South"];
    [playerThreeWindPU addItemWithTitle:@"East"];
    [playerThreeWindPU addItemWithTitle:@"West"];
    [playerThreeWindPU selectItemWithTitle:@"East"];
    
    [playerFourWindPU removeAllItems];
    [playerFourWindPU addItemWithTitle:@"North"];
    [playerFourWindPU addItemWithTitle:@"South"];
    [playerFourWindPU addItemWithTitle:@"East"];
    [playerFourWindPU addItemWithTitle:@"West"];
    [playerFourWindPU selectItemWithTitle:@"West"];
}

- (BOOL)checkOverlap
{
    NSString *playerOneSelected = [[playerOneWindPU selectedItem] title];
    NSString *playerTwoSelected = [[playerTwoWindPU selectedItem] title];
    NSString *playerThreeSelected = [[playerThreeWindPU selectedItem] title];
    NSString *playerFourSelected = [[playerFourWindPU selectedItem] title];
    
    if([playerOneSelected isEqual:playerTwoSelected])
        return true;
    else if([playerOneSelected isEqual:playerThreeSelected])
        return true;
    else if([playerOneSelected isEqual:playerFourSelected])
        return true;
    else if([playerTwoSelected isEqual:playerThreeSelected])
        return true;
    else if([playerTwoSelected isEqual:playerFourSelected])
        return true;
    else if([playerThreeSelected isEqual:playerFourSelected])
        return true;
    else
        return false;
}

- (BOOL)namesNotEntered
{
    if([[playerOneNameTF stringValue] length] > 0 && [[playerTwoNameTF stringValue] length] > 0 && [[playerThreeNameTF stringValue] length] > 0 && [[playerFourNameTF stringValue] length] > 0)
        return false;
    else
        return true;
}

- (int)stringWindToInt:(NSString *)wind{
    int windInt;
    if([wind isEqual:@"North"]){
        windInt = NORTH;
    }
    if([wind isEqual:@"South"]){
        windInt = SOUTH;
    }
    if([wind isEqual:@"East"]){
        windInt = EAST;
    }
    if([wind isEqual:@"West"]){
        windInt = WEST;
    }
    return windInt;
}

- (void)initializePlayers
{
    NSString *playerOneWind = [[playerOneWindPU selectedItem] title];
    int playerOneWindInt = [self stringWindToInt:playerOneWind];
    ELGPlayer *playerOne = [[ELGPlayer alloc] initWithName:[playerOneNameTF stringValue]
                                                      wind:playerOneWindInt];
    
    NSString *playerTwoWind = [[playerTwoWindPU selectedItem] title];
    int playerTwoWindInt = [self stringWindToInt:playerTwoWind];
    ELGPlayer *playerTwo = [[ELGPlayer alloc] initWithName:[playerTwoNameTF stringValue]
                                                      wind:playerTwoWindInt];
    
    NSString *playerThreeWind = [[playerThreeWindPU selectedItem] title];
    int playerThreeWindInt = [self stringWindToInt:playerThreeWind];
    ELGPlayer *playerThree = [[ELGPlayer alloc] initWithName:[playerThreeNameTF stringValue]
                                                        wind:playerThreeWindInt];
    
    NSString *playerFourWind = [[playerFourWindPU selectedItem] title];
    int playerFourWindInt = [self stringWindToInt:playerFourWind];
    ELGPlayer *playerFour = [[ELGPlayer alloc] initWithName:[playerFourNameTF stringValue]
                                                       wind:playerFourWindInt];
    
    playerArray = [NSMutableArray array];
    [playerArray addObject:playerOne];
    [playerArray addObject:playerTwo];
    [playerArray addObject:playerThree];
    [playerArray addObject:playerFour];
}


@end
