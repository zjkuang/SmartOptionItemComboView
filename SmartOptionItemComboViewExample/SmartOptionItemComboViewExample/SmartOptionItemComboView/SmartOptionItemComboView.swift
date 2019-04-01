//
//  SmartOptionItemComboView.swift
//  TemplateApp
//
//  Created by Zhengqian Kuang on 2019-03-28.
//  Copyright © 2019 JandJ. All rights reserved.
//

//
// How to make framework
// http://iosbrain.com/blog/2018/01/13/building-swift-4-frameworks-and-including-them-in-your-apps-xcode-9/
// [1] Xcode Main Menu -> File -> Project Settings... -> (1) Derived Data: Project-relative location, (2) Advanced... -> Custome -> Relative to Workspace
// [2] Access Control: (1) Declare all classes/protocols/extensions as public; (2) Declare all functions as public, and all properties as open, (3) Goto Buile Phases, Drag-and-drop the swift files to Targets/framework/Headers/Public
// [3] Build the framework
//

import UIKit

public class SmartOptionItemComboView: UIView {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var optionIconLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var alOptionIconLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var alLeftOptionIconLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var alRightTitleLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var alRightTitleLabelTrailing: NSLayoutConstraint!
    @IBOutlet weak var alLeftTitleLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var alRightOptionIconLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var alRightOptionIconLabelTrailing: NSLayoutConstraint!
    
    open var delegate: SmartOptionItemComboViewDelegate?
    
    private enum Style {
        case checkbox, bullet
    }
    
    private enum IconUnicode: String { // "☑"; "⦿", "⦾", "•", "◦"
        case unselectedCheckbox = ""
        case selectedCheckbox = "☑"
        case unselectedBullet = "⦾"
        case selectedBullet = "⦿"
    }
    
    private var style: Style = .checkbox {
        didSet {
            if style == .checkbox {
                if checked {
                    optionIconLabel.setBorder(width: 0, color: UIColor.clear, radius: 0)
                }
                else {
                    optionIconLabel.setBorder(width: 1, color: UIColor.black, radius: 0)
                }
            }
            else if style == .bullet {
                optionIconLabel.setBorder(width: 0, color: UIColor.clear, radius: 0)
                optionIconLabel.text = checked ? IconUnicode.selectedBullet.rawValue : IconUnicode.unselectedBullet.rawValue
            }
        }
    }
    
    open var title = "" {
        didSet {
            titleLabel.text = title
            titleLabel.sizeToFit()
        }
    }
    
    open var group = ""
    
    open var checked = false {
        didSet {
            if checked {
                if style == .checkbox {
                    optionIconLabel.setBorder(width: 0, color: UIColor.clear, radius: 0)
                    optionIconLabel.text = IconUnicode.selectedCheckbox.rawValue
                }
                else if style == .bullet {
                    optionIconLabel.text = IconUnicode.selectedBullet.rawValue
                    let siblings = getSiblings()
                    for sibling in siblings {
                        if sibling.checked {
                            DispatchQueue.main.async {
                                sibling.checked = false
                            }
                        }
                    }
                }
            }
            else {
                if style == .checkbox {
                    optionIconLabel.setBorder(width: 1, color: UIColor.black, radius: 0)
                    optionIconLabel.text = IconUnicode.unselectedCheckbox.rawValue
                }
                else if style == .bullet {
                    optionIconLabel.text = IconUnicode.unselectedBullet.rawValue
                }
            }
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    private func customInit() {
        Bundle.main.loadNibNamed("SmartOptionItemComboView", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        
        if style == .checkbox {
            optionIconLabel.setBorder(width: 1, color: UIColor.black, radius: 0)
        }
        else if style == .bullet {
            optionIconLabel.text = IconUnicode.unselectedBullet.rawValue
        }
        
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didRecognizeGesture(gestureRecognizer:)))
        optionIconLabel.addGestureRecognizer(tapGestureRecognizer)
        optionIconLabel.isUserInteractionEnabled = true
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didRecognizeGesture(gestureRecognizer:)))
        titleLabel.addGestureRecognizer(tapGestureRecognizer)
        titleLabel.isUserInteractionEnabled = true
    }
    
    @IBAction func didRecognizeGesture(gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer is UITapGestureRecognizer {
            if (gestureRecognizer.view == optionIconLabel) || (gestureRecognizer.view == titleLabel) {
                checked = !checked
                if let delegate = delegate {
                    delegate.didClick(smartOptionItemComboView: self)
                }
                else {
                    let siblings = getSiblings()
                    for sibling in siblings {
                        if let delegate = sibling.delegate {
                            delegate.didClick(smartOptionItemComboView: self)
                        }
                    }
                }
            }
        }
    }
    
    private func getSiblings() -> [SmartOptionItemComboView] {
        var siblings: Array<SmartOptionItemComboView> = []
        if let superview = self.superview {
            for sibling in superview.subviews {
                if (sibling is SmartOptionItemComboView) && (sibling != self) {
                    siblings.append(sibling as! SmartOptionItemComboView)
                }
            }
        }
        return siblings
    }
    
    public func setGroup(name: String, andAllSiblings: Bool = true) {
        group = name
        
        if andAllSiblings {
            let siblings = getSiblings()
            for sibling in siblings {
                sibling.setGroup(name: name, andAllSiblings: false)
            }
        }
    }
    
    public func setStyle(multiSelection: Bool, andAllSiblings: Bool = true) {
        if multiSelection {
            style = .checkbox
        }
        else {
            style = .bullet
        }
        
        if andAllSiblings {
            let siblings = getSiblings()
            for sibling in siblings {
                sibling.setStyle(multiSelection: multiSelection, andAllSiblings: false)
            }
        }
    }
    
    public func setOptionIcon(atRightSide: Bool, andAllSiblings: Bool = true) {
        if atRightSide {
            alLeftOptionIconLabelLeading.priority = UILayoutPriority(rawValue: 250)
            alRightTitleLabelLeading.priority = UILayoutPriority(rawValue: 250)
            alRightTitleLabelTrailing.priority = UILayoutPriority(rawValue: 250)
            alLeftTitleLabelLeading.priority = UILayoutPriority(rawValue: 750)
            alRightOptionIconLabelLeading.priority = UILayoutPriority(rawValue: 750)
            alRightOptionIconLabelTrailing.priority = UILayoutPriority(rawValue: 750)
        }
        else {
            alLeftOptionIconLabelLeading.priority = UILayoutPriority(rawValue: 750)
            alRightTitleLabelLeading.priority = UILayoutPriority(rawValue: 750)
            alRightTitleLabelTrailing.priority = UILayoutPriority(rawValue: 750)
            alLeftTitleLabelLeading.priority = UILayoutPriority(rawValue: 250)
            alRightOptionIconLabelLeading.priority = UILayoutPriority(rawValue: 250)
            alRightOptionIconLabelTrailing.priority = UILayoutPriority(rawValue: 250)
        }
        
        if andAllSiblings {
            let siblings = getSiblings()
            for sibling in siblings {
                sibling.setOptionIcon(atRightSide: atRightSide, andAllSiblings: false)
            }
        }
    }
    
    public func setTextAlign(toRight: Bool, andAllSiblings: Bool = true) {
        titleLabel.textAlignment = toRight ? .right : .left
        
        if andAllSiblings {
            let siblings = getSiblings()
            for sibling in siblings {
                sibling.setTextAlign(toRight: toRight, andAllSiblings: false)
            }
        }
    }
    
    public func setText(color: UIColor, andAllSiblings: Bool = true) {
        titleLabel.textColor = color
        
        if andAllSiblings {
            let siblings = getSiblings()
            for sibling in siblings {
                sibling.setText(color: color, andAllSiblings: false)
            }
        }
    }
    
    public func setFont(size: CGFloat, andAllSiblings: Bool = true) {
        titleLabel.font = titleLabel.font.withSize(size)
        
        if andAllSiblings {
            let siblings = getSiblings()
            for sibling in siblings {
                sibling.setFont(size: size, andAllSiblings: false)
            }
        }
    }
    
    public func selections() -> Array<String> {
        var selections: Array<String> = []
        
        if style == .checkbox {
            if checked {
                selections.append(title)
            }
            let siblings = getSiblings()
            for sibling in siblings {
                if sibling.checked {
                    selections.append(sibling.title)
                }
            }
        }
        else {
            if checked {
                selections.append(title)
            }
            else {
                let siblings = getSiblings()
                for sibling in siblings {
                    if sibling.checked {
                        selections.append(sibling.title)
                        break
                    }
                }
            }
        }
        
        return selections
    }

}

public protocol SmartOptionItemComboViewDelegate {
    
    func didClick(smartOptionItemComboView: SmartOptionItemComboView)
    
}

public extension SmartOptionItemComboViewDelegate {
    
    func didClick(smartOptionItemComboView: SmartOptionItemComboView) {
        
    }
    
}
