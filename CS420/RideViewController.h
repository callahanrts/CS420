//
//  RideViewController.h
//  CS420
//
//  Created by Cody Callahan on 11/16/13.
//  Copyright (c) 2013 Cody Callahan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"

@interface RideViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *clockLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (nonatomic, retain) NSTimer *_timer;
@property (nonatomic, retain) NSDate *startDate;
@property (nonatomic, retain) MapViewController *map;

- (IBAction)startClock:(id)sender;
- (IBAction)stopClock:(id)sender;

@end
