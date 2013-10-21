//
//  DDTileFactory.m
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import "DDTileFactory.h"
#import "DDTile.h"

//@interface DDTileFactory ()
//// private properties
//@end

@implementation DDTileFactory

+(NSArray *) makeTiles {
    // make the 12 tiles
    //    DDTile *tile1 = [[DDTile alloc] initWithStory:@"Tile1"];
    //    DDTile *tile2 = [[DDTile alloc] initWithStory:@"Tile2"];
    //    DDTile *tile3 = [[DDTile alloc] initWithStory:@"Tile2"];
    
    // make the 12 tiles
    DDTile *tile1 = [[DDTile alloc]init];
    tile1.name = @"Tile1";
    tile1.story = @"Your city is being attacked by pirates. They're killing everyone in sight! You have no weapons but you see some heavy sticks nearby.";
    tile1.actionName = @"Grab a stick";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    
    DDTile *tile2 = [[DDTile alloc]init];
    tile2.name = @"Tile2";
    tile2.story = @"You approach the north gate. The soldiers guarding it are being overtaken by a horde of pirates.";
    tile2.actionName = @"Help soldiers bar gate";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    
    DDTile *tile3 = [[DDTile alloc]init];
    tile3.name = @"Tile3";
    tile3.story = @"You notice a tunnel that leads out of the city. Nearby you see a dead pirate wearing leather armor.";
    tile3.actionName = @"Take leather armor";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    
    DDTile *tile4 = [[DDTile alloc]init];
    tile4.name = @"Tile4";
    tile4.story = @"Further along you come across a knife sticking out of a dead pirate's chest. Hmmm, that might come in handy.";
    tile4.actionName = @"Take knife";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    
    DDTile *tile5 = [[DDTile alloc]init];
    tile5.name = @"Tile5";
    tile5.story = @"After being on the move for a while you pass by a well. You suddenly realize you're quite thirsty.";
    tile5.actionName = @"Drink water";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    
    DDTile *tile6 = [[DDTile alloc]init];
    tile6.name = @"Tile6";
    tile6.story = @"As you approach a village, the villagers wave you inside. That stick won't do you much good, they say. You need a good bow.";
    tile6.actionName = @"Take bow and arrows";
    tile6.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    
    DDTile *tile7 = [[DDTile alloc]init];
    tile7.name = @"Tile7";
    tile7.story = @"Oh no, you've come across some soldiers who've been killed by pirates. They're wearing chain mail.";
    tile7.actionName = @"Take chain mail armor";
    tile7.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    
    DDTile *tile8 = [[DDTile alloc]init];
    tile8.name = @"Tile8";
    tile8.story = @"As you pick through the battlefield of dead bodies, many of them still have their swords. Won't really be needing those...";
    tile8.actionName = @"Take sword";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    
    DDTile *tile9 = [[DDTile alloc]init];
    tile9.name = @"Tile9";
    tile9.story = @"Wow it's really hot out here. Better find some water. Ah, there's a discarded water bottle.";
    tile9.actionName = @"Drink water";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    
    DDTile *tile10 = [[DDTile alloc]init];
    tile10.name = @"Tile10";
    tile10.story = @"Evening approaches. You've been on the run all day. Getting kind of light headed, as you approach an outlying farm.";
    tile10.actionName = @"Eat food";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    
    DDTile *tile11 = [[DDTile alloc]init];
    tile11.name = @"Tile11";
    tile11.story = @"Oh no! The enemy is upon you. You are being attacked by the very well armed and skilled pirate captain! There's no escape!";
    tile11.actionName = @"Fight!";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasure2.jpeg"];
    
    DDTile *tile12 = [[DDTile alloc]init];
    tile12.name = @"Tile12";
    tile12.story = @"Off in the distance you smell baking bread. Suddenly you're famished. You follow the smell to its source.";
    tile12.actionName = @"Eat food";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    
   
    // make a mutable copy of the master array for drawing random tiles from
    NSMutableArray *allTiles = [[NSMutableArray alloc]initWithObjects: tile1, tile2, tile3, tile4, tile5, tile6, tile7, tile8, tile9, tile10, tile11, tile12, nil];
    
    NSLog(@"allTiles INITIAL: %@", allTiles);
    
    // shuffle the array
    int count = [allTiles count];
    // note: starting loop at 1 cuz we want to keep the starting tile at index 0.
    for (int i = 1; i < count; i++) {
        // to avoid picking 0 as the random int:
        //    subtract 1 from the upper-bound arg, then add 1 to the resulting num
        u_int32_t randomIndex = arc4random_uniform(count-1) + 1;
        [allTiles exchangeObjectAtIndex:i withObjectAtIndex:randomIndex];
    }
    
    NSLog(@"allTiles RANDOMIZED: %@", allTiles);
    
//    // add tiles to arrays. Each array is a column
//    NSArray *array1 = [[NSArray alloc]initWithObjects:tile1, tile2, tile3, nil];
//    NSArray *array2 = [[NSArray alloc]initWithObjects:tile4, tile5, tile6, nil];
//    NSArray *array3 = [[NSArray alloc]initWithObjects:tile7, tile8, tile9, nil];
//    NSArray *array4 = [[NSArray alloc]initWithObjects:tile10, tile11, tile12, nil];
    
    // add tiles RANDOMLY to arrays. Each array is a column
    NSArray *array1 = [[NSArray alloc]initWithObjects:[allTiles objectAtIndex:0], [allTiles objectAtIndex:1], [allTiles objectAtIndex:2], nil];
    NSArray *array2 = [[NSArray alloc]initWithObjects:[allTiles objectAtIndex:3], [allTiles objectAtIndex:4], [allTiles objectAtIndex:5], nil];
    NSArray *array3 = [[NSArray alloc]initWithObjects:[allTiles objectAtIndex:6], [allTiles objectAtIndex:7], [allTiles objectAtIndex:8], nil];
    NSArray *array4 = [[NSArray alloc]initWithObjects:[allTiles objectAtIndex:9], [allTiles objectAtIndex:10], [allTiles objectAtIndex:11], nil];
    
    // add all arrays to master array
    NSArray *masterArray = [[NSArray alloc]initWithObjects:array1, array2, array3, array4, nil];
    return masterArray;
}


//-(DDTile *)grabRandomTile {
//    // picks a random tile from the mutable array, then deletes it from the array, then returns it
//    int tileCount = [self.tilePool count];
//    DDTile *tile;
//    int index;
//    if (tileCount == 0) {
//        NSLog(@"No more tiles");
//        return nil;
//    } else if (tileCount == 1) {
//        index = 0;
//    } else {
//        index = arc4Random() % tileCount;
//    }
//    
//    tile = [self.tilePool objectAtIndex:index];
//   [self.tilePool removeObjectAtIndex:index];
//    return tile;
//}
@end
