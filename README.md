# MMAdvertScrollView
#####一个轻量级、简单易用的公告轮播组件【swift】
##GIf：
## 1.How to use MMAdvertScrollView
* Installation with CocoaPods：`pod 'MMAdvertScrollView'`

```
 var timeInterval: TimeInterval = 3.0 // 滚动间隔默认为3秒
 var scrollDirection: UICollectionView.ScrollDirection = .vertical //默认滚动方向为竖向
 var isOnlyShowTitle: Bool = false
```
#### You can use like this
``` swift
 let m1 = MMAdvertScrollView(frame: CGRect(x: 0, y: 135, width: UIScreen.main.bounds.width, height: 40))
 m1.dataArray = ["恭喜xx，完成了数据管理能力测评。" ,"恭喜xxxxxxxxxxxxxx，完成实名认证。"]
 view.addSubview(m1)
```
## 2.This framework supports custom views（框架支持自定义view）
```
@objc protocol MMAdvertScrollViewDelegate: AnyObject{
    @objc optional func customCycleScrollViewCellClass(_ cycleView: MMAdvertScrollView) -> AnyClass
    @objc optional func customCycleScrollViewNibCellClass(_ cycleView: MMAdvertScrollView) -> AnyClass
    func customCycleScrollViewSet(_ collectionViewCell: UICollectionViewCell, numberOfItems item: Int, cycleView view: MMAdvertScrollView )
    @objc optional  func collectionView(_ cycleView: MMAdvertScrollView, didSelectItemAt indexItem: Int)
}
```
#### 我们支持xib和纯代码两种方式自定义的view
###2.1. XIB
#### 可以参考CustomerView
```
extension CustomerView: MMAdvertScrollViewDelegate {
    // 注册 xib cell
    func customCycleScrollViewNibCellClass(_ cycleView: MMAdvertScrollView) -> AnyClass {
        return CustomerXIBCell.self
    }
    
    func customCycleScrollViewSet(_ collectionViewCell: UICollectionViewCell, numberOfItems item: Int, cycleView view: MMAdvertScrollView) {
        let customeCell = collectionViewCell as! CustomerXIBCell
        customeCell.titles = ["恭喜xx，完成了数据管理能力测评。", "我是自定义view，而且cell是用xib" ,"恭喜xxxxxxxxxxxxxx，完成实名认证。"]
        customeCell.backgroundColor = .yellow
    }
}
```
###2.2 纯代码
####可以参考CustomerView2
```
extension CustomerView2: MMAdvertScrollViewDelegate {
    // 注册纯代码cell
    func customCycleScrollViewCellClass(_ cycleView: MMAdvertScrollView) -> AnyClass {
        return CustomerCollectionViewCell.self
    }
    
    func customCycleScrollViewSet(_ collectionViewCell: UICollectionViewCell, numberOfItems item: Int, cycleView view: MMAdvertScrollView) {
        let customeCell = collectionViewCell as! CustomerCollectionViewCell
        customeCell.titles = ["恭喜xx，完成了数据管理能力测评。", "我是自定义view，而且cell是用纯代码实现的" ,"恭喜xxxxxxxxxxxxxx，完成实名认证。"]
        customeCell.backgroundColor = .red
    }
}
```
##Remind
* ARC
* iOS>=13.0

## 如果有任何问题
#### 如果有任何问题，可以发邮件给我:171364980@qq.com