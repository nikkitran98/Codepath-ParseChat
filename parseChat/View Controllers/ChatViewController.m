//
//  ChatViewController.m
//  parseChat
//
//  Created by Gustavo Coutinho on 7/9/18.
//  Copyright © 2018 Gustavo Coutinho. All rights reserved.
//

#import "ChatViewController.h"
#import "Parse.h"
#import "ChatCellTableViewCell.h"
#import "Dog.h"

@interface ChatViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *messageText;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (strong, nonatomic) NSMutableArray *messages;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)didTapButton:(id)sender;

@end

@implementation ChatViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.messages = [[NSMutableArray alloc] init];
    
    [self addDog];
    [self getDogs];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView reloadData];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer) userInfo:nil repeats:true];
    
    
    
}

- (void) addDog {
    Dog *dog = [Dog object];
    dog.name = @"RufoFromGustavoYolo";
    
    [dog saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        NSLog(@"saved dog");
    }];
}

- (void) getDogs {
    PFQuery *query = [Dog query];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        for (Dog *dog in objects) {
            NSLog(@"Dog named %@", dog.name);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) fetchMessages {
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Message_fbu2018"];
    [query orderByDescending:@"createdAt"];
    [query includeKey:@"user"];

    query.limit = 20;

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            [self.messages removeAllObjects];
            // do something with the array of object returned by the call
            for (PFObject *post in posts) {
                [self.messages addObject:post];
            }
            [self.tableView reloadData];

            
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    [self.tableView reloadData];

}


- (void)onTimer {
    // Add code to be run periodically
    [self fetchMessages];
}

- (IBAction)didTapButton:(id)sender {
    PFObject *chatMessage = [PFObject objectWithClassName:@"Message_fbu2018"];
    
    // Use the name of your outlet to get the text the user typed
    chatMessage[@"text"] = self.messageText.text;
    chatMessage[@"user"] = PFUser.currentUser;
    
    [chatMessage saveInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (succeeded) {
            NSLog(@"The message was saved!");
            
            self.messageText.text = @"";
            
        } else {
            NSLog(@"Problem saving message: %@", error.localizedDescription);
        }
    }];

}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    ChatCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChatCellTableViewCell" forIndexPath:indexPath];
    
    cell.message = self.messages[indexPath.row];


    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}


@end
