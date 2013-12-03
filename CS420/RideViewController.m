//
//  RideViewController.m
//  CS420
//
//  Created by Cody Callahan on 11/16/13.
//  Copyright (c) 2013 Cody Callahan. All rights reserved.
//

#import "RideViewController.h"

@interface RideViewController ()

@end

@implementation RideViewController
@synthesize _timer;
@synthesize startDate;
@synthesize clockLabel;
@synthesize speedLabel;
@synthesize distanceLabel;
@synthesize map;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    map = self.tabBarController.viewControllers[3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)startClock:(id)sender {
    if (_timer == nil)
    {
        startDate = [NSDate date];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                  target:self
                                                selector:@selector(_timerFired)
                                                userInfo:nil
                                                 repeats:YES];
        [map startLocation];
    }
}

- (IBAction)stopClock:(id)sender {
    if (_timer != nil)
    {
        [_timer invalidate];
        _timer = nil;
        [map stopLocation];
    }
}

- (void)_timerFired
{
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    NSString *timeString=[dateFormatter stringFromDate:timerDate];
    clockLabel.text = timeString;
}

@end
