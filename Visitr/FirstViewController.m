//
//  FirstViewController.m
//  Visitr
//
//  Created by Rishi Masand on 2/22/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "Annotation.h"

@interface FirstViewController ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation FirstViewController
@synthesize mapView, cityInput;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CLLocationCoordinate2D) geoCodeUsingAddress:(NSString *)theCity {
    double latitude = 0, longitude = 0;
    NSString *city_addr =  [theCity
                            stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString
                     stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?address=%@",
                     city_addr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL
                                                          URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\" :" intoString:nil] &&
            [scanner scanString:@"\"lat\" :" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"\"lng\" :" intoString:nil]
                && [scanner scanString:@"\"lng\" :" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
    }
    
    CLLocationCoordinate2D center;
    center.latitude = latitude;
    center.longitude = longitude;
    return center;
    
}

- (IBAction)submit:(id)sender {
    
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    
    
    
    NSMutableArray * annotationsToRemove = [ mapView.annotations mutableCopy ] ;
    [ annotationsToRemove removeObject:mapView.userLocation ] ;
    [ mapView removeAnnotations:annotationsToRemove ] ;
    
    [self.cityInput endEditing:YES];
    
    CLLocationCoordinate2D cityCoordinate = [self geoCodeUsingAddress:cityInput.text];
    
    NSLog(@"%@ Coordinates: %f, %f", cityInput.text, cityCoordinate.latitude, cityCoordinate.longitude);
    
    CLLocationCoordinate2D newCoordinate;
    newCoordinate.latitude = (cityCoordinate.latitude - 0.04);
    newCoordinate.longitude = (cityCoordinate.longitude - 0.1375);
    
    MKCoordinateRegion region;
    region.center = newCoordinate;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.1f;
    span.longitudeDelta = 0.1f;
    region.span = span;
    
    [mapView setRegion:region animated:YES];
    
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc]init];
    request.naturalLanguageQuery = @"Hotel";
    request.region = region;
    
    MKLocalSearch *localSearch = [[MKLocalSearch alloc]initWithRequest:request];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        
        
        NSMutableArray *theHotels = [NSMutableArray array];
        NSMutableArray *theHotelNames = [NSMutableArray array];
        
        [response.mapItems enumerateObjectsUsingBlock:^(MKMapItem *item, NSUInteger idx, BOOL *stop) {
            
            for (id<MKAnnotation>annotation in mapView.annotations) {
                if (annotation.coordinate.latitude == item.placemark.coordinate.latitude && annotation.coordinate.longitude == item.placemark.coordinate.longitude) {
                    return;
                }
            }
            
            CLLocationCoordinate2D hotelCoordinate;
            hotelCoordinate.latitude = item.placemark.coordinate.latitude;
            hotelCoordinate.longitude = item.placemark.coordinate.longitude;
            
            Annotation *aHotel;
            aHotel = [[Annotation alloc]init];
            aHotel.title = item.name;
            aHotel.coordinate = hotelCoordinate;
            
            [theHotels addObject:aHotel];
            [theHotelNames addObject:item.name];
            
            
        }];
        [mapView addAnnotations:theHotels];
        
        [self.userDefaults setObject:theHotelNames forKey:@"hotelArray"];
        [self.userDefaults synchronize];
        
    }];
    
    
    request.naturalLanguageQuery = @"Restaurant";
    request.region = region;
    
    MKLocalSearch *localSearch2 = [[MKLocalSearch alloc]initWithRequest:request];
    [localSearch2 startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        
        
        NSMutableArray *theRestaurants = [NSMutableArray array];
        NSMutableArray *theRestaurantNames = [NSMutableArray array];
        
        [response.mapItems enumerateObjectsUsingBlock:^(MKMapItem *item, NSUInteger idx, BOOL *stop) {
            
            for (id<MKAnnotation>annotation in mapView.annotations) {
                if (annotation.coordinate.latitude == item.placemark.coordinate.latitude && annotation.coordinate.longitude == item.placemark.coordinate.longitude) {
                    return;
                }
            }
            
            CLLocationCoordinate2D restaurantCoordinate;
            restaurantCoordinate.latitude = item.placemark.coordinate.latitude;
            restaurantCoordinate.longitude = item.placemark.coordinate.longitude;
            
            Annotation *aRestaurant;
            aRestaurant = [[Annotation alloc]init];
            aRestaurant.title = item.name;
            aRestaurant.coordinate = restaurantCoordinate;
            
            [theRestaurants addObject:aRestaurant];
            [theRestaurantNames addObject:item.name];
        }];
        [mapView addAnnotations:theRestaurants];
        [self.userDefaults setObject:theRestaurantNames forKey:@"restaurantArray"];
        [self.userDefaults synchronize];
    }];
    
    
    request.naturalLanguageQuery = @"park";
    request.region = region;
    
    MKLocalSearch *localSearch3 = [[MKLocalSearch alloc]initWithRequest:request];
    [localSearch3 startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        
        
        NSMutableArray *theParks = [NSMutableArray array];
        NSMutableArray *theParkNames = [NSMutableArray array];
        
        [response.mapItems enumerateObjectsUsingBlock:^(MKMapItem *item, NSUInteger idx, BOOL *stop) {
            
            for (id<MKAnnotation>annotation in mapView.annotations) {
                if (annotation.coordinate.latitude == item.placemark.coordinate.latitude && annotation.coordinate.longitude == item.placemark.coordinate.longitude) {
                    return;
                }
            }
            
            CLLocationCoordinate2D parkCoordinate;
            parkCoordinate.latitude = item.placemark.coordinate.latitude;
            parkCoordinate.longitude = item.placemark.coordinate.longitude;
            
            Annotation *aPark;
            aPark = [[Annotation alloc]init];
            aPark.title = item.name;
            aPark.coordinate = parkCoordinate;
            
            [theParks addObject:aPark];
            [theParkNames addObject:item.name];
        }];
        [mapView addAnnotations:theParks];
        [self.userDefaults setObject:theParkNames forKey:@"parkArray"];
        [self.userDefaults synchronize];
    }];
    
    
    request.naturalLanguageQuery = @"museum";
    request.region = region;
    
    MKLocalSearch *localSearch4 = [[MKLocalSearch alloc]initWithRequest:request];
    [localSearch4 startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        
        
        NSMutableArray *theMuseums = [NSMutableArray array];
        NSMutableArray *theMuseumNames = [NSMutableArray array];
        
        [response.mapItems enumerateObjectsUsingBlock:^(MKMapItem *item, NSUInteger idx, BOOL *stop) {
            
            for (id<MKAnnotation>annotation in mapView.annotations) {
                if (annotation.coordinate.latitude == item.placemark.coordinate.latitude && annotation.coordinate.longitude == item.placemark.coordinate.longitude) {
                    return;
                }
            }
            
            CLLocationCoordinate2D museumCoordinate;
            museumCoordinate.latitude = item.placemark.coordinate.latitude;
            museumCoordinate.longitude = item.placemark.coordinate.longitude;
            
            Annotation *aMuseum;
            aMuseum = [[Annotation alloc]init];
            aMuseum.title = item.name;
            aMuseum.coordinate = museumCoordinate;
            
            [theMuseums addObject:aMuseum];
            [theMuseumNames addObject:item.name];
        }];
        [mapView addAnnotations:theMuseums];
        [self.userDefaults setObject:theMuseumNames forKey:@"museumArray"];
        [self.userDefaults synchronize];
    }];
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.cityInput endEditing: YES];
    
}

@end
