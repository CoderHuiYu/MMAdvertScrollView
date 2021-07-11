//
//  MMAdvertCell.swift
//  MMAdvertScrollView
//
//  Created by jefferyYu on 2021/4/26.
//

import UIKit

class MMAdvertCell: UICollectionViewCell {

    // MARK: Initialization
    public override init(frame: CGRect) { super.init(frame: frame); initialize() }
    public required init?(coder: NSCoder) { super.init(coder: coder); initialize() }

    private func initialize() {
        backgroundColor = .purple
        translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor).with(priority: .pseudoRequired),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        contentView.addSubview(stackView, pinningEdges: .all, withInsets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    }

    private lazy var stackView: UIStackView = {
        let result = UIStackView(arrangedSubviews: [ imageView, titleLabel, indicatorImageView ])
        result.axis = .horizontal
        result.alignment = .center
        result.spacing = 20
        result.distribution = .fill
        return result
    }()

    private lazy var imageView: UIImageView = {
        let result = UIImageView(image: UIImage(named: "advert"))
        result.contentMode = .scaleAspectFit
        result.setContentHuggingPriority(UILayoutPriority(101), for: .horizontal)
        result.bounds = CGRect(x: 0, y: 0, width: 15, height: 15)
        return result
    }()

    private lazy var titleLabel: UILabel = {
        let result = UILabel()
        result.setContentHuggingPriority(UILayoutPriority(100), for: .horizontal)
        result.textColor = .green
        result.text = " hello for test"
        result.backgroundColor = .darkGray
        return result
    }()

    private lazy var indicatorImageView: UIImageView = {
        let result = UIImageView(image: UIImage(named: "indicator"))
        result.setContentHuggingPriority(UILayoutPriority(102), for: .horizontal)
        result.contentMode = .scaleAspectFit
        result.bounds = CGRect(x: 0, y: 0, width: 6, height: 11)
        return result
    }()

    var title: String {
        get { return titleLabel.text ?? "" }
        set { titleLabel.text = newValue }
    }

    var isOnlyShowTitle: Bool = false {
        didSet {
            imageView.isHidden = isOnlyShowTitle
            indicatorImageView.isHidden = isOnlyShowTitle
        }
    }

}
