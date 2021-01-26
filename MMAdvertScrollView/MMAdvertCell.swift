//
//  MMAdvertCell.swift
//  MMAdvertScrollView
//
//  Created by 余辉 on 2021/1/23.
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
        contentView.addSubview(stackView)
    }

    override func layoutSubviews() {
        stackView.frame = CGRect(x: 10, y: 0, width: frame.width - 20, height: frame.height)
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
