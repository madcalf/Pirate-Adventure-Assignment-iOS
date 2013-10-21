//
//  DDViewController.h
//  Pirate Adventure Assignment
//
//  Created by DDD on 2013-10-14.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDViewController : UIViewController

@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (strong, nonatomic) IBOutlet UIView *bossView;
@property (strong, nonatomic) IBOutlet UILabel *labelBossHealthValue;
@property (strong, nonatomic) IBOutlet UILabel *labelBossWeaponValue;
@property (strong, nonatomic) IBOutlet UILabel *labelBossDamageValue;

@property (strong, nonatomic) IBOutlet UILabel *labelHealthValue;
@property (strong, nonatomic) IBOutlet UILabel *labelArmorValue;
@property (strong, nonatomic) IBOutlet UILabel *labelWeaponValue;
@property (strong, nonatomic) IBOutlet UILabel *labelDamageValue;

@property (strong, nonatomic) IBOutlet UILabel *labelStoryValue;
@property (strong, nonatomic) IBOutlet UIButton *buttonAction;

@property (strong, nonatomic) IBOutlet UIButton *buttonNorth;
@property (strong, nonatomic) IBOutlet UIButton *buttonEast;
@property (strong, nonatomic) IBOutlet UIButton *buttonSouth;
@property (strong, nonatomic) IBOutlet UIButton *buttonWest;

- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)resetButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;

@end
