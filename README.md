# ARWhatsNew
A simple and light-weight What's New modal for new app updates.

This neat tool allows you to simply present a modal to your users to tell them Whats New in your update!

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
| **majorReleasesOnly** | `BOOL` | Show WhatsNew modal for only x.x formatted versions. App versions with x.x.x or greater will be ignored. |
| **resetWhatsNew** | `Void` | Resets saved `NSUserDefaults` key that determines whether WhatsNew has been seen or not. |
| **appVersion** | `NSString` | Gets current app short version code. E.g. `x.x` |
| **showWhatsNew** | `Void` | One line of code to determine whether WhatsNew has been seen or not. |

# Compatibility and Requirements

- Xcode 7 or later.
 - iOS 7 or later.
 - Optimised for iPhone and iPad.

# Installation
 1. Copy **ARWhatsNew** folder into your Xcode project.
 2. `#import "ARWhatsNew.h"`

# Usage

### Example

Place in **ViewDidAppear**

        ARWhatsNew *vc = [[ARWhatsNew alloc] init];
        vc.primaryColor = [UIColor blackColor];
        vc.secondaryColor = [UIColor yellowColor];
        vc.acceptButtonText = @"START APP";
        vc.disableReadAllRequired = YES;
        vc.majorReleasesOnly = YES;
        [vc showWhatsNew];

### Automatic Title Colour Change

**ARWhatsNew** automatically changes the `textColor` acording to the primary and secondary colors you provide. For example, if you provide a black background then the text will turn white and vice-versa.

### Checking Whats New has already been seen
**ARWhatsNew** now does all the work for you. simply just call:

    [[[ARWhatsNew alloc] init] showWhatsNew];

This function checks the `NSUserDefault` to determine whether the modal has already been seen or not. If the user has not seen WhatsNew, then it will present the modal.

# Planned For The Future
 - Automatically check `appid` in App Store.
     - Get release notes from App Store.
 - <s>Only show Whats New for major releases. (opt.)</s>
     - <s>SHOW Whats New if version is `2.x`</s>
     - <s>DONT show Whats New for minimal version `2.x.x`</s>

If you have any requests of what you would like to see in the future please get in contact via [Twitter](https://twitter.com/DocAsh59) or [create a new issue](https://github.com/docash59/ARWhatsNew/issues) on GitHub.

# Contact & Support
I am available on [Twitter](https://twitter.com/DocAsh59) or [create a new issue](https://github.com/docash59/ARWhatsNew/issues) on GitHub.
