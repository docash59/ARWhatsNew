//
//  ViewController.m
//  ARWhatsNew_Example
//
//  Created by Ashley Richards on 02/11/2016.
//  Copyright © 2016 Ashley Richards. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    ARWhatsNew *vc = [[ARWhatsNew alloc] initCheckAppVersion];
    vc.primaryColor = [UIColor blackColor];
    vc.secondaryColor = [UIColor yellowColor];
    vc.primaryTextColor = [UIColor whiteColor];
    vc.acceptButtonText = @"START APP";
    vc.disableReadAllRequired = YES;
    
    if ([vc whatsNewAlreadyShown]) {
        [self presentViewController:vc animated:YES completion:nil];
    }
}

-(IBAction)presentHardCoded {
    ARWhatsNew *vc = [[ARWhatsNew alloc] initCheckAppVersion];
    vc.primaryColor = [UIColor whiteColor];
    vc.secondaryColor = [UIColor redColor];
    vc.primaryTextColor = [UIColor blackColor];
    vc.releaseNotes = @"Welcome to ARWhatsNew.\n\n";
    vc.acceptButtonText = @"DISMISS";
    vc.disableReadAllRequired = YES;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
