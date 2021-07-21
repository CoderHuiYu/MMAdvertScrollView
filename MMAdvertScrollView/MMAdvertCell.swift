//
//  MMAdvertCell.swift
//  MMAdvertScrollView
//
//  Created by jefferyYu on 2021/4/26.
//

import UIKit

class MMAdvertCell: UICollectionViewCell {
    public var customerView: UIView? { didSet { if customerView != oldValue { handleCustomerViewChanged(oldValue: oldValue) } } }

    // MARK: Initialization
    public override init(frame: CGRect) { super.init(frame: frame); initialize() }
    public required init?(coder: NSCoder) { super.init(coder: coder); initialize() }

    private func initialize() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor).with(priority: .pseudoRequired),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }

    // MARK: Updating
    private func handleCustomerViewChanged(oldValue: UIView?) {
        // Remove old
        oldValue?.removeFromSuperview()
        // Add new 
        if let view = customerView {
            view.removeFromSuperview()
            contentView.addSubview(view, pinningEdges: .all, withInsets: .zero)
        }
    }

}
