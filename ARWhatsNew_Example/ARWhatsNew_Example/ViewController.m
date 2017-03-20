//
//  ViewController.m
//  ARWhatsNew_Example
//
//  Created by Ashley Richards on 02/11/2016.
//  Copyright © 2016 Ashley Richards. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property IBOutlet UISwitch *switchReadAllRequired;
@property IBOutlet UISwitch *switchMajorRelease;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"ARWhatsNew" bundle:nil];
    ARWhatsNew *svc = [mainStoryboard instantiateViewControllerWithIdentifier:@"WhatsNew"];
    svc.dismissButtonText = @"DISMISS";
    svc.releaseNotes = @"Welcome to ARWhatsNew!\n\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,";
    if ([[ARWhatsNew alloc] userNotSeenWhatsNew]) {
        [self presentViewController:svc animated:YES completion:nil];
    }
}

-(IBAction)presentHardCoded {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"ARWhatsNew" bundle:nil];
    ARWhatsNew *svc = [mainStoryboard instantiateViewControllerWithIdentifier:@"WhatsNew"];
    svc.backgroundColor = [UIColor whiteColor];
    svc.dismissButtonColor = [UIColor blueColor];
    svc.dismissButtonText = @"LET'S BEGIN!";
    svc.disableReadAllRequired = self.switchReadAllRequired.on;
    svc.majorReleasesOnly = self.switchMajorRelease.on;
    svc.releaseNotes = @"HARD CODED RELEASE NOTES.\n\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc.";
    [self presentViewController:svc animated:YES completion:nil];
}

-(IBAction)presentAppStore {
    [[ARWhatsNew alloc] resetWhatsNew];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"ARWhatsNew" bundle:nil];
    ARWhatsNew *svc = [mainStoryboard instantiateViewControllerWithIdentifier:@"WhatsNew"];
    svc.backgroundColor = [UIColor darkGrayColor];
    svc.dismissButtonColor = [UIColor blackColor];
    svc.dismissButtonText = @"UNDERSTOOD";
    [self presentViewController:svc animated:YES completion:nil];
}

-(IBAction)resetSeenWhatsNews:(id)sender {
    [[ARWhatsNew alloc] resetWhatsNew];
}

@end
