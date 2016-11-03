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

-(instancetype)initCheckAppVersion {
    self = [super initWithNibName:NSStringFromClass([ARWhatsNew class]) bundle:nil];
    if (self) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            self.modalPresentationStyle = UIModalPresentationFormSheet;
        }
    }
    return self;
}

-(void)viewDidLoad {
    if (self.primaryColor != nil) {
        self.view.backgroundColor = self.primaryColor;
        self.acceptButton.titleLabel.textColor = self.primaryColor;
    }
    if (self.secondaryColor != nil) {
        self.acceptButton.backgroundColor = self.secondaryColor;
    }
    if (self.primaryTextColor != nil) {
        self.labelWhatsNew.textColor = self.primaryTextColor;
        self.labelInVersion.textColor = self.primaryTextColor;
        self.labelReleaseNotes.textColor = self.primaryTextColor;
        self.textViewNotes.textColor = self.primaryTextColor;
    }
    
    self.textViewNotes.font = [UIFont systemFontOfSize:18];
    
        // Set and localise visible text
    [self.labelWhatsNew setText:NSLocalizedString(@"WHATS NEW",)];
    [self.textViewNotes setText:[NSString stringWithFormat:NSLocalizedString(@"IN VERSION %@",), [self appVersion]]];
    
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
    
    [super viewDidLoad];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
        // AcceptButtonText is disabled until user reads the entire version log unless disableReadAllRequired is set to YES
    if (bottomEdge >= scrollView.contentSize.height) {
        [self.acceptButton setEnabled:YES];
    }
}

-(IBAction)GetStarted:(id)sender {
    NSString *verString = [NSString stringWithFormat:@"whatsNew_%@", [self appVersion]];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:verString];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
-(BOOL)whatsNewAlreadyShown {
    return ![[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"whatsNew_%@", [self appVersion]]] boolValue];
}


@end
