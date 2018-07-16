//
//  SignUpViewController.m
//  parseChat
//
//  Created by Gustavo Coutinho on 7/9/18.
//  Copyright © 2018 Gustavo Coutinho. All rights reserved.
//

#import "SignUpViewController.h"
#import "Parse.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameSignUpText;
@property (weak, nonatomic) IBOutlet UITextField *emailSignUpText;
@property (weak, nonatomic) IBOutlet UITextField *passwordSignUpText;
@property (weak, nonatomic) IBOutlet UIButton *createSignUpButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelSignUpButton;

- (IBAction)didTapCreate:(id)sender;
- (IBAction)didTapCancel:(id)sender;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerUser {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameSignUpText.text;
    newUser.email = self.emailSignUpText.text;
    newUser.password = self.passwordSignUpText.text;
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
            
            // manually segue to logged in view
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

- (IBAction)didTapCreate:(id)sender {
    [self performSegueWithIdentifier:@"loginSegue" sender:nil];
}

- (IBAction)didTapCancel:(id)sender {
    [self performSegueWithIdentifier:@"loginSegue" sender:nil];
}
@end
