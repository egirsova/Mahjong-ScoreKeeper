//
//  ELGPlayer.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELGPlayer : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) int wind;
@property (nonatomic) int totalPoints;
@property (nonatomic) int roundPoints;
@property (nonatomic) int roundsWon;
@property (nonatomic) BOOL roundWinner;
@property (nonatomic) int roundsPlayed;
- (instancetype)initWithName:(NSString *)n
                        wind:(int)w;

@end
