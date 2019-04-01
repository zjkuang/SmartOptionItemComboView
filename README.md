# SmartOptionItemComboView
This is an iOS custom view providing an option item as either a
 - bullet (for single selection), or
 - checkbox (for multiple selections).

Customizable properties include
 - style: checkbox(default) or bullet
 - icon position: left(default) or right
 - title label text alignment: left(default) or right
 - title label text color
 - title label font size

Smart features include
 - Setting of properties (like group name, style, icon position, text alignment, text color, font size) for one item can take effect on all the other siblings in the same group.
 - Setting of delegate for one item can take effect on all the other siblings in the same group.

How to use
 - Download SmartOptionItemComboView.
 - Open your project with Xcode.
 - From Finder drag the folder SmartOptionItemComboView (which comprises 3 files: SmartOptionItemComboView.swift, SmartOptionItemComboView.xib, Extensions.swift) and drop into Xcode under your project. Choose "Copy items if needed".
 - In your own xib file or storyboard, add a UIView which will serve as the container view of one group of options.
 - In the group container view, add several UIViews (as subview of the group container view) and set Custom Class for each UIView as SmartOptionItemComboView.
 - For each smartOptionItemComboView you added, add IBOutlet reference in your viewController. 
 - In your viewController, set the title for EACH smartOptionItemComboView.
 - In your viewController, for the first smartOptionItemComboView, set the group name, style, text alignment, text color, font size. Note that you only need to do this for any one of the smartOptionItemComboView, and all the other sibliings in the same group will automatically acquire these properties.
 - Make your viewController conform to SmartOptionItemComboViewDelegate protocol and add the delegate method func didClick(smartOptionItemComboView: SmartOptionItemComboView) {} for receiving select/deselect events from each smartOptionItemComboView.
 - Again, for the first smartOptionItemComboView, set its delegate to be your viewController. Note that you only need to do this for any one of the smartOptionItemComboView, and all the other sibliings in the same group will automatically acquire the information.

# Example
See SmartOptionItemComboViewExample in this repository.
