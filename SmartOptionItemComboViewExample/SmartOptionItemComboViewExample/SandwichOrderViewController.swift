//
//  SandwichOrderViewController.swift
//  SmartOptionItemComboViewExample
//
//  Created by Zhengqian Kuang on 2019-03-29.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class SandwichOrderViewController: UIViewController, SmartOptionItemComboViewDelegate {

    // We provide 6 groups of options (bread, meat, veggies, cheese, sauce, and size) for our customers to make choice on their sandwiches. To organize the layout,
    // (1) For each group, add a UIView as the group container view. Here we have breadOptionsView, meatOptionsView, veggiesOptionsView, cheeseOptionsView, sauceOptionsView, and sizeOptionsView.
    // (2) In each group container view, add UIViews (as subview) and set the Custom Class as SmartOptionItemComboView. Here, for example, in breadOptionsView we have subviews of whiteBreadOptionItemComboView, wholeGrainBreadOptionItemComboView, garlicBreadOptionItemComboView
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var orderSummaryView: UIView!
    @IBOutlet weak var orderDetailView: UIView!
    @IBOutlet weak var breadOptionsView: UIView!
    @IBOutlet weak var meatOptionsView: UIView!
    @IBOutlet weak var veggiesOptionsView: UIView!
    @IBOutlet weak var cheeseOptionsView: UIView!
    @IBOutlet weak var sauceOptionsView: UIView!
    @IBOutlet weak var sizeOptionsView: UIView!
    @IBOutlet weak var orderSummaryTextView: UITextView!
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var whiteBreadOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var wholeGrainBreadOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var garlicBreadOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var beefOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var lambOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var chickenOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var turkeyOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var spinachOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var tomatoOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var sweetPepperOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var cucumberOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var swissOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var cheddarOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var pepperjackOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var ketchupOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var mustardOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var spicyOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var footLongOptionItemComboView: SmartOptionItemComboView!
    @IBOutlet weak var sixInchesOptionItemComboView: SmartOptionItemComboView!
    
    var bread = "" {
        didSet {
            
        }
    }
    
    var meat = ""
    
    var arrVeggies: Array<String> = []
    
    var cheese = ""
    
    var sauce = ""
    
    var size = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
    }
    
    func prepareView() {
        // Add a border for each group view
        orderSummaryTextView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        breadOptionsView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        meatOptionsView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        veggiesOptionsView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        cheeseOptionsView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        sauceOptionsView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        sizeOptionsView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        
        // Set title text for each option item's combo view
        whiteBreadOptionItemComboView.title = "White Bread"
        wholeGrainBreadOptionItemComboView.title = "Whole Grain"
        garlicBreadOptionItemComboView.title = "Garlic Bread"
        // Set delegate for ANY ONE OF the option item's combo view. Note that being named SmartOptionItemComboView, for those whose delegate not set, they are smart enough to find out the delegate from their sibling
        whiteBreadOptionItemComboView.delegate = self
        // Set the group name, style, icon position, text alignment, text color, font for ANY ONE OF the option item's combo view. Note that being named SmartOptionItemComboView, settings of these properties on any one sibling will take effect on all the other siblings in the same group.
        whiteBreadOptionItemComboView.setGroup(name: "Bread")
        whiteBreadOptionItemComboView.setStyle(multiSelection: false)
        // whiteBreadOptionItemComboView.setOptionIcon(atRightSide: true)
        // whiteBreadOptionItemComboView.setTextAlign(toRight: true)
        // whiteBreadOptionItemComboView.setText(color: UIColor.orange)
        // whiteBreadOptionItemComboView.setFont(size: 15)
        // We don't need to set the group-wide properties (delegate, group name, style, icon position, text alignment, text color, font) for each smartOptionItemComboView. All the other siblings in the same group will automatically acquire the group-wide properties from their sibling that has the information.
        
        beefOptionItemComboView.title = "Beef"
        lambOptionItemComboView.title = "Lamb"
        chickenOptionItemComboView.title = "Chicken"
        turkeyOptionItemComboView.title = "Turkey"
        beefOptionItemComboView.delegate = self
        beefOptionItemComboView.setGroup(name: "Meat")
        beefOptionItemComboView.setStyle(multiSelection: false)
        
        spinachOptionItemComboView.title = "Spinach"
        tomatoOptionItemComboView.title = "Tomato"
        sweetPepperOptionItemComboView.title = "Sweet Pepper"
        cucumberOptionItemComboView.title = "Cucumber"
        spinachOptionItemComboView.delegate = self
        spinachOptionItemComboView.setGroup(name: "Veggies")
        // spinachOptionItemComboView.setStyle(multiSelection: true) // true by default so no need to set it.
        
        swissOptionItemComboView.title = "Swiss Cheese"
        cheddarOptionItemComboView.title = "Cheddar"
        pepperjackOptionItemComboView.title = "Pepperjack"
        swissOptionItemComboView.delegate = self
        swissOptionItemComboView.setGroup(name: "Cheese")
        swissOptionItemComboView.setStyle(multiSelection: false)
        
        ketchupOptionItemComboView.title = "Ketchup"
        mustardOptionItemComboView.title = "Mustard"
        spicyOptionItemComboView.title = "Spicy"
        ketchupOptionItemComboView.delegate = self
        ketchupOptionItemComboView.setGroup(name: "Sauce")
        ketchupOptionItemComboView.setStyle(multiSelection: false)
        
        footLongOptionItemComboView.title = "Foot Long"
        sixInchesOptionItemComboView.title = "6\""
        footLongOptionItemComboView.delegate = self
        footLongOptionItemComboView.setGroup(name: "Size")
        footLongOptionItemComboView.setStyle(multiSelection: false)
    }
    
    func updateOrderSummary() {
        var summary = ""
        if bread != "" {
            if summary != "" {
                summary += "\n"
            }
            summary += bread
        }
        if meat != "" {
            if summary != "" {
                summary += "\n"
            }
            summary += meat
        }
        if arrVeggies.count > 0 {
            if summary != "" {
                summary += "\n"
            }
            for veggie in arrVeggies {
                if !((summary == "") || summary.hasSuffix("\n")) {
                    summary += ", "
                }
                summary += veggie
            }
        }
        if cheese != "" {
            if summary != "" {
                summary += "\n"
            }
            summary += cheese
        }
        if sauce != "" {
            if summary != "" {
                summary += "\n"
            }
            summary += sauce
        }
        if size != "" {
            if summary != "" {
                summary += "\n"
            }
            summary += size
        }
        
        orderSummaryTextView.text = summary
    }
    
    func didClick(smartOptionItemComboView: SmartOptionItemComboView) {
        let selections = smartOptionItemComboView.selections()
        print("Group \(smartOptionItemComboView.group) selections: \(selections)")
        var selection = ""
        if selections.count > 0 {
            selection = selections[0]
        }
        switch smartOptionItemComboView.group {
        case "Bread":
            bread = selection
            
        case "Meat":
            meat = selection
            
        case "Veggies":
            arrVeggies = selections
            
        case "Cheese":
            cheese = selection
            
        case "Sauce":
            sauce = selection
            
        case "Size":
            size = selection
            
        default:
            break
        }
        
        updateOrderSummary()
    }

}
