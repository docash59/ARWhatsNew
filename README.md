# ARWhatsNew
A simple and light-weight What's New modal for new app updates.

# Functions

| Key | Type | Description |
|--|--|--|
| **primaryColor** | `UIColor` | Set view background color |
| **secondaryColor** | `UIColor` | Set "Get Started" button background color |
| **primaryTextColor** | `UIColor` | Set text color for "**Whats New**", "**In Version X**", "**Release Notes**" and version notes. |
| **getStartedText** | `NSString` | Change default text for button instad of "Get Started" |
| **disableRequiredToReadAll** | `BOOL` | Disable "Get Started" button from being disabled until user scrolls to bottom. |
| **checkAndPresentWhatsNew** | `Void` | Checks if user has already seen Whats New. If not, present View Controller. |
| **presentWhatsNewWithNotes** | `Void` | Presents Whats New with hardcoded notes and no checking if already seen. |

# Compatibility and Requirements

**ARWhatsNew** uses the standard UIKit so can pretty much be used with any version of Xcode / iOS.
 - Xcode 6 or later.
 - iOS 7 or later.
 - Optimised for iPhone and iPad.

# Installation
Simply copy **ARWhatsNew** folder into your Xcode project.
