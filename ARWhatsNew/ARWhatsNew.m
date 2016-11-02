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

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

-(void)checkAndPresentWhatsNew {
    NSString *verStr = [NSString stringWithFormat:@"whatsNew_%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    
        // Check if verStr has been seen already
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:verStr] boolValue]) {
            // If not then present View Controller
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"iphone" bundle:nil];
        UIViewController *svc = [mainStoryboard instantiateViewControllerWithIdentifier:@"whatsnew"];
            // Present in FormSheet if on iPad
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            svc.modalPresentationStyle = UIModalPresentationFormSheet;
        }
        
        [self presentViewController:svc animated:YES completion:nil];
    }
}
-(void)presentWhatsNewWithNotes:(NSString *)notes {
    
    self.textViewNotes.text = NSLocalizedString(notes,);
}

-(void)checkAndPresentWhatsNewPrimaryColor:(UIColor *)priCol secondaryColor:(UIColor *)secCol primaryTextColor:(UIColor *)priTxtCol getStartedText:(NSString *)getStartedText disableReadAll:(BOOL)disableRA {
    
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
    [self.textViewNotes setText:[NSString stringWithFormat:NSLocalizedString(@"IN VERSION %@",), [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]]];
    
    if (self.getStartedText != nil) {
        [self.getStartedButton setTitle:NSLocalizedString(self.getStartedText,) forState:UIControlStateNormal];
    } else {
        [self.getStartedButton setTitle:NSLocalizedString(@"Get Started",) forState:UIControlStateNormal];
    }
    
    [self.getStartedButton setEnabled:self.disableRequiredToReadAll];
    
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
    NSString *verString = [NSString stringWithFormat:@"whatsNew_%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"1" forKey:verString];
    [defaults synchronize];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end
