// Copyright © 2021 Peogoo. All rights reserved.

import UIKit

class CustomerXIBCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel1: UILabel!
    
    @IBOutlet weak var titleLabel2: UILabel!
    
    @IBOutlet weak var titleLabel3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var titles: [String]? {
        didSet {
            if titles?.count ?? 0 >= 1 { titleLabel1.text = titles?[0] }
            if titles?.count ?? 0 >= 2 { titleLabel2.text = titles?[1] }
            if titles?.count ?? 0 >= 3 { titleLabel3.text = titles?[2] }
        }
    }

}
