//
//  Annotation.h
//  Visitr
//
//  Created by Rishi Masand on 2/22/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>
@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString * title;
@property(nonatomic, copy) NSString * subtitle;
@property(nonatomic, assign) MKPinAnnotationColor pinColor;
@property(nonatomic, copy) NSString *desc;
//@property(nonatomic) MKPinAnnotationColor *pinColor;

@end
