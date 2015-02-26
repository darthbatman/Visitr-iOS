//
//  UIViewController_UserPref.h
//  Visitr
//
//  Created by d.d on 2/24/15.
//  Copyright (c) 2015 Visitr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserPref.h"


@interface UserPref ()

@property (nonatomic, strong) NSUserDefaults *userSettings;

@end

@implementation UserPref
@synthesize poi1, poi2, restaurant;



- (void)viewDidLoad {
    [super viewDidLoad];
    // sets the userDefaults for other files to use
    self.userSettings = [NSUserDefaults standardUserDefaults];

    
}


- (IBAction)saveButtonPressed:(id)sender {
    
    NSLog(@"clicked save - settings screen");
    
    // This stores the user's inputs into the text fields in order to search with these text values.
    
    [self.userSettings setValue:poi1.text forKey:@"poi1"];
    [self.userSettings setValue:poi2.text forKey:@"poi2"];
    [self.userSettings setValue:restaurant forKey:@"restamos"];
    
    [self.userSettings synchronize];
    
    
}


@end

