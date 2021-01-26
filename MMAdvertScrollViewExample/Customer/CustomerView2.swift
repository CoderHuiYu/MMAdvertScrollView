//
//  CustomerView2.swift
//  MMAdvertScrollView
//
//  Created by yuhui on 2021/1/25.
//

import UIKit


class CustomerView2: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(advertScrollView)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private lazy var advertScrollView: MMAdvertScrollView = {
        let result = MMAdvertScrollView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        result.delegate = self
        result.dataArray = ["恭喜xx22，完成了数据管理能力测评。", "我是自定义view，而且cell是用纯代码实现的" ,"恭喜xxxxxxxxxxxxxx，完成实名认证。"]
        return result
    }()
    
}

extension CustomerView2: MMAdvertScrollViewDelegate {
    
    func customCycleScrollViewCellClass(_ cycleView: MMAdvertScrollView) -> AnyClass {
        return CustomerCollectionViewCell.self
    }
    
    func customCycleScrollViewSet(_ collectionViewCell: UICollectionViewCell, numberOfItems item: Int, cycleView view: MMAdvertScrollView) {
        let customeCell = collectionViewCell as! CustomerCollectionViewCell
        customeCell.titles = ["恭喜xx，完成了数据管理能力测评。", "我是自定义view，而且cell是用纯代码实现的" ,"恭喜xxxxxxxxxxxxxx，完成实名认证。"]
        customeCell.backgroundColor = .red
    }
}
