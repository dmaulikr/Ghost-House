//
//  Game.h
//  Ghost House
//
//  Created by Justin Tidwell on 3/13/14.
//  Copyright (c) 2014 iNtend. All rights reserved.
//

#import <UIKit/UIKit.h>

int BooFlight;
int RandomTopPillarPosition;
int RandomBottomPillarPosition;
int ScoreNumber;
NSInteger HighScoreNumber;

@interface Game : UIViewController
{
    IBOutlet UIImageView *Boo;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *PillarTop;
    IBOutlet UIImageView *PillarBottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UIImageView *GameOverNotice;
    
    NSTimer *BooMovement;
    NSTimer *PillarMovement;
}

-(IBAction)StartGame:(id)sender;
-(void)BooMoving;
-(void)PillarMoving;
-(void)PlacePillars;
-(void)Score;
-(void)GameOver;


@end
