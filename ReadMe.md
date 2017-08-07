# MMLUIKit-Extension
UIKit extensions library

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
@IBInspectable public var cornerRadius: CGFloat { get set }

/// Allow UIView's top margin to be changes in interface builder
@IBInspectable public var marginTop: CGFloat { get set }

/// Allow UIView's bottom margin to be changes in interface builder
@IBInspectable public var marginBottom: CGFloat { get set }

/// Allow UIView's left margin to be changes in interface builder
@IBInspectable public var marginLeft: CGFloat { get set }

/// Allow UIView's right margin to be changes in interface builder
@IBInspectable public var marginRight: CGFloat { get set }

/// Allow UIView's background colour to be be a gradient made up of any number of UIColor's, just keep adding them in.
public func gradientOfView(gradient: CAGradientLayer, withColours: UIColor...)

/// If the view is redrawn, like when a device is rotated then use this to get the gradient redrawn.
public func updateGradient(gradient: CAGradientLayer)

/// Make the UIView have a small wobble.
public func shake()

/// Put a shadow on the view's bottom edge
public func addLowerShadow()

/// Put a shadow on the view's right and bottem edges.
public func addRightAndLowerShadow()
}

public extension UIColor {

/// Convert a colour using hex values and provide a UIColor.
public static func hexColour(red: String, green: String, blue: String) -> UIColor
}

