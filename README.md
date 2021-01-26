# MMAdvertScrollView
##### 一个轻量级、简单易用的公告轮播组件【swift】
## video：
<video id="video" controls="" preload="none" 
<source id="mp4" src="https://github.com/CoderHuiYu/MMAdvertScrollView/blob/main/example.MP4" type="video/mp4">
</video>
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
#### We support both XIB and pure code custom views（我们支持xib和纯代码两种方式自定义的view）
### 2.1. XIB
#### you can refer to CustomerView (可以参考CustomerView)
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
### 2.2 pure code (纯代码)
#### you can refer to Customer2 (可以参考CustomerView2)
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
### ！Warning：If you customize the Cell, you must implement it`customCycleScrollViewSet`(如果自定义Cell，必须实现 `customCycleScrollViewSet`)

#### example:
```
 func customCycleScrollViewSet(_ collectionViewCell: UICollectionViewCell, numberOfItems item: Int, cycleView view: MMAdvertScrollView) {
        let customeCell = collectionViewCell as! CustomerXIBCell
        customeCell.titles = ["恭喜xx，完成了数据管理能力测评。", "我是自定义view，而且cell是用xib" ,"恭喜xxxxxxxxxxxxxx，完成实名认证。"]
        customeCell.backgroundColor = .yellow
    }
```
#### You can assign and modify cells in this protocol method(你可以在这个代理方法里面进行cell的赋值和修改)

## Remind
* ARC
* iOS>=10.0

## If you have any questions ( 如果有任何问题)
#### If you have any questions, you can email to me:171364980@qq.com (如果有任何问题，可以发邮件给我:171364980@qq.com)