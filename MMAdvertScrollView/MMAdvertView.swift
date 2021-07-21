//
//  MMAdvertView.swift
//  MMAdvertScrollViewExample
//
//  Created by JefferyYu on 2021/7/11.
//

import UIKit

class MMAdvertView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView, pinningEdges: .all, withInsets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

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
        result.textColor = .black
        result.font = UIFont.systemFont(ofSize: 13)
        result.text = " hello for test"
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
