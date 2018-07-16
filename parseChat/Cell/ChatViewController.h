//
//  ChatViewController.h
//  parseChat
//
//  Created by Gustavo Coutinho on 7/9/18.
//  Copyright © 2018 Gustavo Coutinho. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChatViewControllerDelegate
@end

@interface ChatViewController : UIViewController

@property (nonatomic, weak) id<ChatViewControllerDelegate> delegate;

- (void) fetchMessages;


@end
