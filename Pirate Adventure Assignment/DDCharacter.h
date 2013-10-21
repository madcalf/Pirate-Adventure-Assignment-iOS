//
//  DDCharacter.h
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDWeapon.h"
#import "DDArmor.h"
#import "DDBoss.h"

// to avoid circular reference errors since Boss and Character use each other and one may not be compiled yet.
@class DDBoss;

@interface DDCharacter : NSObject

@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (nonatomic, strong) DDWeapon *weapon;
@property (nonatomic, strong) DDArmor *armor;

-(void) assignWeapon:(DDWeapon *) aWeapon;
-(void) assignArmor:(DDArmor *) aWeapon;
-(void) eat;
-(void) drink;
-(void) didGetAttacked:(int) aDamage;
-(void) attacks:(DDBoss *) aBoss;
-(void) die;
-(BOOL) isDead;
@end
