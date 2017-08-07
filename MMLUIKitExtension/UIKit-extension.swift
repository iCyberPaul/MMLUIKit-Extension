//
//  UIKit-extension.swift
//  MMLUIKitExtension
//
//  Created by Paul Beattie on 06/08/2017.
//  Copyright © 2017 Paul Beattie. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

/// Lots of lovely additions to views.
/// Shadows and an infinite number of gradient colours.
public extension UIView {
    
    /// Allow UIView's cornerRadius to be changed in interface builder
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    /// Allow UIView's top margin to be changes in interface builder
    @IBInspectable var marginTop: CGFloat {
        get {
            return self.layoutMargins.top
        }
        set {
            self.layoutMargins.top = newValue
        }
    }
    
    /// Allow UIView's bottom margin to be changes in interface builder
    @IBInspectable var marginBottom: CGFloat {
        get {
            return self.layoutMargins.bottom
        }
        set {
            self.layoutMargins.bottom = newValue
        }
    }
    
    /// Allow UIView's left margin to be changes in interface builder
    @IBInspectable var marginLeft: CGFloat {
        get {
            return self.layoutMargins.left
        }
        set {
            self.layoutMargins.left = newValue
        }
    }
    
    /// Allow UIView's right margin to be changes in interface builder
    @IBInspectable var marginRight: CGFloat {
        get {
            return self.layoutMargins.right
        }
        set {
            self.layoutMargins.right = newValue
        }
    }
    
    /// Allow UIView's background colour to be be a gradient made up of any number of UIColor's, just keep adding them in.
    public func gradientOfView(gradient : CAGradientLayer, withColours: UIColor...) {
        var cgColours = [CGColor]()
        
        for colour in withColours {
            cgColours.append(colour.cgColor)
        }
        gradient.frame = self.bounds
        gradient.colors = cgColours
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    /// If the view is redrawn, like when a device is rotated then use this to get the gradient redrawn.
    public func updateGradient(gradient: CAGradientLayer) {
        gradient.frame = self.bounds
    }
    
    /// Make the UIView have a small wobble.
    public func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        let miniusShift = CGPoint(x: self.center.x - 4, y: self.center.y)
        let fromValue = NSValue(cgPoint: miniusShift)
        animation.fromValue = fromValue
        let plusShift = CGPoint(x: self.center.x + 4, y: self.center.y)
        let toValue = NSValue(cgPoint: plusShift)
        animation.fromValue = fromValue
        animation.toValue = toValue
        self.layer.add(animation, forKey: "position")
        
    }
    
    /// Put a shadow on the view's bottom edge
    public func addLowerShadow() {
        self.layer.masksToBounds = false // Allows the shadow to extend beyond the bounds of the view - THIS IS THE TRICK THAT MAKES IT WORK!
        self.layer.shadowColor = UIColor.black.cgColor // The colour of the shadow, it can be easier to use black and adjust the transulcency
        self.layer.shadowOpacity = 0.25 // How translucent the shadow is
        self.layer.shadowOffset = CGSize(width: 0, height: 2) // The amount the shadow is shifted away from the view
        self.layer.shadowRadius = 2 // How far it spreads out from the view
    }
    
    /// Put a shadow on the view's right and bottem edges.
    public func addRightAndLowerShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 20
    }
    
}

public extension UIColor {
    
    /// Convert a colour using hex values and provide a UIColor.
    static func hexColour(red: String, green: String, blue: String) -> UIColor {
        let redFloat = CGFloat( Int64(red, radix:16)! )
        let greenFloat = CGFloat( Int64(green, radix:16)! )
        let blueFloat = CGFloat (Int64(blue, radix:16)! )
        
        return UIColor(red: redFloat/255.0, green: greenFloat/255.0, blue: blueFloat/255.0, alpha: 1)
    }
}
