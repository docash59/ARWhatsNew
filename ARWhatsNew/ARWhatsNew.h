//
//  ARWhatsNew.h
//  
//
//  Created by Ashley Richards on 02/11/2016.
//  @DocAsh59 on Twitter
//
//

#import <UIKit/UIKit.h>

@interface ARWhatsNew : UIViewController
    // Background color
@property UIColor *backgroundColor;
    // Button background color
@property UIColor *dismissButtonColor;
    // Show the Release Notes
@property NSString *releaseNotes;
    // Change default for button instade of 'Get Started'.
@property NSString *dismissButtonText;
    // Disable "Get Started" button from being disabled until user scrolls to bottom.
@property BOOL disableReadAllRequired;
    // Determine to show modal for x.x or x.x.x
@property BOOL majorReleasesOnly;

-(void)resetWhatsNew;
-(BOOL)userNotSeenWhatsNew;

@end
