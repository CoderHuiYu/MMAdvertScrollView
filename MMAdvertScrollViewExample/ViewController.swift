//
//  ViewController.swift
//  MMAdvertScrollView
//
//  Created by JefferyYu on 2021/1/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(createLabel(title: "竖向滚动", frame: CGRect(x: 20, y: 100, width: UIScreen.main.bounds.width, height: 30)))
        let m1 = MMAdvertScrollView(frame: CGRect(x: 0, y: 135, width: UIScreen.main.bounds.width, height: 40))
        m1.timeInterval = 3
        m1.scrollDirection = .vertical
        m1.dataArray = ["恭喜xx11，完成了数据管理能力测评。" ,"恭喜xx22，完成实名认证。", "恭喜xx33，完成实名认证。", "恭喜xxx44，完成实名认证。"]
        view.addSubview(m1)

        view.addSubview(createLabel(title: "横向滚动", frame: CGRect(x: 20, y: 200, width: UIScreen.main.bounds.width, height: 30)))
        let m3 = MMAdvertScrollView(frame: CGRect(x: 0, y: 235, width: UIScreen.main.bounds.width, height: 40))
        m3.scrollDirection = .horizontal
        m3.dataArray = ["恭喜xx11，完成了数据管理能力测评。" ,"恭喜xx22，完成实名认证。", "恭喜xx33，完成实名认证。", "恭喜xxx44，完成实名认证。"]
        view.addSubview(m3)

        view.addSubview(createLabel(title: "自定义View", frame: CGRect(x: 20, y: 300, width: UIScreen.main.bounds.width, height: 30)))
        let code_customerView = CustomerView(frame: CGRect(x: 0, y: 335, width: UIScreen.main.bounds.width, height: 60))
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



