//
//  ARWhatsNew.m
//  
//
//  Created by Ashley Richards on 02/11/2016.
//  @DocAsh59 on Twitter
//
//

#import "ARWhatsNew.h"

@interface ARWhatsNew ()

@property IBOutlet UILabel *labelWhatsNew;
@property IBOutlet UILabel *labelInVersion;
@property IBOutlet UILabel *labelReleaseNotes;
@property IBOutlet UITextView *textViewNotes;
@property IBOutlet UIButton *dismissButton;

@end

@implementation ARWhatsNew

-(instancetype)init {
    self.modalPresentationStyle = UIModalPresentationFormSheet;
    
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.backgroundColor != nil) {
        self.view.backgroundColor = self.backgroundColor;
    }
    if (self.dismissButtonColor != nil) {
        self.dismissButton.backgroundColor = self.dismissButtonColor;
    }
    
    self.labelWhatsNew.textColor = [self readableForegroundColorForBackgroundColor:self.backgroundColor];
    self.labelInVersion.textColor = [self readableForegroundColorForBackgroundColor:self.backgroundColor];
    self.labelReleaseNotes.textColor = [self readableForegroundColorForBackgroundColor:self.backgroundColor];
    self.textViewNotes.textColor = [self readableForegroundColorForBackgroundColor:self.backgroundColor];
    [self.dismissButton setTitleColor:[self readableForegroundColorForBackgroundColor:self.dismissButtonColor]
                            forState:UIControlStateNormal];
    
    self.textViewNotes.font = [UIFont systemFontOfSize:17];
    
        // Set and localise visible text
    [self.labelWhatsNew setText:NSLocalizedString(@"WHATS NEW",)];
    
    NSString *ver = [NSString stringWithFormat:@"IN VERSION %@", [self appVersion]];
    [self.labelInVersion setText:NSLocalizedString(ver, nil)];
    
        // Set and localise release notes in textView.
        // Check if hardcoded releaseNotes were supplied.
    if (self.releaseNotes != nil) {
        // If there is a hardcoded string then show that.
        [self.textViewNotes setText:NSLocalizedString(self.releaseNotes,)];
        
        [[NSUserDefaults standardUserDefaults] setObject:NSLocalizedString(self.releaseNotes,) forKey:@"ARWhatsNewReleaseNotes"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    // Check if there are already existing release notes stored on device.
    else if ([[NSUserDefaults standardUserDefaults] objectForKey:@"ARWhatsNewReleaseNotes"] != nil) {
        // Load saved release notes into view.
        [self.textViewNotes setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"ARWhatsNewReleaseNotes"]];
    }else {
        // If releaseNotes was not provided then get release notes from
        NSDictionary* infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString* appID = infoDictionary[@"CFBundleIdentifier"];
        NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?bundleId=%@", appID]];
        NSData* data = [NSData dataWithContentsOfURL:url];
        NSDictionary* lookup = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        if ([lookup[@"resultCount"] integerValue] == 1){
            // Set and localise release notes in textView
            NSString *storeReleaseNotes = lookup[@"results"][0][@"releaseNotes"];
            
            [self.textViewNotes setText:NSLocalizedString(storeReleaseNotes,)];
            [[NSUserDefaults standardUserDefaults] setObject:storeReleaseNotes forKey:@"ARWhatsNewReleaseNotes"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        } else {
            // If no app was found with the BundleID of project then show error message.
            [self.textViewNotes setText:NSLocalizedString(@"App not available on the App Store.\n\nPlease contact the developer.",)];
        }
    }
    
        // Accept button
    if (self.dismissButtonText != nil) {
            // Change acceptButtonText title to determinted string
        [self.dismissButton setTitle:NSLocalizedString(self.dismissButtonText,)
                               forState:UIControlStateNormal];
    } else {
            // Set acceptButtonText to default string
        [self.dismissButton setTitle:NSLocalizedString(@"GET STARTED",)
                           forState:UIControlStateNormal];
    }
    
    [self.dismissButton setEnabled:!self.disableReadAllRequired];
}

-(IBAction)GetStarted:(id)sender {
    NSString *verString = [NSString stringWithFormat:@"whatsNew_%@", [self appVersion]];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:verString];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)resetWhatsNew {
    NSString *verString = [NSString stringWithFormat:@"whatsNew_%@", [self appVersion]];
    
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"ARWhatsNewReleaseNotes"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:verString];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)viewDidLayoutSubviews {
    // Scrolls TextView to the top.
    [self.textViewNotes setContentOffset:CGPointZero animated:NO];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
        // AcceptButtonText is disabled until user reads the entire version log unless disableReadAllRequired is set to YES
    if (bottomEdge >= scrollView.contentSize.height) {
        [self.dismissButton setEnabled:YES];
    }
}

- (UIColor *)readableForegroundColorForBackgroundColor:(UIColor*)backgroundColor {
    size_t count = CGColorGetNumberOfComponents(backgroundColor.CGColor);
    const CGFloat *componentColors = CGColorGetComponents(backgroundColor.CGColor);
    
    CGFloat darknessScore = 0;
    if (count == 2) {
        darknessScore = (((componentColors[0]*255) * 299) + ((componentColors[0]*255) * 587) + ((componentColors[0]*255) * 114)) / 1000;
    } else if (count == 4) {
        darknessScore = (((componentColors[0]*255) * 299) + ((componentColors[1]*255) * 587) + ((componentColors[2]*255) * 114)) / 1000;
    }
    
    if (darknessScore >= 125) {
        return [UIColor blackColor];
    }
    
    return [UIColor whiteColor];
}

-(NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

-(BOOL)userNotSeenWhatsNew {
    // Get number of . in version number
    NSUInteger numberOfOccurrences = [[self.appVersion componentsSeparatedByString:@"."] count] - 1;
    
    // Check if WhatsNew has already been presented
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"whatsNew_%@",
                                                              [self appVersion]]] boolValue]) {
        // WhatsNew hasn't been presented for version
        // Check if majorRelesesOnly is enabled
        if (self.majorReleasesOnly && (int)numberOfOccurrences == 1) {
            // Check if only one . is detected
            return YES;
        }
        
        if (!self.majorReleasesOnly) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

@end
