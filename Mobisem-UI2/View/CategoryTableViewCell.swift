//
//  CategoryTableViewCell.swift
//  Mobisem-UI2
//
//  Created by mkolcalar on 11.04.2018.
//  Copyright © 2018 mkolcalar. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    // Outlets for views
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var product: Product? {
        didSet {
            updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI() {
        self.cellImage.image = product?.image
        self.titleLabel.text = product?.title
        self.descriptionLabel.text = product?.description
    }

}
