//
//  Dog.m
//  parseChat
//
//  Created by Gustavo Coutinho on 7/9/18.
//  Copyright © 2018 Gustavo Coutinho. All rights reserved.
//

#import "Dog.h"

@implementation Dog

@dynamic name, weight, ownersName;

+(nonnull NSString *)parseClassName {
    return @"Dog";
}

@end
