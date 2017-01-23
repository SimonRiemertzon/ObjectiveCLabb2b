//
//  Model.m
//  Labb2
//
//  Created by Simon Riemertzon on 17/01/17.
//  Copyright © 2017 Simon Riemertzon. All rights reserved.
//

#import "Model.h"
#import "Question.h"

@interface Model ()



@end

@implementation Model

-(instancetype) init {
    
    self = [super init];
    
    if (self) {
        Question * q1 = [[Question alloc]init];
        q1.qText = @"What is 2 + 2?";
        q1.possibleA = [NSMutableArray arrayWithObjects:@"4",@"1",@"6",@"2", nil];
        q1.answer = @"4";
        
        Question * q2 = [[Question alloc] init];
        q2.qText = @"What is 1 + 1?";
        q2.possibleA = [NSMutableArray arrayWithObjects:@"0", @"4",@"9",@"2", nil];
        q2.answer = @"2";
        
        Question * q3 = [[Question alloc] init];
        q3.qText = @"What is 3 + 3?";
        q3.possibleA = [NSMutableArray arrayWithObjects:@"7", @"5",@"6",@"0", nil];
        q3.answer = @"6";
        
        Question * q4 = [[Question alloc] init];
        q4.qText = @"What is 2 + 3?";
        q4.possibleA = [NSMutableArray arrayWithObjects:@"7", @"5",@"6",@"0", nil];
        q4.answer = @"5";
        
        Question * q5 = [[Question alloc] init];
        q5.qText = @"What is 10 + 10";
        q5.possibleA = [NSMutableArray arrayWithObjects:@"90", @"20",@"50",@"2", nil];
        
        Question * q6 = [[Question alloc] init];
        q6.qText = @"What is 100 + 100";
        q6.possibleA = [NSMutableArray arrayWithObjects:@"90", @"200",@"900",@"9", nil];
        
        Question * q7 = [[Question alloc] init];
        q7.qText = @"What is 12 + 17";
        q7.possibleA = [NSMutableArray arrayWithObjects:@"30", @"98",@"46",@"29", nil];
        
        Question * q8 = [[Question alloc] init];
        q8.qText = @"What is 40 + 10";
        q8.possibleA = [NSMutableArray arrayWithObjects:@"60", @"22",@"50",@"1", nil];
        
        Question * q9 = [[Question alloc] init];
        q9.qText = @"What is 67 + 10";
        q9.possibleA = [NSMutableArray arrayWithObjects:@"77", @"567",@"8",@"23", nil];
        
        Question * q10 = [[Question alloc] init];
        q10.qText = @"What is 256 + 100";
        q10.possibleA = [NSMutableArray arrayWithObjects:@"365", @"257",@"90",@"21", nil];
      
        
        q5.answer = @"20";
        
        self.qArray = [@[q1, q2, q3, q4, q5]mutableCopy];
        
        [self randomizeQuestions];
        
      
        

        self.numOfQsAnswered = [NSNumber numberWithInt:0];
        self.numOfPoints = [NSNumber numberWithInt:0];
        
        self.gameInfo = [NSMutableArray arrayWithObjects:self.numOfQsAnswered, self.numOfPoints, nil];
       
        
        
        
        
        
        
    }
    
    
    return self;
}



-(Question*) getRandomQ  {
    
    Question * qRandom;
    
    int randomIndex = arc4random() % self.qArray.count;
    qRandom = self.qArray[randomIndex];
    [self.qArray removeObjectAtIndex:randomIndex ];
    
    return qRandom;
}

-(NSString*) getRandomPosA : (Question* ) q {
    
    NSString * aRandom;
    
    int randomIndex = arc4random() % q.possibleA.count;
    aRandom = q.possibleA[randomIndex];
    [q.possibleA removeObjectAtIndex:randomIndex];
    
    return aRandom;
 
    


                                           
}
                                           
-(void) randomizeQuestions  {
   
    
    for (int i; i < self.qArray.count; i++) {
     int randInt = arc4random() % self.qArray.count;
        [self.qArray exchangeObjectAtIndex:i withObjectAtIndex: randInt];
    }
    
    
                                               
    
}

-(bool) isAnswerCorrect : (Question*) q : (NSString*) btnTxt{
    if ([q.answer isEqualToString:btnTxt]) {
        NSLog(@"Correct!");
        //numOfQsAnswered++
        self.gameInfo[0] = @( [self.gameInfo[0] intValue] + 1);
        //numOfPoints++
        self.gameInfo[1] = @( [self.gameInfo[1] intValue] + 1);
     
        return true;
    }else{
        NSLog(@"WrongeliWrong");
        //numOfQsAnswered++
        self.gameInfo[0] = @( [self.gameInfo[0] intValue] + 1);
       
        return false;
    }
    
}

-(NSString*) gameResult {
    NSNumber * wrongAnswers = @([self.gameInfo[0] intValue] - [self.gameInfo[1] intValue]);
    
    NSString * result = [NSString stringWithFormat:@"You played the quiz! \n You got %@ points and guessed wrong on %@ questions", [self.gameInfo[1] stringValue], [wrongAnswers stringValue]];
    
    return result;
}
 @end
