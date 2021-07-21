//
//  MMAdvertScrollView.swift
//  MMAdvertScrollView
//
//  Created by JefferyYu on 2021/4/26.
//


import UIKit

public protocol MMAdvertScrollCustomerViewDelegate: AnyObject{

    func customerViewDataArrayCount() -> Int
    func customViewConfigure(numberOfItems item: Int, cycleView view: MMAdvertScrollView) -> UIView
    func collectionView(_ cycleView: MMAdvertScrollView, didSelectItemAt indexItem: Int)
}

extension MMAdvertScrollCustomerViewDelegate {
    func collectionView(_ cycleView: MMAdvertScrollView, didSelectItemAt indexItem: Int) {}
}

public class MMAdvertScrollView: UIView {

    var timeInterval: TimeInterval = 3.0
    var scrollDirection: UICollectionView.ScrollDirection = .vertical { didSet { layout.scrollDirection = scrollDirection } }
    var dataArray: [String]? { didSet { collectionView?.reloadData(); reload = true } }
    weak open var delegate: MMAdvertScrollCustomerViewDelegate?
    private var reload = false
    private var collectionView: UICollectionView?
    private var timer: Timer?
    private var layout = UICollectionViewFlowLayout()
    private let ID = "MMAdvertCollectionViewCellidentifier"
    private let maxSectionCount = 10

    convenience init() { self.init(frame: CGRect()) }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }
    
    public override func layoutSubviews() {
        layout.itemSize = CGSize(width: frame.size.width, height: frame.size.height)
        if itemsCount() > 1 { collectionView?.scrollToItem(at: IndexPath(item: 0, section: maxSectionCount >> 2), at: (scrollDirection == .vertical ? .bottom : .right), animated: false) }
    }
    required init?(coder: NSCoder) { super.init(coder: coder); initialization() }
    
    /// Componets
    private func initialization() {
        setupTimer()
        setupMainView()
    }
    
    private func setupTimer() {
        // before create ,invalidate it fisrt
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { [weak self] _ in self?.updateUI() }
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    private func setupMainView() {
        layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = scrollDirection
        layout.sectionInset = .zero
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = backgroundColor
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.isPagingEnabled = true
        collectionView?.isScrollEnabled = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.register(MMAdvertCell.self, forCellWithReuseIdentifier: ID)
        addSubview(collectionView!, pinningEdges: .all)
    }
    
    private func updateUI() {
        let count = itemsCount()
        if count <= 1 { return }
        var currentIndexPath = collectionView?.indexPathsForVisibleItems.last
        if reload {
            if currentIndexPath?.item != 0 {
                currentIndexPath = IndexPath(row: count - 1, section: 0);
            }
            reload = false
        }
        let resetCurrentIndexPath = IndexPath(row: currentIndexPath?.item ?? 0, section: maxSectionCount >> 2)
        collectionView!.scrollToItem(at: resetCurrentIndexPath, at: (scrollDirection == .vertical ? .bottom : .right), animated: false)
        var nextItem = resetCurrentIndexPath.item + 1
        var nextSection = resetCurrentIndexPath.section
        if nextItem == count {
            nextItem = 0
            nextSection += 1
        }
        let nextIndexPath = IndexPath(item: nextItem, section: nextSection)
        collectionView!.scrollToItem(at: nextIndexPath, at: (scrollDirection == .vertical ? .bottom : .right), animated: true)
    }

    private func itemsCount() -> Int {
        var count: NSInteger = dataArray?.count ?? 0
        if delegate?.customerViewDataArrayCount() != nil && delegate?.customViewConfigure(numberOfItems: 0, cycleView: self) != nil {
            count = delegate?.customerViewDataArrayCount() ?? 0
        }
        return count
    }
}

extension MMAdvertScrollView : UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return maxSectionCount
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if delegate?.customViewConfigure(numberOfItems: 0, cycleView: self) != nil && delegate?.customerViewDataArrayCount() != nil {
            return delegate?.customerViewDataArrayCount() ?? 0
        }
        return dataArray?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ID, for: indexPath) as! MMAdvertCell
        guard delegate?.customViewConfigure(numberOfItems: indexPath.item, cycleView: self) != nil else {
            cell.customerView = MMAdvertView()
            (cell.customerView as! MMAdvertView).title = dataArray?[indexPath.item] ?? ""
            return cell
        }

        cell.customerView = delegate?.customViewConfigure(numberOfItems: indexPath.item, cycleView: self)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.collectionView(self, didSelectItemAt: indexPath.item)
    }
    
}

