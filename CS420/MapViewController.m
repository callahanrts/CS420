//
//  ViewController.m
//  CS420
//
//  Created by Cody Callahan on 10/31/13.
//  Copyright (c) 2013 Cody Callahan. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize locationManager;
@synthesize path;
@synthesize mapView;
@synthesize camera;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set up location managing for logging latitude and longitude
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    // Set up Google maps
    camera = [GMSCameraPosition cameraWithLatitude:37
                                         longitude:-122
                                              zoom:17];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];

    path = [GMSMutablePath path];
    
    self.view = mapView;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *loc = [locations lastObject];
    [path addLatitude:loc.coordinate.latitude longitude:loc.coordinate.longitude];
    GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
    polyline.strokeColor = [UIColor blueColor];
    polyline.strokeWidth = 10.f;
    polyline.map = mapView;

    [mapView animateToLocation:CLLocationCoordinate2DMake(loc.coordinate.latitude, loc.coordinate.longitude)];

    NSLog(@"%f, %f", loc.coordinate.latitude, loc.coordinate.longitude);
    
}

-(void)startLocation{
    [locationManager startUpdatingLocation];
}

-(void)stopLocation{
    [locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
