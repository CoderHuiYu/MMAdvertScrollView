//
//  CustomerCollectionViewCell.swift
//  MMAdvertScrollView
//
//  Created by yuhui on 2021/1/25.
//

import UIKit

class CustomerCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel1: UILabel = {
        let result = UILabel()
        result.textColor = .black
        return result
    }()
    
    private lazy var titleLabel2: UILabel = {
        let result = UILabel()
        result.textColor = .black
        return result
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(stackView)
    }
    
    override func layoutSubviews() {
        stackView.frame = CGRect(x: 10, y: 0, width: frame.width - 20, height: frame.height)
    }

    private lazy var stackView: UIStackView = {
        let result = UIStackView(arrangedSubviews: [ titleLabel1, titleLabel2 ])
        result.axis = .vertical
        result.alignment = .leading
        result.spacing = 5
        result.distribution = .fill
        return result
    }()
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    var titles: [String]? {
        didSet {
            if titles?.count ?? 0 >= 1 { titleLabel1.text = titles?[0] }
            if titles?.count ?? 0 >= 2 { titleLabel2.text = titles?[1] }
        }
    }
    
    
}
