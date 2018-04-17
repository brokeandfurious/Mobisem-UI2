//
//  ProductDetails.swift
//  Mobisem-UI2
//
//  Created by mkolcalar on 17.04.2018.
//  Copyright © 2018 mkolcalar. All rights reserved.
//

import UIKit

class ProductDetails {
    var size = ""
    
    init(size: String) {
        self.size = size
    }
    
    static func createProductDetails() -> [ProductDetails] {
        return [
            ProductDetails(size: "37"),
            ProductDetails(size: "38.5"),
            ProductDetails(size: "39"),
            ProductDetails(size: "40.5"),
            ProductDetails(size: "41"),
            ProductDetails(size: "42.5"),
            ProductDetails(size: "43"),
            ProductDetails(size: "44"),
            ProductDetails(size: "45.5"),
            ProductDetails(size: "46"),
            ProductDetails(size: "47"),
            ProductDetails(size: "48.5"),
            ProductDetails(size: "49"),
            ProductDetails(size: "50"),
            ProductDetails(size: "51"),
            ProductDetails(size: "52"),
            ProductDetails(size: "53"),
            ProductDetails(size: "54"),
            ProductDetails(size: "55"),
            ProductDetails(size: "56"),
            ProductDetails(size: "57")
        ]
    }
}
