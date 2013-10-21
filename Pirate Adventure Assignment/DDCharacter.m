//
//  DDCharacter.m
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import "DDCharacter.h"

@implementation DDCharacter

-(void) assignWeapon:(DDWeapon *) aWeapon {
    self.weapon = aWeapon;
    self.damage = self.weapon.damage;
}

-(void) assignArmor:(DDArmor *) aArmor {
    self.armor = aArmor;
}

-(void) eat {
    self.health += 5;
}

-(void) drink {
    self.health += 10;
}

-(void) didGetAttacked:(int)aDamage {
    // calculate the damage vs protection and adjust health accordingly
    int netDamageTaken = aDamage - self.armor.protection;
    // make sure we don't gain health from being attacked!
    netDamageTaken = MAX(netDamageTaken, 0);
    self.health -= netDamageTaken;
    if (self.health <= 0) {
        [self die];
    }
    NSLog(@"Player is hit! Net damage: %i.  Health: %i", netDamageTaken, self.health);
}

-(void) attacks:(DDBoss *) aBoss{
    // send isAttacked to boss with damage
    // don't know if we need to store enemy. Just pass it in every attack
    NSLog(@"Character attacks boss.  aBoss: %@", aBoss );
    [aBoss didGetAttacked:self.damage];
}

-(void) die {
    // not sure what to do here
    // do we display an alert from here or the view?
    // view needs to know if i'm dead right?
    // Or maybe this is a return value from isAttacked?
    NSLog(@"Ahhh! CHARACTER HAS DIED");
}

// this one is done strictly as a method (vs a property as in Boss class. Just trying out the differences... Wonder if there's a convention here for when to make stuff a property vs just method.)
-(BOOL) isDead {
    return self.health <= 0;
}
@end


