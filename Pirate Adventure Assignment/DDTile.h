//
//  DDTile.h
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDTile : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) NSString *actionName;
@property (strong, nonatomic) UIImage *backgroundImage;

// currently not using these...
- (DDTile *) initWithAction:(NSString *)actionName image:(UIImage *)img story:(NSString *)story;

- (DDTile *) initWithStory:(NSString *)story;

// does the init need to be delcared here if overriding??
//- (DDTile *) init;
@end
