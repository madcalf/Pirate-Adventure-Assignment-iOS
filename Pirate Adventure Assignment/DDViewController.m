//
//  DDViewController.m
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import "DDViewController.h"
#import "DDTileFactory.h"
#import "DDTile.h"
#import "DDCharacter.h"
#import "DDArmor.h"
#import "DDWeapon.h"
#import "DDBoss.h"

@interface DDViewController ()

#pragma mark - private properties
// each array represents a row, the indeces within these arrays represent the columns
@property (nonatomic) int currentRowIndex;       // current row (index into master array)
@property (nonatomic) int currentColumnIndex;    // current column (index into currentRow array)
@property (nonatomic) int maxRows;
@property (nonatomic) int maxColumns;
@property (nonatomic, strong) DDCharacter *character;
@property (nonatomic, strong) DDBoss *boss;

@end

@implementation DDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self startNewGame];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction methods

- (IBAction)actionButtonPressed:(UIButton *)sender {
    // need one huge switch statement to cover all the actions?
    // This seems like a wierd way to do it cuz this ViewController needs to know
    // details about each Tile object (e.g. actionName) that it shouldn't necessarily know...

    NSString * btnName = [sender titleForState:UIControlStateNormal];
    
    if ([btnName isEqualToString:@"Grab a stick"]) {
        DDWeapon *stick = [[DDWeapon alloc]initWithName:@"Stick" damage:5];
        [self.character assignWeapon:stick];
        
    } else if ([btnName isEqualToString:@"Help soldiers bar gate"]) {
        // just take some health loss here
        self.character.health -= 10;
        // maybe an alert that something happened
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Danger!" message:@"Gate was overrun. You took a few hits. Better run for it." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    } else if ([btnName isEqualToString:@"Take leather armor"]) {
        DDArmor *armor = [[DDArmor alloc]initWithName:@"Leather Armor" protection:5];
        [self.character assignArmor:armor];
        
    } else if ([btnName isEqualToString:@"Take knife"]) {
        DDWeapon *knife = [[DDWeapon alloc]initWithName:@"Knife" damage:4];
        [self.character assignWeapon:knife];
        
    } else if ([btnName isEqualToString:@"Drink water"]) {
        [self.character drink];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Health Updated" message:@"Ahh, water! You needed that!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    } else if ([btnName isEqualToString:@"Take bow and arrows"]) {
        DDWeapon *bow = [[DDWeapon alloc]initWithName:@"Bow and Arrow" damage:10];
        [self.character assignWeapon:bow];
        
    } else if ([btnName isEqualToString:@"Take chain mail armor"]) {
        DDArmor *mail = [[DDArmor alloc]initWithName:@"Chain Mail Armor" protection:6];
        [self.character assignArmor:mail];
        
    } else if ([btnName isEqualToString:@"Take sword"]) {
        DDWeapon *sword = [[DDWeapon alloc]initWithName:@"Sword" damage:8];
        [self.character assignWeapon:sword];
        
    } else if ([btnName isEqualToString:@"Eat food"]) {
       [self.character eat];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Health Updated" message:@"Yum! That hit the spot!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    } else if ([btnName isEqualToString:@"Fight!"]) {
        // display the boss stats now
        self.bossView.hidden = NO; // move this to when we actually arrive there...
        
       // player attacks boss. Boss has no armor, so every hit causes damage
        [self.character attacks:self.boss];
        
        // boss hits back. This now happens in Boss...
        [self.boss attacks:self.character];
        
        // note isDead is just a method on Character, but is an explicit property in Boss with an overridden getter. This is just to remind me to ask about the conventions involved in choosing one over the other... Is it just a matter of preference e.g. you want to call it with dot vs method syntax?
        
        if ([self.character isDead]) {
            [self showAlert:@"Bad News" message:@"Ha! I do believe your dead!" cancelButtonTitle:@"OK"];
        }
        
        if (self.boss.isDead) {
            [self showAlert:@"Nice Work!" message:@"You killed the pirate boss!" cancelButtonTitle:@"OK"];
        }
        
        [self updateBossView];
    }

    [self updateCharacterView];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    [self startNewGame];
}

- (IBAction)northButtonPressed:(UIButton *)sender {
    [self moveNorth];
}

- (IBAction)southButtonPressed:(id)sender {
    [self moveSouth];
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    [self moveEast];
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    [self moveWest];
}


#pragma mark - private methods

-(void) startNewGame {
    // Check in about garbage collection. Are we ok simply resetting these properties to new values?
    // Or do we have to deallocate stuff...?
    
    // Create the tiles
    self.tiles = [DDTileFactory makeTiles];
    self.currentRowIndex = 0;
    self.currentColumnIndex = 0;
    
    self.maxRows = [self.tiles count];
    self.maxColumns = [[self.tiles objectAtIndex:0] count];
    NSLog(@"tiles: %@,   maxRows: %i,   maxColumns: %i", self.tiles, self.maxRows, self.maxColumns);
    
    // make the character
    self.character = [[DDCharacter alloc] init];
    self.character.health = 100;
    
    // give char an initial armor
    DDArmor *armor = [[DDArmor alloc] initWithName:@"None" protection:0];
    NSLog(@"character armor is %@", armor);
    [self.character assignArmor:armor];
    
    // give char initial weapon
    DDWeapon *hands = [[DDWeapon alloc] initWithName:@"Hands" damage:2];
    NSLog(@"character weapon is: %@", hands);
    [self.character assignWeapon:hands];
    
    // make the boss
    self.boss = [[DDBoss alloc]init];
    self.boss.health = 100;
    self.boss.weapon = [[DDWeapon alloc]initWithName:@"Giant Mace" damage:15];
    
    // move character to tile 0, 0
    self.currentRowIndex = 0;
    self.currentColumnIndex = 0;
    
    // view updates
    [self updateButtons];
    [self updateMainView];
    [self updateCharacterView];
}

-(void) showAlert:(NSString *)aTitle message:(NSString *)aMsg cancelButtonTitle:(NSString *)aCancelButtonTitle {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:aTitle message:aMsg delegate:nil cancelButtonTitle:aCancelButtonTitle otherButtonTitles: nil];
    [alert show];
}

- (void)moveWest {
    // to move west we update the column (index into the current row array)
    self.currentColumnIndex = MAX(self.currentColumnIndex - 1, 0);
    [self updateButtons];
    [self updateMainView];
    
    NSLog(@"Moved WEST to row:%i  column: %i", self.currentRowIndex, self.currentColumnIndex);
}

- (void)moveEast {
    // to move east we update the column (index into the current row array)
    self.currentColumnIndex = MIN(self.currentColumnIndex + 1, self.maxColumns - 1);
    [self updateButtons];
    [self updateMainView];
    
    NSLog(@"Moved EAST to row:%i  column: %i", self.currentRowIndex, self.currentColumnIndex);
}


-(void)moveNorth {
    // to move north we update the row (index into the master array)
    self.currentRowIndex = MAX(self.currentRowIndex - 1, 0);
    [self updateButtons];
    [self updateMainView];
    NSLog(@"Moved NORTH to row:%i  column: %i", self.currentRowIndex, self.currentColumnIndex);
}

- (void)moveSouth {
    // to move north we update the row (index into the master array)
    self.currentRowIndex = MIN(self.currentRowIndex + 1, self.maxRows - 1);
    [self updateButtons];
    [self updateMainView];
    NSLog(@"Moved SOUTH to row:%i  column: %i", self.currentRowIndex, self.currentColumnIndex);
  
}

-(void)updateMainView {
    // update action button
    DDTile *currentTile = [[self.tiles objectAtIndex:self.currentRowIndex] objectAtIndex: self.currentColumnIndex];
    [self.buttonAction setTitle:currentTile.actionName forState:UIControlStateNormal];
    
    // update background image
    [self.backgroundImageView setImage:currentTile.backgroundImage];
    self.labelStoryValue.text = currentTile.story;
    
    // check for boss tile. Show boss view only if we're there.
    BOOL isBossTile = [currentTile.name isEqualToString:@"Tile11"];
    self.bossView.hidden = !isBossTile;
    // only need to update the boss stats if we're on the boss tile
    if (isBossTile) {
        [self updateBossView];
        // extra credit. Hide buttons to prevent retreat from boss tile
        self.buttonNorth.hidden = YES;
        self.buttonSouth.hidden = YES;
        self.buttonEast.hidden = YES;
        self.buttonWest.hidden = YES;
    }
}

-(void) updateCharacterView {
    self.labelHealthValue.text = [NSString stringWithFormat: @"%i", self.character.health];
    self.labelArmorValue.text = self.character.armor.name;
    self.labelWeaponValue.text = self.character.weapon.name;
    self.labelDamageValue.text = [NSString stringWithFormat:@"%i", self.character.weapon.damage];
}

-(void) updateBossView {
    self.labelBossHealthValue.text = [NSString stringWithFormat:@"%i", self.boss.health];
    self.labelBossWeaponValue.text = self.boss.weapon.name;
    self.labelBossDamageValue.text = [NSString stringWithFormat:@"%i", self.boss.weapon.damage];
}

-(void)updateButtons {
    // updates button visibility based on which tile player is on.
    
    if (self.currentColumnIndex >= self.maxColumns-1) {
        self.buttonEast.hidden = YES;
    } else {
        self.buttonEast.hidden = NO;
    }
    
    if (self.currentColumnIndex <= 0) {
        self.buttonWest.hidden = YES;
    } else {
        self.buttonWest.hidden = NO;
    }
    
    if (self.currentRowIndex >= self.maxRows-1) {
        self.buttonSouth.hidden = YES;
    } else {
        self.buttonSouth.hidden = NO;
    }
    
    if (self.currentRowIndex <= 0) {
        self.buttonNorth.hidden = YES;
    } else {
        self.buttonNorth.hidden = NO;
    }
    
}

@end
