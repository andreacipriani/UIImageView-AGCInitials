# UIImageView-AGCInitials

[![CI Status](http://img.shields.io/travis/andreacipriani/UIImageView-AGCInitials.svg?style=flat)](https://travis-ci.org/andreacipriani/UIImageView-AGCInitials)
[![Version](https://img.shields.io/cocoapods/v/UIImageView-AGCInitials.svg?style=flat)](http://cocoapods.org/pods/UIImageView-AGCInitials)
[![License](https://img.shields.io/cocoapods/l/UIImageView-AGCInitials.svg?style=flat)](http://cocoapods.org/pods/UIImageView-AGCInitials)
[![Platform](https://img.shields.io/cocoapods/p/UIImageView-AGCInitials.svg?style=flat)](http://cocoapods.org/pods/UIImageView-AGCInitials)

![AGCInitials Example screenshot 1](Screenshots/agc_screen1.png)
![AGCInitials Example screenshot 2](Screenshots/agc_screen2.png)

When a contact doesn't have an image it's cool to show a colored placeholder with his initials! 
There are other categories on GitHub to set an image placeholder with the contact's initials, but they can't be used inside a Table/Collection View because the background color of the image changes with cell recycle. 🤔

Don't worry, you can use **AGCInitials** 😉

### Features

- Super easy
- Background colors will remain the same for identical names, so **you can use it in your table/collection view**. 😎
- You can set your own color palette
- Good test coverage 💪

### How to use it - Basic

Import the category 

```objective-c
#import "UIImageView+AGCInitials.h"
```
and then just use it:

```objective-c
[_anImageView agc_setImageWithInitialsFromName:@"Mick Jagger" separatedByString:@" "];
```
The image will contain a placeholder with the initials "MJ" and a generated background color.

### How to use it - Details

If you want you can **customize the font** by specifying the text attributes:

```objective-c
NSDictionary* initialsTextAttributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:20], NSForegroundColorAttributeName : [UIColor purpleColor] };
[cellImageView agc_setImageWithInitialsFromName:@"Mick Jagger" separatedByString:@" " withTextAttributes:initialsTextAttributes];
```

You can also customize the **color palette** used to generate background colors:

```objective-c
#import "AGCInitialsColors.h"
```

And then just set your palette before using the category:

```objective-c
NSArray<UIColor*>* yourColorPalette; //...
[[AGCInitialsColors sharedInstance] setColorPalette:yourColorPalette];
```

### Requirements

- iOS 7+

### Installation with Cocoapods

UIImageView-AGCInitials is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "UIImageView-AGCInitials"
```

### Installation without Cocoapods

Copy and paste *AGCInitialsColors.h/m* and *UIImageView+AGCInitials.h/m* classes into your project.

### Run the example 

To run the example project, clone the repo, and run `pod install` from the Example directory first. 

You can even [try the example online with Appetize](https://appetize.io/app/xux5c10x6a3851ryz9ywddu4ng)

### Author

Andrea Cipriani, andrea.g.cipriani@gmail.com - Twitter [@AndreaCipriani](https://twitter.com/AndreaCipriani)

### License

UIImageView-AGCInitials is available under the MIT license. See the LICENSE file for more info.
