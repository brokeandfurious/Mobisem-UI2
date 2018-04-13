//
//  Product.swift
//  Mobisem-UI2
//
//  Created by mkolcalar on 11.04.2018.
//  Copyright © 2018 mkolcalar. All rights reserved.
//

import UIKit

class Product {
    var brand = ""
    var title = ""
    var price = ""
    var description = ""
    var image: UIImage!
    
    init(brand: String, title: String, price: String, description: String, image: UIImage!) {
        self.brand = brand
        self.title = title
        self.price = price
        self.description = description
        self.image = image
    }
    
    static func createProduct() -> [Product] {
        return [
            Product(brand: "Nike", title: "Nike Aerosol A1 Sneakers", price: "$420", description: "Top-notch craftsmanship, artisan tools and handpicked components make the world's best-looking pair of sneakers.", image: UIImage(named: "sneakers-1")),
            Product(brand: "Adidas", title: "Adidas Aerosol A1 Sneakers", price: "$1299", description: "Top-notch craftsmanship, artisan tools and handpicked components make the world's best-looking pair of sneakers.", image: UIImage(named: "sneakers-1"))
        ]
    }
}
