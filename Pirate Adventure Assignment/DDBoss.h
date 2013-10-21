//
//  DDBoss.h
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDWeapon.h"
#import "DDCharacter.h"

// to avoid circular reference errors since Boss and Character use each other and one may not be compiled yet.
@class DDCharacter;

@interface DDBoss : NSObject
@property (nonatomic, strong) DDWeapon *weapon;
@property (nonatomic) int health;
@property (nonatomic) BOOL isDead;

// attacker is set when boss is attacked by a DDCharacter
//@property (nonatomic, strong) DDCharacter *opponent;

-(void)didGetHit:(int)aDamage;
-(void)didGetAttacked:(int)aDamage;
// this one allows us to use a ref to the attacking character for immediate counter attack...
-(void)didGetAttackedBy:(DDCharacter *)aCharacter damage:(int)aDamage;
-(void)attacks:(DDCharacter *)aOpponent;
@end
