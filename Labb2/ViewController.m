//
//  ViewController.m
//  Labb2
//
//  Created by Simon Riemertzon on 17/01/17.
//  Copyright © 2017 Simon Riemertzon. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "Question.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *aButton;
@property (weak, nonatomic) IBOutlet UIButton *bButton;
@property (weak, nonatomic) IBOutlet UIButton *cButton;
@property (weak, nonatomic) IBOutlet UIButton *dButton;
@property (weak, nonatomic) IBOutlet UITextView *questionText;
@property (weak, nonatomic) IBOutlet UIView *answerUI;
@property (weak, nonatomic) IBOutlet UITextField *resultText;
@property (weak, nonatomic) IBOutlet UIButton *nextQOrPlayAgain;
@property (weak, nonatomic) IBOutlet UIButton *nextQOrPlayAgainBtn;


@property NSArray * tenQuestions;
@property Model * model;
@property NSString * randPossibleA;
@property NSArray * arrayOfPossibleA;
@property Question * qCurrent;

@end

@implementation ViewController

- (IBAction)restartBtnPressed:(UIButton *)sender {
    //self.model.gameInfo objectAtIndex:0 intValue: < 5
  
    self.nextQOrPlayAgainBtn.hidden = true;
    self.answerUI.hidden = true;
    
    self.qCurrent = [self.model getRandomQ];
    self.questionText.text = self.qCurrent.qText;
    
    
    [self.aButton setTitle:[self.model getRandomPosA :self.qCurrent] forState:UIControlStateNormal];
    [self.bButton setTitle:[self.model getRandomPosA :self.qCurrent] forState:UIControlStateNormal];
    [self.cButton setTitle:[self.model getRandomPosA :self.qCurrent] forState:UIControlStateNormal];
    [self.dButton setTitle:[self.model getRandomPosA :self.qCurrent] forState:UIControlStateNormal];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.model = [[Model alloc] init];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)anyAnswerButtonPressed:(UIButton*)sender {
    self.answerUI.hidden = false;
    if ([self.model isAnswerCorrect: self.qCurrent : [sender titleForState:UIControlStateNormal]]) {
        
        self.resultText.text = @"Correct!";
        
    }else {
        self.resultText.text = @"Wrong!";
    }

    
    
    self.nextQOrPlayAgainBtn.hidden = false;
    
    if (([[self.model.gameInfo objectAtIndex:0] intValue])  >= 5 ) {
        
       self.nextQOrPlayAgain.titleLabel.text = @"Play again?";
        self.questionText.text = [self.model gameResult ];
          self.model = [[Model alloc] init];
        
    }
}



@end
