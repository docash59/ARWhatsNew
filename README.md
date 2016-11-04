

# ARWhatsNew
A simple and light-weight What's New modal for new app updates.

# Preview

![preview](https://github.com/docash59/ARWhatsNew/blob/master/preview.png "Preview")

 - [appetize.io](https://appetize.io/app/1c835153f9h7k36ab1k2mub9p4?device=iphone6s&scale=75&orientation=portrait&osVersion=10.0)

# Properties

| Key | Type | Description |
|---|---|---|
| **primaryColor** | `UIColor` | Sets background color |
| **secondaryColor** | `UIColor` | Sets `acceptButton` button background color |
| **acceptButtonText** | `NSString` | Changes default text for button instead of the default "Get Started" |
| **releaseNotes** | `NSString` | The release notes for the release |
| **disableReadAllRequired** | `BOOL` | Disable `acceptButton` from being disabled until user scrolls to bottom. |
| **resetWhatsNew** | `Void` | Resets current version `whatsNew_x` key in `NSUserDefault` |
| **appVersion** | `NSString` | Gets current app short version code. E.g. `1.0` |
| **whatsNewNotShown** | `BOOL` | Disable `acceptButton` from being disabled until user scrolls to bottom. |

# Compatibility and Requirements

- Xcode 7 or later.
 - iOS 7 or later.
 - Optimised for iPhone and iPad.

# Installation
 1. Copy **ARWhatsNew** folder into your Xcode project.
 2. `#import "ARWhatsNew.h"`

# Usage

### Example

        ARWhatsNew *vc = [[ARWhatsNew alloc] init];
        vc.primaryColor = [UIColor blackColor];
        vc.secondaryColor = [UIColor yellowColor];
        vc.acceptButtonText = @"START APP";
        vc.disableReadAllRequired = YES;
        
        if ([vc whatsNewAlreadyShown]) {
            [self presentViewController:vc animated:YES completion:nil];
        }

### Automatic Title Colour Change

**ARWhatsNew** automatically changes the `textColor` acording to the primary and secondary colors you provide. For example, if you provide a black background then the text will turn white and vice-versa.

### Checking Whats New has already been seen
**ARWhatsNew** provides a simple `BOOL` called `whatsNewNotShown` that returns:

 - **`YES`** - If user **HASN'T** seen Whats New
 - **`NO`** - If the user **HAS** seen Whats New


        if ([ARWhatsNew alloc] init] whatsNewNotShown]) {
            // Present modal
        }

# Planned For The Future
 - Automatically check `appid` in App Store.
     - Get release notes from App Store.
 - Only show Whats New for major releases. (opt.)
     - SHOW Whats New if version is `2.x` 
     - DONT show Whats New for minimal version `2.x.x`

# Contact & Support
I am available on [Twitter](https://twitter.com/DocAsh59) or [Create a new Issue](https://github.com/docash59/ARWhatsNew/issues)
