//
//  Model.h
//  Labb2
//
//  Created by Simon Riemertzon on 17/01/17.
//  Copyright © 2017 Simon Riemertzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface Model : NSObject

@property (nonatomic) NSMutableArray * qArray;
@property (nonatomic) NSMutableArray * gameInfo;
@property (nonatomic) NSNumber * numOfQsAnswered;
@property (nonatomic) NSNumber * numOfPoints;


-(Question*) getRandomQ;
-(NSString*) getRandomPosA : (Question*) q;
-(bool) isAnswerCorrect  : (Question*) q : (NSString*) btnTxt;
-(NSString*) gameResult;


@end
