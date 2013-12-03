//
//  ViewController.h
//  CS420
//
//  Created by Cody Callahan on 10/31/13.
//  Copyright (c) 2013 Cody Callahan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) GMSMutablePath *path;
@property (nonatomic, retain) GMSCameraPosition *camera;
@property (nonatomic, retain) GMSMapView *mapView;

-(void)startLocation;
-(void)stopLocation;

@end
