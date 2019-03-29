//
//  SandwichOrderViewController.swift
//  SmartOptionItemComboViewExample
//
//  Created by Zhengqian Kuang on 2019-03-29.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class SandwichOrderViewController: UIViewController, SmartOptionItemComboViewDelegate {

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
        orderSummaryTextView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        breadOptionsView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        meatOptionsView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        veggiesOptionsView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        cheeseOptionsView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        sauceOptionsView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        sizeOptionsView.setBorder(width: 1, color: UIColor.gray, radius: 6)
        
        whiteBreadOptionItemComboView.title = "White Bread"
        wholeGrainBreadOptionItemComboView.title = "Whole Grain"
        garlicBreadOptionItemComboView.title = "Garlic Bread"
        whiteBreadOptionItemComboView.delegate = self
        whiteBreadOptionItemComboView.setGroup(name: "Bread", andAllSiblings: true)
        whiteBreadOptionItemComboView.setStyle(multiSelection: false, andAllSiblings: true)
        // whiteBreadOptionItemComboView.setOptionIcon(atRightSide: true, andAllSiblings: true)
        // whiteBreadOptionItemComboView.setTextAlign(toRight: true, andAllSiblings: true)
        
        beefOptionItemComboView.title = "Beef"
        lambOptionItemComboView.title = "Lamb"
        chickenOptionItemComboView.title = "Chicken"
        turkeyOptionItemComboView.title = "Turkey"
        beefOptionItemComboView.delegate = self
        beefOptionItemComboView.setGroup(name: "Meat", andAllSiblings: true)
        beefOptionItemComboView.setStyle(multiSelection: false, andAllSiblings: true)
        // beefOptionItemComboView.setOptionIcon(atRightSide: true, andAllSiblings: true)
        // beefOptionItemComboView.setTextAlign(toRight: true, andAllSiblings: true)
        
        spinachOptionItemComboView.title = "Spinach"
        tomatoOptionItemComboView.title = "Tomato"
        sweetPepperOptionItemComboView.title = "Sweet Pepper"
        cucumberOptionItemComboView.title = "Cucumber"
        spinachOptionItemComboView.delegate = self
        spinachOptionItemComboView.setGroup(name: "Veggies", andAllSiblings: true)
        // spinachOptionItemComboView.setStyle(multiSelection: false, andAllSiblings: true)
        // spinachOptionItemComboView.setOptionIcon(atRightSide: true, andAllSiblings: true)
        // spinachOptionItemComboView.setTextAlign(toRight: true, andAllSiblings: true)
        
        swissOptionItemComboView.title = "Swiss Cheese"
        cheddarOptionItemComboView.title = "Cheddar"
        pepperjackOptionItemComboView.title = "Pepperjack"
        swissOptionItemComboView.delegate = self
        swissOptionItemComboView.setGroup(name: "Cheese", andAllSiblings: true)
        swissOptionItemComboView.setStyle(multiSelection: false, andAllSiblings: true)
        // swissOptionItemComboView.setOptionIcon(atRightSide: true, andAllSiblings: true)
        // swissOptionItemComboView.setTextAlign(toRight: true, andAllSiblings: true)
        
        ketchupOptionItemComboView.title = "Ketchup"
        mustardOptionItemComboView.title = "Mustard"
        spicyOptionItemComboView.title = "Spicy"
        ketchupOptionItemComboView.delegate = self
        ketchupOptionItemComboView.setGroup(name: "Sauce", andAllSiblings: true)
        ketchupOptionItemComboView.setStyle(multiSelection: false, andAllSiblings: true)
        // ketchupOptionItemComboView.setOptionIcon(atRightSide: true, andAllSiblings: true)
        // ketchupOptionItemComboView.setTextAlign(toRight: true, andAllSiblings: true)
        
        footLongOptionItemComboView.title = "Foot Long"
        sixInchesOptionItemComboView.title = "6\""
        footLongOptionItemComboView.delegate = self
        footLongOptionItemComboView.setGroup(name: "Size", andAllSiblings: true)
        footLongOptionItemComboView.setStyle(multiSelection: false, andAllSiblings: true)
        // footLongOptionItemComboView.setOptionIcon(atRightSide: true, andAllSiblings: true)
        // footLongOptionItemComboView.setTextAlign(toRight: true, andAllSiblings: true)
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
