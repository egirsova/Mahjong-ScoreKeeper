//
//  ELGPlayer.m
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import "ELGPlayer.h"

@implementation ELGPlayer
@synthesize roundWinner;
@synthesize roundsPlayed;

- (instancetype)initWithName:(NSString *)n wind:(int)w
{
    // Call NSObject's init method
    self = [super init];
    
    if(self){
        
        // Set the player name
        _name = [n copy];
        
        // Set the player wind
        _wind = w;
        
        roundsPlayed = 1;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithName:@"Unknown"
                         wind:0];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %d wind>", self.name, self.wind];
}

#pragma mark - NSCopying Methods
-(id)copyWithZone:(NSZone *)zone
{
    // We'll ignore the zone for now
    ELGPlayer *player = [[[self class] allocWithZone:zone] init];
    player.name = self.name;
    player.wind = self.wind;
    player.totalPoints = self.totalPoints;
    player.roundPoints = self.roundPoints;
    player.roundsWon = self.roundsWon;
    player.roundWinner = self.roundWinner;
    player.roundsPlayed = self.roundsPlayed;
    
    return player;
}

@end
