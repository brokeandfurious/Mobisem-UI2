//
//  ProductCollectionViewCell.swift
//  Mobisem-UI2
//
//  Created by mkolcalar on 16.04.2018.
//  Copyright © 2018 mkolcalar. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var testButton: UIButton!
    
    var product: Product? {
        didSet {
            updateUI()
            print("accessed the cell.")
        }
    }
    
    func updateUI() {
        testButton.setTitle(product?.brand, for: .normal)
    }
    
}
