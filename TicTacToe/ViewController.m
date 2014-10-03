//
//  ViewController.m
//  TicTacToe
//
//  Created by Amaeya Kalke on 10/2/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "ViewController.h"

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
@property (strong, nonatomic) IBOutlet UILabel *playerLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializePlayers];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)findLabelUsingPoint: (CGPoint)point{
    if(CGRectContainsPoint(self.labelOne.frame, point)){
        //NSLog(@"Label One");
        self.labelOne.text = self.whichPlayerLabel.text;

        if([[self.whichPlayerLabel text] isEqualToString:@"X"]){
            self.labelOne.textColor = [UIColor blueColor];
        }
        else{
            self.labelOne.textColor = [UIColor redColor];
        }
    }
    else if(CGRectContainsPoint(self.labelTwo.frame, point)){
        //NSLog(@"Label Two");

        self.labelTwo.text = self.whichPlayerLabel.text;
        if([[self.whichPlayerLabel text] isEqualToString:@"X"]){
            self.labelTwo.textColor = [UIColor blueColor];
        }
        else{
            self.labelTwo.textColor = [UIColor redColor];
        }
    }
    else if(CGRectContainsPoint(self.labelThree.frame, point)){
        //NSLog(@"Label Three");

        self.labelThree.text = self.whichPlayerLabel.text;
        if([[self.whichPlayerLabel text] isEqualToString:@"X"]){
            self.labelThree.textColor = [UIColor blueColor];
        }
        else{
            self.labelThree.textColor = [UIColor redColor];
        }
    }
    else if(CGRectContainsPoint(self.labelFour.frame, point)){
        //NSLog(@"Label Four");

        self.labelFour.text = self.whichPlayerLabel.text;
        if([[self.whichPlayerLabel text] isEqualToString:@"X"]){
            self.labelFour.textColor = [UIColor blueColor];
        }
        else{
            self.labelFour.textColor = [UIColor redColor];
        }
    }
    else if(CGRectContainsPoint(self.labelFive.frame, point)){
        //NSLog(@"Label Five");

        self.labelFive.text = self.whichPlayerLabel.text;
        if([[self.whichPlayerLabel text] isEqualToString:@"X"]){
            self.labelFive.textColor = [UIColor blueColor];
        }
        else{
            self.labelFive.textColor = [UIColor redColor];
        }
    }
    else if(CGRectContainsPoint(self.labelSix.frame, point)){
        //NSLog(@"Label Six");

        self.labelSix.text = self.whichPlayerLabel.text;

        if([[self.whichPlayerLabel text] isEqualToString:@"X"]){
            self.labelSix.textColor = [UIColor blueColor];
        }
        else{
            self.labelSix.textColor = [UIColor redColor];
        }
    }
    else if(CGRectContainsPoint(self.labelSeven.frame, point)){
        //NSLog(@"Label Seven");

        self.labelSeven.text = self.whichPlayerLabel.text;

        if([[self.whichPlayerLabel text] isEqualToString:@"X"]){
            self.labelSeven.textColor = [UIColor blueColor];
        }
        else{
            self.labelSeven.textColor = [UIColor redColor];
        }
    }
    else if(CGRectContainsPoint(self.labelEight.frame, point)){
        //NSLog(@"Label Eight");

        self.labelEight.text = self.whichPlayerLabel.text;

        if([[self.whichPlayerLabel text] isEqualToString:@"X"]){
            self.labelEight.textColor = [UIColor blueColor];
        }
        else{
            self.labelEight.textColor = [UIColor redColor];
        }
    }
    else if(CGRectContainsPoint(self.labelNine.frame, point)){
        //NSLog(@"Label Nine");

        self.labelNine.text = self.whichPlayerLabel.text;

        if([[self.whichPlayerLabel text] isEqualToString:@"X"]){
            self.labelNine.textColor = [UIColor blueColor];
        }
        else{
            self.labelNine.textColor = [UIColor redColor];
        }
    }
    else{
        return;
    }
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGesture {
    CGPoint point = [tapGesture locationInView:self.view];
    [self findLabelUsingPoint:point];
    [self switchPlayers];
    [self whoWon];
}

-(NSString *)initializePlayers{
    return self.whichPlayerLabel.text = @"X";
}

-(void)switchPlayers{
    if([[self.whichPlayerLabel text] isEqualToString:@"X"]){
        self.whichPlayerLabel.text = @"O";
    }
    else{
        self.whichPlayerLabel.text = @"X";
    }
}

- (NSString *)whoWon{
    if ([[self.labelOne text] isEqualToString: @"X"] && [[self.labelTwo text] isEqualToString:@"X"] && [[self.labelThree text] isEqualToString:@"X"]){
        NSLog(@"X WINS!");
        [self switchPlayers];
        [self alertWinner];
        return @"X";
    }
    else if([[self.labelOne text] isEqualToString: @"X"] && [[self.labelFour text] isEqualToString:@"X"] && [[self.labelSeven text] isEqualToString:@"X"]){
        NSLog(@"X WINS!");
        [self switchPlayers];
        [self alertWinner];
        return @"X";
    }
    else if([[self.labelOne text] isEqualToString: @"X"] && [[self.labelFive text] isEqualToString:@"X"] && [[self.labelNine text] isEqualToString:@"X"]){
        NSLog(@"X WINS!");
        [self switchPlayers];
        [self alertWinner];
        return @"X";
    }
    else if([[self.labelTwo text] isEqualToString: @"X"] && [[self.labelFive text] isEqualToString:@"X"] && [[self.labelEight text] isEqualToString:@"X"]){
        [self switchPlayers];
        [self alertWinner];
        return @"X";
    }
    else if([[self.labelThree text] isEqualToString: @"X"] && [[self.labelFive text] isEqualToString:@"X"] && [[self.labelSeven text] isEqualToString:@"X"]){
        [self switchPlayers];
        [self alertWinner];
        return @"X";
    }
    else if([[self.labelFour text] isEqualToString: @"X"] && [[self.labelFive text] isEqualToString:@"X"] && [[self.labelSix text] isEqualToString:@"X"]){
        [self switchPlayers];
        [self alertWinner];
        return @"X";
    }
    else if([[self.labelSeven text] isEqualToString: @"X"] && [[self.labelEight text] isEqualToString:@"X"] && [[self.labelNine text] isEqualToString:@"X"]){
        [self switchPlayers];
        [self alertWinner];
        return @"X";
    }
    else{
        return @"O";
    }
}

- (IBAction)alertWinner{
    UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.delegate = self;
    alertView.title = [NSString stringWithFormat:@"Player %@ Wins!", self.whichPlayerLabel.text];
    [alertView addButtonWithTitle:@"Start New Game"];
    [alertView show];
    [self resetGame];
}

-(void)resetGame{
    self.labelOne.text = @"";
    self.labelTwo.text = @"";
    self.labelThree.text = @"";
    self.labelFour.text = @"";
    self.labelFive.text = @"";
    self.labelSix.text = @"";
    self.labelSeven.text = @"";
    self.labelEight.text = @"";
    self.labelNine.text = @"";
}
@end
