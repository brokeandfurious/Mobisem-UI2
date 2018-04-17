//
//  ProductCollectionViewCell.swift
//  Mobisem-UI2
//
//  Created by mkolcalar on 16.04.2018.
//  Copyright © 2018 mkolcalar. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellButton: UIButton!
    @IBOutlet weak var roundedView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if (roundedView) != nil {
            self.roundedView.backgroundColor = .red
            self.cellButton.tintColor = .red
        } else {
            print("nil?")
        }
    }
    
    var productDetails: ProductDetails? {
        didSet {
            updateUI()
            arrangeCellButtons()
        }
    }
    
    func updateUI() {
        cellButton.setTitle(productDetails?.size, for: .normal)
    }
    
    func arrangeCellButtons() {
        roundedView.layer.borderWidth = 0.5
        roundedView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
