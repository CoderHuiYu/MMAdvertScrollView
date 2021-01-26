// Copyright © 2021 Peogoo. All rights reserved.

import UIKit

@objc protocol MMAdvertScrollViewDelegate: AnyObject{
    
    @objc optional func customCycleScrollViewCellClass(_ cycleView: MMAdvertScrollView) -> AnyClass
    @objc optional func customCycleScrollViewNibCellClass(_ cycleView: MMAdvertScrollView) -> AnyClass
    func customCycleScrollViewSet(_ collectionViewCell: UICollectionViewCell, numberOfItems item: Int, cycleView view: MMAdvertScrollView )
    @objc optional  func collectionView(_ cycleView: MMAdvertScrollView, didSelectItemAt indexItem: Int)
}

protocol MMAdvertScrollViewValueDelegate {
    var title: String { get }
}

class MMAdvertScrollView: UIView {

    var timeInterval: TimeInterval = 3.0
    var scrollDirection: UICollectionView.ScrollDirection = .vertical { didSet { layout.scrollDirection = scrollDirection } }
    var dataArray: [String]? { didSet { collectionView?.reloadData() } }
    var isOnlyShowTitle: Bool = false
    weak open var delegate: MMAdvertScrollViewDelegate? {
        didSet {
            if let cellClass = delegate?.customCycleScrollViewCellClass?(self) {
                collectionView?.register(cellClass, forCellWithReuseIdentifier: ID)
                return
            }
            if let cellClass = delegate?.customCycleScrollViewNibCellClass?(self) {
                collectionView?.register(UINib(nibName: String(describing: cellClass.self), bundle: nil), forCellWithReuseIdentifier: ID)
            }
        }
    }
    private var collectionView: UICollectionView?
    private var timer: Timer?
    private var layout = UICollectionViewFlowLayout()
    private let ID = "ETCycleCollectionViewCellidentifier"
    private let maxSectionCount = 100
    
    convenience init() {
        self.init(frame: CGRect())
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }
    
    override func layoutSubviews() {
        layout.itemSize = CGSize(width: frame.size.width, height: frame.size.height)
        if dataArray?.count ?? 0 > 1 { collectionView?.scrollToItem(at: IndexPath(item: 0, section: maxSectionCount >> 2), at: (scrollDirection == .vertical ? .bottom : .right), animated: false) }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Componets
    private func initialization() {
        setupTimer()
        setupMainView()
    }
    
    private func setupTimer() {
        timer?.invalidate() //创建定时器前先停止定时器，不然会出现僵尸定时器，导致轮播频率错误
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { [weak self] _ in self?.updateUI() }
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    private func setupMainView() {
        layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = scrollDirection
        layout.sectionInset = .zero
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), collectionViewLayout: layout)
        collectionView?.backgroundColor = backgroundColor
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.isPagingEnabled = true
        collectionView?.isScrollEnabled = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.register(MMAdvertCell.self, forCellWithReuseIdentifier: ID)
        addSubview(collectionView!)
    }
    
    private func updateUI() {
        guard let datas = dataArray else { return }
        if datas.count <= 1 { return }
        let currentIndexPath = collectionView?.indexPathsForVisibleItems.last
        let resetCurrentIndexPath = IndexPath(row: currentIndexPath?.item ?? 0, section: maxSectionCount >> 2)
        collectionView!.scrollToItem(at: resetCurrentIndexPath, at: (scrollDirection == .vertical ? .bottom : .right), animated: false)
        var nextItem = resetCurrentIndexPath.item + 1
        var nextSection = resetCurrentIndexPath.section
        if nextItem == dataArray?.count {
            nextItem = 0
            nextSection += 1
        }
        let nextIndexPath = IndexPath(item: nextItem, section: nextSection)
        collectionView!.scrollToItem(at: nextIndexPath, at: (scrollDirection == .vertical ? .bottom : .right), animated: true)
    }
}

extension MMAdvertScrollView : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return maxSectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ID, for: indexPath)
    
        if delegate?.customCycleScrollViewNibCellClass?(self) != nil  && delegate?.customCycleScrollViewSet(cell, numberOfItems: indexPath.item, cycleView: self) != nil { return cell }
        if delegate?.customCycleScrollViewCellClass?(self) != nil  && delegate?.customCycleScrollViewSet(cell, numberOfItems: indexPath.item, cycleView: self) != nil { return cell }
        
        (cell as! MMAdvertCell).title = dataArray?[indexPath.row] ?? ""
        (cell as! MMAdvertCell).isOnlyShowTitle = isOnlyShowTitle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt --- indexPath\(indexPath.item)")
        delegate?.collectionView?(self, didSelectItemAt: indexPath.item)
        selectItemClosure?(indexPath.item)
    }
    
}
