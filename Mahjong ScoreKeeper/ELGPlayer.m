//
//  ELGPlayer.m
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import "ELGPlayer.h"

@implementation ELGPlayer

- (instancetype)initWithName:(NSString *)n wind:(int)w
{
    // Call NSObject's init method
    self = [super init];
    
    if(self){
        
        // Set the player name
        _name = [n copy];
        
        // Set the player wind
        _wind = w;
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

@end
