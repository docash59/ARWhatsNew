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
@property IBOutlet UIButton *getStartedButton;

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
        // Set colors
    self.view.backgroundColor = self.primaryColor;
    self.labelWhatsNew.textColor = self.primaryTextColor;
    self.labelInVersion.textColor = self.primaryTextColor;
    self.labelReleaseNotes.textColor = self.primaryTextColor;
    
    self.textViewNotes.textColor = self.primaryTextColor;
    self.textViewNotes.font = [UIFont systemFontOfSize:18];
    
    self.getStartedButton.titleLabel.textColor = self.primaryColor;
    self.getStartedButton.backgroundColor = self.secondaryColor;
    
        // Set and localise visible text
    [self.labelWhatsNew setText:NSLocalizedString(@"WHATS NEW",)];
    [self.textViewNotes setText:[NSString stringWithFormat:NSLocalizedString(@"IN VERSION %@",), [self appVersion]]];
    
    if (self.getStartedText != nil) {
        [self.getStartedButton setTitle:NSLocalizedString(self.getStartedText,)
                               forState:UIControlStateNormal];
    } else {
        [self.getStartedButton setTitle:NSLocalizedString(@"GET STARTED",) forState:UIControlStateNormal];
    }
    
    [self.getStartedButton setEnabled:self.disableReadAllRequired];
    
    [super viewDidLoad];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
        // Get Started button is disabled until user reads the entire version log
    if (bottomEdge >= scrollView.contentSize.height) {
        [self.getStartedButton setEnabled:YES];
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
