//
//  DDArmor.h
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDArmor : NSObject

@property (strong, nonatomic) NSString *name;
// protects against damage at this value or lower
@property (nonatomic) int protection;

// returns true if armor protected against damage
-(DDArmor *) initWithName:(NSString *) aName protection:(int)aProtection;
-(BOOL) didProtect: (int)damage;

@end
