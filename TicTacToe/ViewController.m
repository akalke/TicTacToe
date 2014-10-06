//
//  ViewController.m
//  TicTacToe
//
//  Created by Amaeya Kalke on 10/2/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (strong, nonatomic) IBOutlet UILabel *labelOne;
@property (strong, nonatomic) IBOutlet UILabel *labelTwo;
@property (strong, nonatomic) IBOutlet UILabel *labelThree;
@property (strong, nonatomic) IBOutlet UILabel *labelFour;
@property (strong, nonatomic) IBOutlet UILabel *labelFive;
@property (strong, nonatomic) IBOutlet UILabel *labelSix;
@property (strong, nonatomic) IBOutlet UILabel *labelSeven;
@property (strong, nonatomic) IBOutlet UILabel *labelEight;
@property (strong, nonatomic) IBOutlet UILabel *labelNine;
@property (strong, nonatomic) NSArray *labelArray;
@property CGPoint pointTap;
@property (strong, nonatomic) IBOutlet UILabel *xLabel;
@property CGPoint xOriginalPos;
@property (strong, nonatomic) IBOutlet UILabel *yLabel;
@property CGPoint yOriginalPos;
@property CGPoint dragPoint;
@property (nonatomic, strong) NSTimer *myTimer;
@property (strong, nonatomic) IBOutlet UILabel *timeRemaining;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self initializeGame];
}

#pragma tap interactions
- (IBAction)whenLabelTapped:(UITapGestureRecognizer *)tapGesture {
    self.pointTap = [tapGesture locationInView:self.view];
    [self setTapGameRules];
    [self whoWon];
   }

-(void)setTapGameRules
{
    for (UILabel *label in self.labelArray){
        if(CGRectContainsPoint(label.frame, self.pointTap)){
            if(([[label text] isEqualToString:@"X"] || [[label text] isEqualToString:@"O"])){
                //Check to see if there is something already there
                label.text = label.text;
            }
            else{
                //Empty square and select
                label.text = self.whichPlayerLabel.text;
                if ([label.text isEqualToString:@"X"]){
                    label.textColor = [UIColor blueColor];
                }
                else{
                    label.textColor = [UIColor redColor];
                }
                //Change player on successful change
                [self togglePlayer];
                [self.myTimer invalidate];
                self.myTimer = nil;
                [self startTimer];
            }
        }
    }
}

#pragma pan interactions

- (IBAction)panGesture:(UIPanGestureRecognizer *)panGesture {
    CGPoint point = [panGesture locationInView:self.view];


    if([self.whichPlayerLabel.text isEqualToString:@"X"]){
        self.xLabel.center = point;
        self.dragPoint = point;
    }
    else{
        self.yLabel.center = point;
        self.dragPoint = point;
    }

    if(panGesture.state == UIGestureRecognizerStateEnded){
    for(UILabel *label in self.labelArray){
        if(CGRectContainsPoint(label.frame, point)){
            if(([[label text] isEqualToString:@"X"] || [[label text] isEqualToString:@"O"])){
                //Check to see if there is something already there
                label.text = label.text;
                if(([[label text] isEqualToString:@"X"])){
                    self.xLabel.center = self.xOriginalPos;
                }
                else{
                    self.yLabel.center = self.yOriginalPos;
                }
            }
            else{
                //Empty square and select
                label.text = self.whichPlayerLabel.text;
                if ([label.text isEqualToString:@"X"]){
                    label.textColor = [UIColor blueColor];
                    self.xLabel.center = self.xOriginalPos;
                }
                else{
                    label.textColor = [UIColor redColor];
                    self.yLabel.center = self.yOriginalPos;
                }
                //Change player on successful change
                [self togglePlayer];
                [self.myTimer invalidate];
                self.myTimer = nil;
                [self startTimer];
            }
        }}


    }

    [self whoWon];
}


#pragma game logic
-(NSString *)whoWon{
    NSString *tempLabel = nil;

    if(![self.labelFive isEqual:[NSNull null]])
    {
        tempLabel = self.labelFive.text;
        //Evaluate winning combinations when Label 5 has been selected at any point
        if(((([[self.labelOne text] isEqualToString: tempLabel]) &&([[self.labelNine text] isEqualToString: tempLabel])) || (([[self.labelTwo text] isEqualToString: tempLabel]) &&([[self.labelEight text] isEqualToString: tempLabel]))) || (([[self.labelThree text] isEqualToString: tempLabel]) &&([[self.labelSeven text] isEqualToString: tempLabel])) || (([[self.labelFour text] isEqualToString: tempLabel]) &&([[self.labelSix text] isEqualToString: tempLabel]))){
            //Declare winner
            [self alertWinner:tempLabel];
            return tempLabel;
        }
    }
    if(![self.labelOne isEqual:[NSNull null]])
    {
        tempLabel = self.labelOne.text;
        //Evaluate winning combinations when Label 1 has been selected at any point
        if((([[self.labelThree text] isEqualToString: tempLabel]) &&([[self.labelTwo text] isEqualToString: tempLabel])) || (([[self.labelFour text] isEqualToString: tempLabel]) &&([[self.labelSeven text] isEqualToString: tempLabel]))){
            //Declare winner
            [self alertWinner:tempLabel];
            return tempLabel;
        }
    }
    if(![self.labelNine isEqual:[NSNull null]])
    {
        tempLabel = self.labelNine.text;
        //Evaluate winning combinations when Label 5 has been selected at any point
        if((([[self.labelThree text] isEqualToString: tempLabel]) &&([[self.labelSix text] isEqualToString: tempLabel])) || (([[self.labelSeven text] isEqualToString: tempLabel]) &&([[self.labelEight text] isEqualToString: tempLabel]))){
            //Declare winner
            [self alertWinner:tempLabel];
            return tempLabel;
        }
    }
    return nil;
}

-(void)togglePlayer{
    //Switches player
    if([[self.whichPlayerLabel text] isEqualToString:@"X"]){
        self.whichPlayerLabel.text = @"O";
    }
    else{
        self.whichPlayerLabel.text = @"X";
    }
}

-(void)startTimer{
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(togglePlayer) userInfo:nil repeats:YES];
    //[self updateTimer: self.myTimer];
}



-(void)resetTimer{
    [self.myTimer invalidate];
    self.myTimer = nil;
}

//-(void)updateTimer:(NSTimer *)timer{
//    int i = 5;
//    if(i >= 0){
//        self.timeRemaining.text = [NSString stringWithFormat: @"Time Remaining: %i", i];
//        i--;
//        NSLog(@"Counting");
//    }
//}

- (IBAction)alertWinner:(NSString *)winner {
    UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.delegate = self;
    alertView.title = [NSString stringWithFormat:@"Player %@ Wins!", winner];
    [alertView addButtonWithTitle:@"Start New Game"];
    [alertView show];
    [self resetGame];
}

- (IBAction)alertNoWinner:(NSString *)winner {
    UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.delegate = self;
    alertView.title = [NSString stringWithFormat:@"No one wins!"];
    [alertView addButtonWithTitle:@"Start New Game"];
    [alertView show];
    [self resetGame];
}

-(void)initializeGame{
    self.whichPlayerLabel.text = @"X";
    self.labelArray = @[self.labelOne, self.labelTwo, self.labelThree, self.labelFour, self.labelFive, self.labelSix, self.labelSeven, self.labelEight, self.labelNine];
    self.xOriginalPos = self.xLabel.center;
    self.yOriginalPos = self.yLabel.center;
    [self startTimer];
}

- (IBAction)resetGame:(id)sender {
    [self resetGame];
}

-(void)resetGame{
//Called from whoWon
    [self initializeGame];
    for (UILabel *label in self.labelArray){
        label.text = nil;
    }
}

@end
