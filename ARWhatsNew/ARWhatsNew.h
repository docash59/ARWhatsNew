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

-(instancetype)initCheckAppVersion;

    // Background color
@property UIColor *primaryColor;
    // Button background color
@property UIColor *secondaryColor;
    // "Whats New", "In Version vX", "Release Notes" and version notes text color.
@property UIColor *primaryTextColor;
    // Show the Release Notes
@property NSString *releaseNotes;
    // Change default for button instade of 'Get Started'.
@property NSString *acceptButtonText;
    // Disable "Get Started" button from being disabled until user scrolls to bottom.
@property BOOL disableReadAllRequired;

-(NSString*)appVersion;
-(BOOL)whatsNewAlreadyShown;

@end
