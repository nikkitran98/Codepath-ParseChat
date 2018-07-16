//
//  Human.h
//  parseChat
//
//  Created by Gustavo Coutinho on 7/9/18.
//  Copyright © 2018 Gustavo Coutinho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>


@interface Human : PFObject <PFSubclassing>

@property NSString *name;
@property NSString *homeTown;

@end
