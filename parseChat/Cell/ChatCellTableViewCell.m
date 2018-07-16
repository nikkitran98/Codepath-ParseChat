//
//  ChatCellTableViewCell.m
//  parseChat
//
//  Created by Gustavo Coutinho on 7/9/18.
//  Copyright © 2018 Gustavo Coutinho. All rights reserved.
//

#import "ChatCellTableViewCell.h"

@implementation ChatCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMessage:(PFObject *)message {
    _message = message;
    
    PFUser *user = message[@"user"];
    
    if (user != nil) {
        // User found! update username label with username
        self.usernameCell.text = user.username;
    } else {
        // No user found, set default username
        self.messageLabel.text = @"🤖";
    }

    self.messageLabel.text = message[@"text"];
}

@end
