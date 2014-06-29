//
//  ViewController.h
//  Phoenix Game
//
//  Created by Alex Mcritchie on 4/6/14.
//  Copyright (c) 2014 Alex Mcritchie. All rights reserved.
//

#import <UIKit/UIKit.h>

float Yship;
float Xship;

int ShootsFired = 0;

int Timer = 1;

int i = 1;
int a;
int b;
int r;
int c;
int row;
int XeMove;
int YeMove;
int ShipHealth;
int EnemyCountCol;
int EnemyCountRow;
BOOL enemyAlive[3][7];

float Level;
int ShipsInRow;
int Rows;
int TotalShips;
int ShipsOnScreen;

int Candy1Type;

//int BulletMovement;
int BulletsOnScreen;

float Ybadguy;
float Xbadguy;
float Yboss;
float Xboss;
float Yback1;
BOOL StartGame = YES;

int BulletNum;
int BulletType;
int BulletX;
int BulletY;

@interface ViewController : UIViewController{
    IBOutlet UILabel *Intro1;
    IBOutlet UILabel *Intro2;
    IBOutlet UILabel *Intro3;
    
    IBOutlet UILabel *testLabel1;
    IBOutlet UILabel *testLabel2;
    IBOutlet UILabel *testLabel3;
    IBOutlet UILabel *testLabel4;
    IBOutlet UILabel *testLabel5;



    
    IBOutlet UIButton *Start;
    IBOutlet UIButton *Shoot;
    
    IBOutlet UIImageView *Ship;
    
    UIImageView *enemy[4][7];
    UIImageView *bullet[11];
    
    IBOutlet UIImageView *Mback1;
    IBOutlet UIImageView *Mback2;
    
    IBOutlet UIButton *Left;
    IBOutlet UIButton *Right;
    IBOutlet UIButton *Down;
    IBOutlet UIButton *Up;
    
    NSTimer *timer;
    NSTimer *enemyTimer;
    NSTimer *bulletTimer;
    NSTimer *goLeft;
    NSTimer *goRight;
    NSTimer *goUp;
    NSTimer *goDown;
    NSTimer *timerBackground;
}

-(IBAction)Shoot:(id)sender;
-(IBAction)Start:(id)sender;

//Ship Coontroller//
//Left//
-(IBAction)MoveLeft:(id)sender;
-(IBAction)StopLeft:(id)sender;
-(void)goLeft;
//Right//
-(IBAction)MoveRight:(id)sender;
-(IBAction)StopRight:(id)sender;
-(void)goRight;
//Up//
-(IBAction)MoveUp:(id)sender;
-(IBAction)StopUp:(id)sender;
-(void)goUp;
//Down//
-(IBAction)MoveDown:(id)sender;
-(IBAction)StopDown:(id)sender;
-(void)goDown;
//Ship Controller//

-(void)LoadEnemy;
-(void)EnemyMovement;

-(void)Bullet;
-(void)BulletMovement;


-(void)Movement;
-(void)BackgroundMovement;
-(void)EndGame;
-(void)NewGame;

@end
