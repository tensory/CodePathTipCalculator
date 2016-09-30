# Pre-work - Smooth Calculator

**Smooth Calculator** is a tip calculator application for iOS.

Submitted by: **Ari Lacenski**

Time spent: **13** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] The main screen has been redesigned.
- [x] The background of the bill amount changes in response to the tip amount: the bigger the tip, the warmer the color.
- [x] The tip amount selector is a slider with discrete stops so that the user can choose between 18, 20, or 25%.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/tensory/CodePathTipCalculator/blob/master/SmoothTipCalculator.gif' title='Video Walkthrough' width='400' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I would like to implement the default tip setting with a popover modal for the picker. For the first submission, I was able to add a new view controller and Cocoa Touch Controller to display a temporary screen, but I haven't figured out how to turn its view into a modal. 

I don't know the best practice for packaging code modules in Xcode.

It took me a few tries to use the graphical storyboard properly.

I googled for some sample `.gitignore` files, but I'm not certain which Xcode directories are safe to put in `.gitignore`.

## License

    Copyright [2016] [Ari Lacenski]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
