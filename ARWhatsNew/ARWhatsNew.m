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
@property IBOutlet UIButton *acceptButton;

@end

@implementation ARWhatsNew

-(instancetype)init {
    self.modalPresentationStyle = UIModalPresentationFormSheet;
    
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.primaryColor != nil) {
        self.view.backgroundColor = self.primaryColor;
    }
    if (self.secondaryColor != nil) {
        self.acceptButton.backgroundColor = self.secondaryColor;
    }
    
    self.labelWhatsNew.textColor = [self readableForegroundColorForBackgroundColor:self.primaryColor];
    self.labelInVersion.textColor = [self readableForegroundColorForBackgroundColor:self.primaryColor];
    self.labelReleaseNotes.textColor = [self readableForegroundColorForBackgroundColor:self.primaryColor];
    self.textViewNotes.textColor = [self readableForegroundColorForBackgroundColor:self.primaryColor];
    [self.acceptButton setTitleColor:[self readableForegroundColorForBackgroundColor:self.secondaryColor]
                            forState:UIControlStateNormal];
    
    self.textViewNotes.font = [UIFont systemFontOfSize:18];
    
        // Set and localise visible text
    [self.labelWhatsNew setText:NSLocalizedString(@"WHATS NEW",)];
    
    NSString *ver = [NSString stringWithFormat:@"IN VERSION %@", [self appVersion]];
    [self.labelInVersion setText:NSLocalizedString(ver, nil)];
    
        // Set and localise release notes in textView
    [self.textViewNotes setText:NSLocalizedString(self.releaseNotes,)];
    
        // Accept button
    if (self.acceptButtonText != nil) {
            // Change acceptButtonText title to determinted string
        [self.acceptButton setTitle:NSLocalizedString(self.acceptButtonText,)
                               forState:UIControlStateNormal];
    } else {
            // Set acceptButtonText to default string
        [self.acceptButton setTitle:NSLocalizedString(@"GET STARTED",)
                           forState:UIControlStateNormal];
    }
    
    [self.acceptButton setEnabled:self.disableReadAllRequired];
}

-(IBAction)GetStarted:(id)sender {
    NSString *verString = [NSString stringWithFormat:@"whatsNew_%@", [self appVersion]];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:verString];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)resetWhatsNew {
    NSString *verString = [NSString stringWithFormat:@"whatsNew_%@", [self appVersion]];
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
        [self.acceptButton setEnabled:YES];
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
-(BOOL)whatsNewNotShown {
    return ![[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"whatsNew_%@", [self appVersion]]] boolValue];
}


@end
