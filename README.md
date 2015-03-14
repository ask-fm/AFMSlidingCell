# AFMSlidingCell

[![CI Status](http://img.shields.io/travis/ask-fm/AFMInfoBanner.svg?style=flat)](https://travis-ci.org/ask-fm/AFMInfoBanner)
[![Version](https://img.shields.io/cocoapods/v/AFMInfoBanner.svg?style=flat)](http://cocoadocs.org/docsets/AFMInfoBanner)
[![License](https://img.shields.io/cocoapods/l/AFMInfoBanner.svg?style=flat)](http://cocoadocs.org/docsets/AFMInfoBanner)
[![Platform](https://img.shields.io/cocoapods/p/AFMInfoBanner.svg?style=flat)](http://cocoadocs.org/docsets/AFMInfoBanner)

AFMSlidingCell is UITableViewCell sublclass for showing any kind of buttons underneath the cell itself,
revealable by swipe. It is a common way of displaying any cell-related actions (e.g. deletion)
without overloading default UI.

![Animated Example](https://raw.githubusercontent.com/ask-fm/AFMSlidingCell/master/res/sliding_cell.gif)

AFMSlidingCell supports up to two differently sized UIButtons added to the cell's right side
and can be used both directly from the Interface Builder and as superclass for custom cell.

## Usage

AFMSlidingCell can be used directly from the Interface Builder - just set UITableViewCell's
class to AFMSlidingCell in Identity inspector tap.

Most common usage way is creating custom UITableViewCell. Simply subclass AFMSlidingCell
instead of UITableViewCell and you're ready to go!

After dequeuing your cell, UIButton can be added to it:

```objective-c
AFMSlidingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AFMSlidingCell" forIndexPath:indexPath];
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
[button setBackgroundColor:[UIColor greenColor]];
[cell addFirstButton:button withWidth:42.0 withTappedBlock:^(AFMSlidingCell *cell) {
  NSLog(@"Cell tapped");
}];
```

You can add any UIButton of any type, configure it's states, images, etc..
Two buttons may be added in total:

```objective-c
[cell addFirstButton:firstButton withWidth:23.0 withTappedBlock:^(AFMSlidingCell *cell) {
  NSLog(@"First button tapped");
[cell addSecondButton:button withWidth:42.0 withTappedBlock:^(AFMSlidingCell *cell) {
  NSLog(@"Second tapped");
```

In case you want to add only one UIButton, there is no difference whether you add it as first
or as second button.

You get additional control over your cell, e.g. it possible to show or hide added buttons
programmatically:

```objective-c
[cell showButtonViewAnimated:YES];
[cell hideButtonViewAnimated:NO];
```
AFMSlidingCellDelegate can be used to get callbacks on button show/hide, as well as to
forbid button showing for particular cells:

```objective-c
- (BOOL)shouldAllowShowingButtonsForCell:(AFMSlidingCell *)cell
{
  if (cell == self.forbiddenCell)
    return NO;
  return YES;
}
```
## Requirements

iOS 7 and up.

## Installation

AFMSlidingCell is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'AFMSlidingCell'

## Contact person

Artjoms Haleckis, artjoms.haleckis@ask.fm

## License

AFMSlidingCell is available under the MIT license. See the LICENSE file for more info.
