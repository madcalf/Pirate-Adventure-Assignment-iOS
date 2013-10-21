//
//  DDWeapon.h
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDWeapon : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) int damage;

-(DDWeapon *) initWithName:(NSString *)aName damage:(int)aDamage;
@end
