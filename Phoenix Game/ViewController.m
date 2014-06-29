//
//  ViewController.m
//  Phoenix Game
//
//  Created by Alex Mcritchie on 4/6/14.
//  Copyright (c) 2014 Alex Mcritchie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//Background//
-(void)BackgroundMovement{
    
    //Mback1.center = CGPointMake(Mback1.center.x, Mback1.center.y + Yback1);
    Mback2.center = CGPointMake(Mback2.center.x, Mback2.center.y + Yback1);
    //Yback1 = .1;
    
}

-(IBAction)Start:(id)sender{
    
    if(StartGame == YES){
    
        Intro1.hidden = YES;
        Intro2.hidden = YES;
        Intro3.hidden = YES;
    
        timer = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(Movement) userInfo:nil repeats:YES];
    
        Start.hidden = YES;
        Shoot.hidden = NO;
        
        [self LoadEnemy];

        ShipHealth = 10;
        
        StartGame = NO;
        
    }if(StartGame == NO){
        BulletsOnScreen = BulletsOnScreen + 1;
    }
}

-(IBAction)Shoot:(id)sender{
    
    a=1;
    
    [self Bullet];

    BulletsOnScreen = BulletsOnScreen + 1;
    ShootsFired++;
}




-(void)LoadEnemy{
    
    
    ShootsFired = 0;
    
    TotalShips = 1;
    
    EnemyCountRow = 1;
    
    while(EnemyCountRow < 4){
        
        EnemyCountCol = 1;
    
        while(EnemyCountCol < 7){
        
            enemyAlive[EnemyCountRow][EnemyCountCol] = YES;
        
            enemy[EnemyCountRow][EnemyCountCol].image = nil;
        
            enemy[EnemyCountRow][EnemyCountCol] = [[UIImageView alloc] initWithFrame: CGRectMake(60 + (60*EnemyCountCol), -30 + (60*EnemyCountRow), 20, 20)];
        
            enemy[EnemyCountRow][EnemyCountCol].image = [UIImage imageNamed:@"Ship.png"];
        
            [self.view addSubview: enemy[EnemyCountRow][EnemyCountCol]];

        
            EnemyCountCol++;
        }
        
        EnemyCountRow++;
    }

}

-(void)EnemyMovement{
    
    row = 1;
    
    while(row < 4) {
    
        c = 1;
    
        while(c < 7){
            
            YeMove = 0;
            XeMove = 0;
            
            //testLabel1.text = [NSString stringWithFormat:@"%i",(int) enemyAlive[3][4]];

            
            if(enemyAlive[row][c] == YES){
                testLabel2.text = [NSString stringWithFormat:@"%i",(int) enemyAlive[3][3]];

                
                if((enemy[row][c].center.y >= 10 + (row * 60)) && (enemy[row][c].center.x <= (125 + (c * 60)))){
                    XeMove = 1;
                    
                }else if((enemy[row][c].center.x <= (75 + (c * 60) ))){
                    YeMove = 1;
                    
                }else if((enemy[row][c].center.y <= -40 + (row * 60))){
                    XeMove = -1;
                
                }else if((enemy[row][c].center.x >= (125 + (c * 60)))){
                    YeMove = -1;
                }
                
                enemy[row][c].center = CGPointMake(enemy[row][c].center.x + (XeMove), enemy[row][c].center.y + (YeMove));
                
            }
        
            c++;
        }
        row++;
    }

}



-(void)Movement{
    
    a = 1;
    
    [self EnemyMovement];

    //enemys row 3 / col 3,4,5, and 6 are alive.  alive == 1 //

    
    [self BulletMovement];
    
    testLabel5.text = [NSString stringWithFormat:@"%i",(int) enemyAlive[3][3]];

    
    
    //enemys row 3 / col 3,4,5, and 6 are not alive.  alive == 0 //


}


-(void)Bullet{
    
    BulletType = 1;
    
    bullet[i] = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Badguy1.png"]];
    
    bullet[i].frame = CGRectMake(Ship.center.x - 5, Ship.center.y - 50, 10, 30);
    
    [self.view addSubview:bullet[i]];
    
    if(i < 10){
        i++;
    }else{
        i = 1;
    }
    
}


-(void)BulletMovement{
    
    //Friendly Bullets.//
    testLabel1.text = [NSString stringWithFormat:@"%i",(int) enemyAlive[3][3]];

    
    while(a <= 10){
        
        testLabel2.text = [NSString stringWithFormat:@"%i",(int) enemyAlive[3][3]];

        
        //bullet[a].center = CGPointMake(bullet[a].center.x, bullet[a].center.y - 1);
        
        //r = 1;

        testLabel3.text = [NSString stringWithFormat:@"%i",(int) enemyAlive[3][3]];

        while(r < 4){
            
            b = 1;
            
            
            while(b < 7){
                
                
                //Ship bullets collision with enemy.//

                if(CGRectIntersectsRect(bullet[a].frame, enemy[r][b].frame)){
                    
                
                    enemy[r][b].image = nil;
                    enemy[r][b].center = CGPointMake(100,10);
                    enemyAlive[r][b] = 0;
                
                    bullet[a].image = nil;
                    bullet[a].center = CGPointMake(-14, -10);
                }
                testLabel4.text = [NSString stringWithFormat:@"%i",(int) enemyAlive[3][3]];

                b++;
            }
            r++;
        }
        a++;
    }
    
}


//Pause Menu//
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self.view];
    
//    if (point.x > 10  ) {
//        Xship = -7;
//    }
//  else {
//        Xship = 7;
//    }
//}

-(void)EndGame{
    
    Ship.hidden = YES;
    [timer invalidate];
    Shoot.hidden = YES;
    
    [self performSelector:@selector(NewGame) withObject: nil afterDelay:2];
    
}

-(void)NewGame{
    
    Intro1.hidden = NO;
    Intro2.hidden = NO;
    Intro3.hidden = NO;
    
    Ship.hidden = NO;
    [self LoadEnemy];
    Ship.center = CGPointMake(320, 290);
    
    Start.hidden = NO;
    
    StartGame = YES;
}


//Controller Actions//
//------Left-------//
-(IBAction)MoveLeft:(id)sender{
    goLeft = [NSTimer scheduledTimerWithTimeInterval:0.0005 target:self selector:@selector(goLeft) userInfo:nil repeats:YES];
    if ( goLeft == nil){
        goLeft = [NSTimer scheduledTimerWithTimeInterval:0.0005 target:self selector:@selector(goLeft) userInfo:nil repeats:YES];
    }
}
-(IBAction)StopLeft:(id)sender {
    [goLeft invalidate];
    goLeft = nil;
}
-(void)goLeft{
    if (Ship.center.x < 140){
        Ship.center = CGPointMake(Ship.center.x, Ship.center.y);
    }else{
        Ship.center = CGPointMake(Ship.center.x - .1, Ship.center.y);
    }
}
//------Right------//
-(IBAction)MoveRight:(id)sender{
    goRight = [NSTimer scheduledTimerWithTimeInterval:0.0005 target:self selector:@selector(goRight) userInfo:nil repeats:YES];
    if ( goRight == nil){
        goRight = [NSTimer scheduledTimerWithTimeInterval:0.0005 target:self selector:@selector(goRight) userInfo:nil repeats:YES];
    }
}
-(IBAction)StopRight:(id)sender {
    [goRight invalidate];
    goRight = nil;
}
-(void)goRight{
    if (Ship.center.x > 460){
        Ship.center = CGPointMake(Ship.center.x, Ship.center.y);
    }else{
        Ship.center = CGPointMake(Ship.center.x + .1, Ship.center.y);
    }
}
//-------Up-------//
-(IBAction)MoveUp:(id)sender{
    goUp = [NSTimer scheduledTimerWithTimeInterval:0.0005 target:self selector:@selector(goUp) userInfo:nil repeats:YES];
    if ( goUp == nil){
        goUp = [NSTimer scheduledTimerWithTimeInterval:0.0005 target:self selector:@selector(goUp) userInfo:nil repeats:YES];
    }
}
-(IBAction)StopUp:(id)sender {
    [goUp invalidate];
    goUp = nil;
}
-(void)goUp{
    if (Ship.center.y < 20){
        Ship.center = CGPointMake(Ship.center.x, Ship.center.y);
    }else{
        Ship.center = CGPointMake(Ship.center.x, Ship.center.y - .1);
    }
}
//------Down------//
-(IBAction)MoveDown:(id)sender{
    goDown = [NSTimer scheduledTimerWithTimeInterval:0.0005 target:self selector:@selector(goDown) userInfo:nil repeats:YES];
    if ( goDown == nil){
        goDown = [NSTimer scheduledTimerWithTimeInterval:0.0005 target:self selector:@selector(goDown) userInfo:nil repeats:YES];
    }
}
-(IBAction)StopDown:(id)sender {
    [goDown invalidate];
    goDown = nil;
}
-(void)goDown{
    if (Ship.center.y > 290){
        Ship.center = CGPointMake(Ship.center.x, Ship.center.y);
    }else{
        Ship.center = CGPointMake(Ship.center.x, Ship.center.y + .1);
    }
}
//Controller Actions




- (void)viewDidLoad{
    
    Ship = [[UIImageView alloc] initWithFrame: CGRectMake(320, 270, 40, 50)];
    Ship.image = [UIImage imageNamed:@"Ship.png"];
    [self.view addSubview: Ship];
    
    Start.hidden = NO;
    Shoot.hidden = YES;
    timerBackground = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(BackgroundMovement) userInfo:nil repeats:YES];
    Shoot.hidden = NO;
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}


//

@end
