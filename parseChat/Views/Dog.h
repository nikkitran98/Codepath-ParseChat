//
//  Dog.h
//  parseChat
//
//  Created by Gustavo Coutinho on 7/9/18.
//  Copyright © 2018 Gustavo Coutinho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Dog : PFObject <PFSubclassing>

@property NSString *name;
@property int weight;
@property NSString *ownersName;

@end
