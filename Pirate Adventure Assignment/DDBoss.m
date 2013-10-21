//
//  DDBoss.m
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import "DDBoss.h"

@implementation DDBoss

-(void)didGetHit:(int)damage {
    self.health -= damage;
    NSLog(@"Boss Hit!  Health: %i", self.health);
}

-(void)didGetAttacked:(int)aDamage {
    // assuming for now that the attack was successful
    NSLog(@"Boss didGetAttacked. aDamage: %i", aDamage);
    [self didGetHit:aDamage];
}

-(void)didGetAttackedBy:(DDCharacter *)attacker damage:(int)aDamage {
    // assuming for now that the attack was successful
    [self didGetHit:aDamage];
    // should we put the counter attack here? Or should this be controlled in the main flow via the ViewController
    //  [self attacks:attacker];
}

-(void)attacks:(DDCharacter *)aOpponent {
    // essentially need to send a message to opponent with the amt of damage
    // don't need to get anything back?
    [aOpponent didGetAttacked: self.weapon.damage];
}

// note i made this is a property, so this is a getter for that.
// Should this kind of thing be a method or property?
-(BOOL)isDead {
    return self.health <= 0;
}

@end
