//
//  ELGDefinitions.h
//  Mahjong ScoreKeeper
//
//  Created by Liza Girsova on 1/25/15.
//  Copyright (c) 2015 Girsova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELGDefinitions : NSObject

/***************************************************************
 * Wind and Point Definitions                                  *
 ***************************************************************/
#define EAST                1
#define NORTH               2
#define WEST                3
#define SOUTH               4

#define OP_REGULAR          2
#define OP_ONEORNINE        4
#define OP_WIND             4
#define OP_DRAGON           4
#define OK_REGULAR          8
#define OK_ONEORNINE        16
#define OK_WIND             16
#define OK_DRAGON           16
#define CP_REGULAR          4
#define CP_ONEORNINE        8
#define CP_WIND             8
#define CP_DRAGON           8
#define CK_REGULAR          16
#define CK_ONEORNINE        32
#define CK_WIND             32
#define CK_DRAGON           32
#define PAIR_DRAGONORWIND   2
#define FLOWER              4
#define OWNFLOWER           2
#define DWPAIR              2
#define PKDRAGON            2

#define WINNER              10
#define WINNER_ZEROPOINTS   20

#define LIMIT               300
/******************************************************************/


@end
