//
//  ChatCellTableViewCell.h
//  parseChat
//
//  Created by Gustavo Coutinho on 7/9/18.
//  Copyright © 2018 Gustavo Coutinho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse.h"

@interface ChatCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong, nonatomic) PFObject *message;
@property (weak, nonatomic) IBOutlet UILabel *usernameCell;

@end
