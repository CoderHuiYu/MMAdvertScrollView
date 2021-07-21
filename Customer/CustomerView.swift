//
//  CustomerView.swift
//  MMAdvertScrollView
//
//  Created by JefferyYu on 2021/1/25.
//

import UIKit

class CustomerView: UIView, MMAdvertScrollCustomerViewDelegate {
    func customViewConfigure(numberOfItems item: Int, cycleView view: MMAdvertScrollView) -> UIView {

        let view = VipView()
         view.title = dataArray[item]
        return view
    }

    func customerViewDataArrayCount() -> Int {
        return dataArray.count
    }


    let dataArray = [ "学员155****1907购买了VIP月卡", "学员189****2290购买了VIP季卡" , "学员155****1907购买了VIP月卡" ]
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(advertScrollView)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private lazy var advertScrollView: MMAdvertScrollView = {
        let result = MMAdvertScrollView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        result.delegate = self
        return result
    }()

    class VipView: UIView {
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(stackView, pinningEdges: .all, withInsets: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        }
        required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
        
        var title: String? {
            didSet {
                titleLabel.text = title
            }
        }
        
        private lazy var stackView: UIStackView = {
            let result = UIStackView(arrangedSubviews: [ imageView, titleLabel, UIView() ])
            result.axis = .horizontal
            result.alignment = .center
            result.spacing = 20
            result.distribution = .fill
            return result
        }()
        
        private lazy var imageView: UIImageView = {
            let result = UIImageView(image: UIImage(named: "vip"))
            result.frame.size = CGSize(width: 55, height: 14)
            return result
        }()
        
        private lazy var titleLabel: UILabel = {
            let result = UILabel()
            result.textAlignment = .left
            result.font = UIFont.systemFont(ofSize: 13)
            result.textColor = .black
            return result
        }()
    }
}
//
//extension CustomerView2: MMAdvertScrollViewDelegate {
//    
//    func customCycleScrollViewCellClass(_ cycleView: MMAdvertScrollView) -> AnyClass {
//        return CustomerCollectionViewCell.self
//    }
//    
//    func customCycleScrollViewSet(_ collectionViewCell: UICollectionViewCell, numberOfItems item: Int, cycleView view: MMAdvertScrollView) {
//        let customeCell = collectionViewCell as! CustomerCollectionViewCell
//        customeCell.titles = ["恭喜xx，完成了数据管理能力测评。", "我是自定义view，而且cell是用纯代码实现的" ,"恭喜xxxxxxxxxxxxxx，完成实名认证。"]
//        customeCell.backgroundColor = .red
//    }
//}
