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
@property UIColor *primaryColor;
    // Button background color
@property UIColor *secondaryColor;
    // Show the Release Notes
@property NSString *releaseNotes;
    // Change default for button instade of 'Get Started'.
@property NSString *acceptButtonText;
    // Disable "Get Started" button from being disabled until user scrolls to bottom.
@property BOOL disableReadAllRequired;

-(void)resetWhatsNew;
-(NSString*)appVersion;
-(BOOL)whatsNewNotShown;

@end
