# ARWhatsNew
A simple and light-weight 'What's New' modal for new app updates.

This simple to use tool allows you to simply present a modal to your users to tell them what is new in your update!

# Preview

![preview](https://github.com/docash59/ARWhatsNew/blob/master/preview.png "Preview")

 - [appetize.io](https://appetize.io/app/1c835153f9h7k36ab1k2mub9p4?device=iphone6s&scale=75&orientation=portrait&osVersion=10.0)

# Properties

| Key | Type | Description |
|---|---|---|
| **backgroundColor** | `UIColor` | Sets background color |
| **dismissButtonColor** | `UIColor` | Sets `dismissButton` button background color |
| **dismissButtonText** | `NSString` | Changes text for `dismissButton` instead of the default "Get Started" |
| **releaseNotes** | `NSString` | The release notes for version release |
| **disableReadAllRequired** | `BOOL` | Disable `acceptButton` from being disabled until user scrolls to bottom. |
| **majorReleasesOnly** | `BOOL` | Show WhatsNew modal for only x.x formatted versions. App versions with x.x.x or greater will be ignored. |
| **resetWhatsNew** | `Void` | Resets `NSUserDefaults` key that determines whether WhatsNew has been seen or not and cached `releaseNotes`. |
| **userNotSeenWhatsNew** | `BOOL` | Determine whether the user has already seen and dismissed current version WhatsNew. |

# Compatibility and Requirements

- Xcode 7 or later.
 - iOS 7 or later.
 - Optimised for iPhone and iPad.
 - Localised

# Installation
 1. Copy **ARWhatsNew** folder into your Xcode project.
 2. `#import "ARWhatsNew.h"` into your .h file.

# Usage

### Example

Place in **ViewDidAppear**

    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"ARWhatsNew" bundle:nil];
    ARWhatsNew *svc = [mainStoryboard instantiateViewControllerWithIdentifier:@"WhatsNew"];
    svc.backgroundColor = [UIColor whiteColor];
    svc.dismissButtonColor = [UIColor blueColor];
    svc.dismissButtonText = @"LET'S BEGIN!";
    svc.disableReadAllRequired = YES;
    svc.majorReleasesOnly = NO;
    svc.dismissButtonText = @"DISMISS";
    svc.releaseNotes = @"Welcome to ARWhatsNew!";
    if ([[ARWhatsNew alloc] userNotSeenWhatsNew]) {
        [self presentViewController:svc animated:YES completion:nil];
    }

# FEATURES

## Automatic Title Colour Change

**ARWhatsNew** automatically changes the `textColor` acording to the primary and secondary colors you provide. For example, if you provide a black background then the text will turn white and vice-versa.

## Release Notes From App Store

From v1.2 of `ARWhatsNew`, the API can now get the release notes directly from the App Store and store the notes in `NSUserDeafults` for offline viewing otherwise an error will be shown.

**APP MUST EXIST IN APP STORE FOR THIS FEATURE TO FULLY WORK.
ALTERNATIVELY, PLEASE CONSIDER USING HARD CODED `releaseNotes`.**

## Checking Whats New has already been seen
**ARWhatsNew** does all the work for you. simply just call:

    [[ARWhatsNew alloc] userNotSeenWhatsNew];

This function checks the `NSUserDefault` to determine whether the user has not seen the current version of `ARWhatsNew`.

# Planned For The Future
 - <s>Automatically check `appid` in App Store.</s>
     - <s>Get release notes from App Store.</s>
 - <s>Only show Whats New for major releases. (opt.)</s>
     - <s>SHOW Whats New if version is `x.x`</s>
     - <s>DONT show Whats New for minimal version `x.x.x`</s>

# Contact, Support and Suggestions
If you have any requests of what you would like to see in the future please get in contact.
I am available on [Twitter](https://twitter.com/DocAsh59) or [create a new issue on GitHub](https://github.com/docash59/ARWhatsNew/issues).