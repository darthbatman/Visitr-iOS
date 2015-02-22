//
//  FirstViewController.h
//  Visitr
//
//  Created by Rishi Masand on 2/22/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *cityInput;
- (IBAction)submit:(id)sender;

@end

