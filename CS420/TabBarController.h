//
//  TabBarController.h
//  CS420
//
//  Created by Cody Callahan on 11/16/13.
//  Copyright (c) 2013 Cody Callahan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface TabBarController : UITabBarController

@end
