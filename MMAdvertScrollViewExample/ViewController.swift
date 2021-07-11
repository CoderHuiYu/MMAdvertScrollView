//
//  ViewController.swift
//  MMAdvertScrollView
//
//  Created by yuhui on 2021/1/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(createLabel(title: "竖向滚动", frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 30)))
        let m1 = MMAdvertScrollView(frame: CGRect(x: 0, y: 135, width: UIScreen.main.bounds.width, height: 40))
        m1.timeInterval = 3
        m1.scrollDirection = .vertical 
        m1.dataArray = ["恭喜xx，完成了数据管理能力测评。" ,"恭喜xxxxxxxxxxxxxx，完成实名认证。"]
        view.addSubview(m1)

        let m2 = MMAdvertScrollView()
        m2.isOnlyShowTitle = true
        m2.dataArray = ["恭喜xx，完成了数据管理能力测评。" ,"恭喜xxxxxxxxxxxxxx，完成实名认证。"]

        NSLayoutConstraint.activate([  m2.heightAnchor.constraint(equalToConstant: 40) ])
        view.addSubview(m2, pinningEdges: [ .left, .right, .top ], withInsets: UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0))

        view.addSubview(createLabel(title: "横向滚动", frame: CGRect(x: 0, y: 270, width: UIScreen.main.bounds.width, height: 30)))
        let m3 = MMAdvertScrollView(frame: CGRect(x: 0, y: 305, width: UIScreen.main.bounds.width, height: 40))
        m3.scrollDirection = .horizontal
        m3.dataArray = ["恭喜xx，完成了数据管理能力测评。" ,"恭喜xxxxxxxxxxxxxx，完成实名认证。"]
        view.addSubview(m3)

        let m4 = MMAdvertScrollView(frame: CGRect(x: 0, y: 370, width: UIScreen.main.bounds.width, height: 40))
        m4.scrollDirection = .horizontal
        m4.isOnlyShowTitle = true
        m4.dataArray = ["恭喜xx，完成了数据管理能力测评。" ,"恭喜xxxxxxxxxxxxxx，完成实名认证。"]
        view.addSubview(m4)

        view.addSubview(createLabel(title: "自定义View，Cell用的是XIB", frame: CGRect(x: 0, y: 440, width: UIScreen.main.bounds.width, height: 30)))
        let Xib_customerView = CustomerView(frame: CGRect(x: 0, y: 475, width: UIScreen.main.bounds.width, height: 100))
        view.addSubview(Xib_customerView)

        view.addSubview(createLabel(title: "自定义View，Cell用的是纯代码", frame: CGRect(x: 0, y: 600, width: UIScreen.main.bounds.width, height: 30)))
        let code_customerView = CustomerView2(frame: CGRect(x: 0, y: 635, width: UIScreen.main.bounds.width, height: 60))
        view.addSubview(code_customerView)

    }

    private func createLabel(title: String, frame: CGRect) -> UILabel {
        let result = UILabel()
        result.text = title
        result.frame = frame
        result.textColor = .black
        result.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return result
    }


}



