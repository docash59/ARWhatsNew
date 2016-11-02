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
    // "Whats New", "In Version vX", "Release Notes" and version notes text color.
@property UIColor *primaryTextColor;
    // Change default for button instade of 'Get Started'.
@property NSString *getStartedText;
    // Disable "Get Started" button from being disabled until user scrolls to bottom.
@property BOOL disableRequiredToReadAll;

    // Checks if user has already seen Whats New. If not, present View Controller.
-(void)checkAndPresentWhatsNew;
    // Checks if user has already seen Whats New. If not, present View Controller.
-(void)checkAndPresentWhatsNewPrimaryColor:(UIColor*)priCol secondaryColor:(UIColor*)secCol primaryTextColor:(UIColor*)priTxtCol getStartedText:(NSString*)getStartedText disableReadAll:(BOOL)disableRA;
    // Presents Whats New with hardcoded notes and no checking if already seen.
-(void)presentWhatsNewWithNotes:(NSString*)notes;

@end
