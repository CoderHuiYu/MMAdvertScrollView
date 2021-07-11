//
//  UIView+Utilities.swift
//  MMAdvertScrollView
//
//  Created by JefferyYu on 2021/7/11.
//

import Foundation
import UIKit

public func += <Element>(lhs: inout [Element], rhs: Element) { lhs.append(rhs) }

extension UIView {
    // MARK: Constraints
    /// - Note: this used to be an utility to help manage the bottom anchor for OS versions prior to iOS 11, but now it's equivalent to `safeAreaLayoutGuide.bottomAnchor`.
    public var safeBottomAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.bottomAnchor
    }

    /// - Note: this used to be an utility to help manage the top anchor for OS versions prior to iOS 11, but now it's equivalent to `safeAreaLayoutGuide.topAnchor`.
    public var safeTopAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.topAnchor
    }

    public convenience init(wrapping view: UIView, with insets: UIEdgeInsets = .zero) {
        self.init()
        addSubview(view, pinningEdges: .all, withInsets: insets)
    }

    @objc public func addSubview(_ subview: UIView, pinningEdges edges: UIRectEdge, withInsets insets: UIEdgeInsets = .zero) {
        addSubview(subview)
        subview.pinEdges(edges: edges, to: self, withInsets: insets, useSafeArea: false)
    }

    @discardableResult public func pinEdges(edges: UIRectEdge = .all, to view: UIView, withInsets insets: UIEdgeInsets = .zero, useSafeArea: Bool = true, collapseInsets: Bool = false) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        if edges.contains(.left) {
            constraints += leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left)
        }
        if edges.contains(.right) {
            constraints += view.rightAnchor.constraint(equalTo: rightAnchor, constant: insets.right)
        }
        if edges.contains(.top) {
            if useSafeArea && collapseInsets {
                constraints += topAnchor.constraint(greaterThanOrEqualTo: view.safeTopAnchor)
                constraints += topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).with(priority: .pseudoRequired)
            } else {
                let viewTopAnchor = useSafeArea ? view.safeTopAnchor : view.topAnchor
                constraints += topAnchor.constraint(equalTo: viewTopAnchor, constant: insets.top)
            }
        }
        if edges.contains(.bottom) {
            if useSafeArea && collapseInsets {
                constraints += view.safeBottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor)
                constraints += view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom).with(priority: .pseudoRequired)
            } else {
                let viewBottomAnchor = useSafeArea ? view.safeBottomAnchor : view.bottomAnchor
                constraints += viewBottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom)
            }
        }
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
}

extension NSLayoutConstraint {
    @discardableResult public func with(priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}

extension UILayoutPriority {
    public static var pseudoRequired: UILayoutPriority { return UILayoutPriority(rawValue: 999) }
    public static var lowCompressionResistance: UILayoutPriority { return UILayoutPriority(rawValue: 740) }
    public static var defaultCompressionResistance: UILayoutPriority { return UILayoutPriority(rawValue: 750) }
    public static var highCompressionResistance: UILayoutPriority { return UILayoutPriority(rawValue: 760) }
    public static var medium: UILayoutPriority { return UILayoutPriority(rawValue: 500) }
    public static var lowHuggingPriority: UILayoutPriority { return UILayoutPriority(rawValue: 240) }
    public static var defaultHuggingPriority: UILayoutPriority { return UILayoutPriority(rawValue: 250) }
    public static var highHuggingPriority: UILayoutPriority { return UILayoutPriority(rawValue: 260) }
}
