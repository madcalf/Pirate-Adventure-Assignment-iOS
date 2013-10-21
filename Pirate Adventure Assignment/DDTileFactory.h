//
//  DDTileFactory.h
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDTile.h"

@interface DDTileFactory : NSObject

@property (strong, nonatomic) NSMutableArray *allTiles;
-(DDTile *) grabRandomTile;

+(NSArray *) makeTiles;
@end
