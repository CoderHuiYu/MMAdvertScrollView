# MMAdvertScrollView
## 一个轻量级、简单易用的公告轮播组件
![2981628157219_](https://user-images.githubusercontent.com/18704047/128330982-14756df4-c47d-4d43-b60c-be714db8aa28.jpg)

### The realization principle of cyclic rolling
> collectionView has 2 sections

> start --> `indexPath(0, 0)` --> `indexPath(1, 0`) --> `indexPath(2, 0)` --> `...` --> `indexPath(n-1, 0)` --> `indexPath(0, 1)` --> `indexPath(1, 0)`--> `indexPath(2, 0)`

![MMadverstScrollView](https://user-images.githubusercontent.com/18704047/133395576-85ffa903-bbb5-4b3d-a0d7-a4004ee51404.png)

## image & gif：

<p float="center">
<img src="https://github.com/CoderHuiYu/MMAdvertScrollView/blob/main/example/example.jpeg" width = "300">
<img src="https://github.com/CoderHuiYu/MMAdvertScrollView/blob/main/example/example.gif" width = "300">
<p />

## 1.How to use MMAdvertScrollView
* Installation with CocoaPods：`pod 'MMAdvertScrollView', '~> 1.2.1'`

```swift
 var timeInterval: TimeInterval = 3.0 // 滚动间隔默认为3秒
 var scrollDirection: UICollectionView.ScrollDirection = .vertical //默认滚动方向为竖向
```
#### You can use like this
``` swift
 let m1 = MMAdvertScrollView(frame: CGRect(x: 0, y: 135, width: UIScreen.main.bounds.width, height: 40))
 m1.dataArray = ["恭喜xx，完成了数据管理能力测评。" ,"恭喜xxxxxxxxxxxxxx，完成实名认证。"]
 view.addSubview(m1)
```
## 2.This framework supports custom views
```swift
public protocol MMAdvertScrollCustomerViewDelegate: AnyObject{

    func customerViewDataArrayCount() -> Int
    func customViewConfigure(numberOfItems item: Int, cycleView view: MMAdvertScrollView) -> UIView
    func collectionView(_ cycleView: MMAdvertScrollView, didSelectItemAt indexItem: Int) 
    
}
```
### you can refer to CustomerView 
``` swift
extension CustomerView: MMAdvertScrollCustomerViewDelegate {
    func customViewConfigure(numberOfItems item: Int, cycleView view: MMAdvertScrollView) -> UIView {
        let view = VipView()
        view.title = dataArray[item]
        return view
    }

    func customerViewDataArrayCount() -> Int {
        return dataArray.count
    }
}
```

## Remind
* ARC
* iOS>=11.0

## If you have any questions 
#### If you have any questions, you can email to me:171364980@qq.com 
