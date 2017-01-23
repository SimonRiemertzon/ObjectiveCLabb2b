//
//  Question.h
//  Labb2
//
//  Created by Simon Riemertzon on 17/01/17.
//  Copyright © 2017 Simon Riemertzon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic) NSString *qText;
@property (nonatomic) NSMutableArray *possibleA;
@property (nonatomic) NSString* answer;




@end


