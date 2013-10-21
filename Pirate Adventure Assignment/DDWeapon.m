//
//  DDWeapon.m
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import "DDWeapon.h"

@implementation DDWeapon

-(DDWeapon *) initWithName:(NSString *)aName damage:(int)aDamage{
    self = [super init];
    if (self) {
        // SHOUDL WE BE USING THE INSTANCE VARS HERE INSTEAD OF PROPERTIES?
        self.name = aName;
        self.damage = aDamage;
    }
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"[Weapon  name: %@, damage: %i]", self.name, self.damage];
}
@end
