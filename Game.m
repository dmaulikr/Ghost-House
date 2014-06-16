//
//  Game.m
//  Ghost House
//
//  Created by Justin Tidwell on 3/13/14.
//
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)GameOver{
    
    if (ScoreNumber > HighScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    
    [PillarMovement invalidate];
    [BooMovement invalidate];
    
    GameOverNotice.hidden = NO;
    Exit.hidden = NO;
    PillarTop.hidden = YES;
    PillarBottom.hidden = YES;
    Boo.hidden = YES;
}

-(void)Score{
    
    ScoreNumber = ScoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
}

-(IBAction)StartGame:(id)sender{
    
    PillarTop.hidden = NO;
    PillarBottom.hidden = NO;
    
    StartGame.hidden = YES;
    
    BooMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BooMoving) userInfo:nil repeats:YES];
    
    [self PlacePillars];
    
    PillarMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(PillarMoving) userInfo:nil repeats:YES];
}

-(void)PillarMoving{
    
    PillarTop.center = CGPointMake(PillarTop.center.x - 1, PillarTop.center.y);
    PillarBottom.center = CGPointMake(PillarBottom.center.x - 1, PillarBottom.center.y);
    
    if (PillarTop.center.x < -49){
        [self PlacePillars];
    }
    
    if (PillarTop.center.x == -11) {
        [self Score];
    }
    
    if (CGRectIntersectsRect(Boo.frame, PillarTop.frame)){
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Boo.frame, PillarBottom.frame)){
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Boo.frame, Top.frame)){
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Boo.frame, Bottom.frame)){
        [self GameOver];
    }
}

-(void)PlacePillars{
    
    RandomTopPillarPosition = arc4random() %350;
    RandomTopPillarPosition = RandomTopPillarPosition - 228;
    RandomBottomPillarPosition = RandomTopPillarPosition + 655;
    
    PillarTop.center = CGPointMake(340, RandomTopPillarPosition);
    PillarBottom.center = CGPointMake(340, RandomBottomPillarPosition);
}

-(void)BooMoving
{
    Boo.center = CGPointMake(Boo.center.x, Boo.center.y - BooFlight);
    BooFlight = BooFlight - 5;
    
    if (BooFlight < -12) {
        BooFlight = -12;
    }
    
    if (BooFlight > 0) {
        Boo.image = [UIImage imageNamed:@"boo transparent.png"];
    }
    
    if (BooFlight < 0) {
        Boo.image = [UIImage imageNamed:@"boo down transparent.png"];
    }
    
}

-(void)touchesBegan: (NSSet *) touches withEvent: (UIEvent *)event{
    
    BooFlight = 18;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    PillarTop.hidden = YES;
    PillarBottom.hidden = YES;
    
    GameOverNotice.hidden = YES;
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
