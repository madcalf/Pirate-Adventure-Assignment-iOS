//
//  DDArmor.m
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import "DDArmor.h"

@implementation DDArmor

// either have it be all or nothing. If false player receives all damage from enemy weapon. Otherwise full protection
// OR have it subtract enemy damage from protection to determine how much health to dock. In this case it would return an int, not a bool. Something like getNetDamage... But maybe that belongs in DDCharacter...
-(BOOL) didProtect: (int)damage{
    return (self.protection > damage);
}

-(DDArmor *) initWithName:(NSString *)aName protection:(int)aProtection{
    self = [super init];
    if (self) {
        // SHOUDL WE BE USING THE INSTANCE VARS HERE INSTEAD OF PROPERTIES?
        self.name = aName;
        self.protection = aProtection;
    }
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"[Armor  name: %@, protection: %i]", self.name, self.protection];
}

@end
