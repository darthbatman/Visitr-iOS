//
//  SecondViewController.m
//  Visitr
//
//  Created by Rishi Masand on 2/22/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

NSArray *hotelArray;
NSArray *restaurantArray;
NSArray *parkArray;
NSArray *museumArray;
NSArray *allPOIs;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    hotelArray = [userDefaults objectForKey:@"hotelArray"];
    restaurantArray = [userDefaults objectForKey:@"restaurantArray"];
    parkArray = [userDefaults objectForKey:@"parkArray"];
    museumArray = [userDefaults objectForKey:@"museumArray"];
    
    allPOIs
    
    //hotelArray = [NSArray arrayWithObjects:hotel0, nil];
    //NSLog(@"hotelArray[0] = %@", hotelArray[0]);
    //testArray = [NSArray arrayWithObjects:@"cookies", @"chicken", @"food", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [hotelArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [hotelArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
