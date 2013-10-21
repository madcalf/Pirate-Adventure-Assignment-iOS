//
//  DDTile.m
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import "DDTile.h"

@implementation DDTile

- (DDTile *) initWithAction:(NSString *)actionName image:(UIImage *)img story:(NSString *)story {
    self = [super init];
    if (self) {
        _actionName = actionName;
        _backgroundImage = img;
        _story = story;
    }
    return self;
}

- (DDTile *)initWithStory:(NSString *)story {
    return [self initWithAction:nil image:nil story:story];
}

-(NSString *)description {
    NSString *desc = [NSString stringWithFormat:@"Tile  name: %@, actionName: %@, img: %@", self.name, self.actionName, self.backgroundImage];
    return desc;
}
@end
