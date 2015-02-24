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
//NSArray *allPOIs;
NSArray *placesToVisit;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    hotelArray = [userDefaults objectForKey:@"hotelArray"];
    restaurantArray = [userDefaults objectForKey:@"restaurantArray"];
    parkArray = [userDefaults objectForKey:@"parkArray"];
    museumArray = [userDefaults objectForKey:@"museumArray"];
    
    placesToVisit = [parkArray arrayByAddingObjectsFromArray:museumArray];
    
    //hotelArray = [hotelArray arrayByAddingObjectsFromArray:[restaurantArray arrayByAddingObjectsFromArray:[parkArray arrayByAddingObjectsFromArray:museumArray]]];
    
    //allPOIs = [hotelArray arrayByAddingObjectsFromArray:[restaurantArray arrayByAddingObjectsFromArray:[parkArray arrayByAddingObjectsFromArray:museumArray]]];
    
    //NSLog(@"All POIs: %@", hotelArray);
    
    /*
    
    allPOIs = [allPOIs arrayByAddingObjectsFromArray:hotelArray];
    allPOIs = [allPOIs arrayByAddingObjectsFromArray:restaurantArray];
    allPOIs = [allPOIs arrayByAddingObjectsFromArray:parkArray];
    allPOIs = [allPOIs arrayByAddingObjectsFromArray:museumArray];
     */
    
    //NSLog(@"AllPois: %@", allPOIs);
    
    //hotelArray = [NSArray arrayWithObjects:hotel0, nil];
    //NSLog(@"hotelArray[0] = %@", hotelArray[0]);
    //testArray = [NSArray arrayWithObjects:@"cookies", @"chicken", @"food", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0: return [hotelArray count];
        case 1: return [restaurantArray count];
        case 2: return [placesToVisit count];
        default: return 0;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    switch (indexPath.section) {
        case 0: cell.textLabel.text = [hotelArray objectAtIndex:indexPath.row];
            break;
        case 1: cell.textLabel.text = [restaurantArray objectAtIndex:indexPath.row];
            break;
        case 2: cell.textLabel.text = [placesToVisit objectAtIndex:indexPath.row];
            break;
        default: return 0;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *messageAlert;
    if (indexPath.section == 0){
        switch (indexPath.row) {
            case 0: messageAlert = [[UIAlertView alloc]initWithTitle:hotelArray[0] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 1: messageAlert = [[UIAlertView alloc]initWithTitle:hotelArray[1] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 2: messageAlert = [[UIAlertView alloc]initWithTitle:hotelArray[2] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 3: messageAlert = [[UIAlertView alloc]initWithTitle:hotelArray[3] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 4: messageAlert = [[UIAlertView alloc]initWithTitle:hotelArray[4] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 5: messageAlert = [[UIAlertView alloc]initWithTitle:hotelArray[5] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 6: messageAlert = [[UIAlertView alloc]initWithTitle:hotelArray[6] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 7: messageAlert = [[UIAlertView alloc]initWithTitle:hotelArray[7] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 8: messageAlert = [[UIAlertView alloc]initWithTitle:hotelArray[8] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 9: messageAlert = [[UIAlertView alloc]initWithTitle:hotelArray[9] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            default: break;
        }
        
    }
    else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0: messageAlert = [[UIAlertView alloc]initWithTitle:restaurantArray[0] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 1: messageAlert = [[UIAlertView alloc]initWithTitle:restaurantArray[1] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 2: messageAlert = [[UIAlertView alloc]initWithTitle:restaurantArray[2] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 3: messageAlert = [[UIAlertView alloc]initWithTitle:restaurantArray[3] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 4: messageAlert = [[UIAlertView alloc]initWithTitle:restaurantArray[4] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 5: messageAlert = [[UIAlertView alloc]initWithTitle:restaurantArray[5] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 6: messageAlert = [[UIAlertView alloc]initWithTitle:restaurantArray[6] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 7: messageAlert = [[UIAlertView alloc]initWithTitle:restaurantArray[7] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 8: messageAlert = [[UIAlertView alloc]initWithTitle:restaurantArray[8] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 9: messageAlert = [[UIAlertView alloc]initWithTitle:restaurantArray[9] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
                
        }
    }
    else if (indexPath.section == 2){
        switch (indexPath.row){
            case 0: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[0] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 1: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[1] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 2: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[2] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 3: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[3] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 4: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[4] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 5: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[5] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 6: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[6] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 7: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[7] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 8: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[8] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 9: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[9] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 10: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[10] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 11: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[11] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 12: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[12] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 13: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[13] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 14: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[14] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 15: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[15] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 16: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[16] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 17: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[17] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 18: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[18] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
            case 19: messageAlert = [[UIAlertView alloc]initWithTitle:placesToVisit[19] message:@"Great Choice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                break;
        }
    }
    
    
    
    // Display Alert Message
    [messageAlert show];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0: return @"Hotels";
            
        case 1: return @"Restaurants";
            
        case 2: return @"Places To Visit";
            
        default: return 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
