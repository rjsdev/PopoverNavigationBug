This is a modified version of Apple's "Popovers" sample code, demonstrating what appears to be a bug in iOS 7.0.3.

BUG REPORT SUBMITTED TO APPLE:
----
Nested UINavigationController inside popover displays animation glitches

DESCRIPTION

The bug affects the animation when pushing or popping a navigation controller's stack inside a popover. It seems to occur when the navigation controller is not the top-level view controller presented by the popover controller. During the animation, the content from both levels is briefly displayed superimposed on top of each other.

STEPS TO REPRODUCE

1. Open the sample Xcode project at this URL
https://github.com/rjsdev/PopoverNavigationBug/tree/bugDemo

2. Build and run in the iPad iOS 7 simulator or an iPad device.

3. Tap any of the "Tap" buttons to present the popover with the root view of the navigation controller displayed.

4. Tap any table row in the popover to activate the transition to the second level of the navigation hierarchy.

EXPECTED RESULTS

New content slides in, replacing old content and hiding it. A variant of the project showing the expected result is at:
https://github.com/rjsdev/PopoverNavigationBug/tree/bugFree

ACTUAL RESULTS

Content of both levels of the hierarchy is superimposed during the transition.

The difference between the two projects is that the navigation controller is presented directly in the popover in the bug-free version. In the bug demo, there is an extra intermediate view controller. I believe the view controller containment hierarchy is set up correctly in the bug demo, with the navigation controller added as the child of the intermediate view controller.

VERSION/BUILD

iOS 7.0.3 (11B508) on iPad Simulator
iOS 7.0.3 (11B511) on iPad mini model A1432 16GB
Xcode 5.0.1 (5A2053)
OS X 10.8.5 (12F45)

ADDITIONAL NOTES

The bug originally manifested in a project where the navigation controller's view does not occupy the whole popover, so omitting the intermediate view controller is not an acceptable workaround. The best workaround I can find for now is to disable navigation animations.




ORIGINAL APPLE README:
----
# Popovers

This sample demonstrates how to use popovers using UIPopoverController in iOS, including presentation, dismissal, and rotation.
The sample uses a UISplitViewController to show how to present popovers from bar button items. It also demonstrates how you can ensure that multiple popovers are not presented at the same time.

## Main classes

### APLMasterTableViewController
Acts as the master list view controller for the split view controller and adds rows of placeholder items to the table view.

### APLDetailViewController
Displays the detail view of the split view controller. This also contains buttons and a toolbar that all present popovers. The controller responds to orientation changes when popovers are visible and re-displays them in the new orientation; it is also responsible for ensuring that there are never multiple popovers visible at the same time.

### APLPopoverContentViewController
A view controller that manages the contents of the popovers in this sample. In this example, the view  only contains a label with text.


----
Copyright (C) 2010-2013 Apple Inc. All rights reserved.