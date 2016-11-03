# ARWhatsNew
A simple and light-weight What's New modal for new app updates.

# Functions

| Key | Type | Description |
|---|---|---|
| **primaryColor** | `UIColor` | Set view background color |
| **secondaryColor** | `UIColor` | Set "Get Started" button background color |
| **primaryTextColor** | `UIColor` | Set text color for "**Whats New**", "**In Version X**", "**Release Notes**" and version notes. |
| **getStartedText** | `NSString` | Change default text for button instad of "Get Started" |
| **releaseNotes** | `NSString` | The release notes for the release |
| **disableReadAllRequired** | `BOOL` | Disable `acceptButton` from being disabled until user scrolls to bottom. |

# Compatibility and Requirements

**ARWhatsNew** uses the standard UIKit so can pretty much be used with any version of Xcode / iOS.

But I would recommend:
 - Xcode 7 or later.
 - iOS 7 or later.
 - Optimised for iPhone and iPad.

# Installation
 1. Copy **ARWhatsNew** folder into your Xcode project.
 2. `#import "ARWhatsNew.h"`

# Usage

### Example

    ARWhatsNew *vc = [[ARWhatsNew alloc] initCheckAppVersion];
        vc.primaryColor = [UIColor blackColor];
        vc.secondaryColor = [UIColor yellowColor];
        vc.primaryTextColor = [UIColor whiteColor];
        vc.acceptButtonText = @"START APP";
        vc.disableReadAllRequired = YES;
        
        if ([vc whatsNewAlreadyShown]) {
            [self presentViewController:vc animated:YES completion:nil];
        }

### Checking WhatsNew has already been shown
ARWhatsNew provides a simple bool that returns:

 - **YES** - If user **HASN'T** seen Whats New
 - **NO** - If the user **HAS** seen Whats New


     [[ARWhatsNew alloc] whatsNewAlreadyShown]

# Planned Future Features
 - Automatically check `appid` in App Store.
	 - Get release notes from App Store.
 - Only show Whats New for major releases. (opt.)
	 - SHOW Whats New if version is `2.x` 
	 - DONT show Whats New for minimal version `2.x.x`