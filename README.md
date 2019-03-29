# SmartOptionItemComboView
This is an iOS custom view providing an option item as either a
 - bullet (for single selection), or
 - checkbox (for multiple selections).

Customization methods include
 - style: checkbox(default) or bullet
 - icon position: left(default) or right
 - title label text alignment: left(default) or right
 - title label text color
 - title label font size

Smart features include
 - Single setting of properties for group-wide items: only need to set on one item for group-wide properties (group name, style, icon position, text alignment, text color, font size) and will take effect on all the other siblings in the group.
 - Single setting of delegate for group-wide items: only need to set on one item for delegate and will take effect on all the other siblings in the group.

How to use
 - Download SmartOptionItemComboView.
 - Open your project with Xcode.
 - From Finder drag the folder SmartOptionItemComboView (includes 3 files: SmartOptionItemComboView.swift, SmartOptionItemComboView.xib, Extensions.swift) and drop into Xcode under your project. Choose "Copy items if needed".
 - In your own xib file or storyboard, add a UIView as group container view.
 - In the group container view, add several UIViews and set Custom Class for each UIView to SmartOptionItemComboView. MAKE SURE THAT "Inherit Module From Target" IS SELECTED.
 - For each smartOptionItemComboView you added, add IBOutlet reference in your viewController. 
 - In your viewController, set the title for each smartOptionItemComboView.
 - As for the group name, style, text alignment, text color, font size, only need to set for any one of the siblings within the group, by pass true to the parameter "andAllSiblings" for each method.
 - Make your viewController conform to SmartOptionItemComboViewDelegate protocol and add the delegate method func didClick(smartOptionItemComboView: SmartOptionItemComboView) {} for receiving select/deselect events from each smartOptionItemComboView.

# Example
See SmartOptionItemComboViewExample in this repository.
