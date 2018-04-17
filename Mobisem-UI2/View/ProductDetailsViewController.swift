//
//  ProductDetailsViewController.swift
//  Mobisem-UI2
//
//  Created by mkolcalar on 16.04.2018.
//  Copyright © 2018 mkolcalar. All rights reserved.
//

import UIKit
import Foundation

class ProductDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var product: Product?
    var productDetails = ProductDetails.createProductDetails()
    
    // VIEW
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var bottomSettingsView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        arrangeShadows(view: containerView)
        arrangeCorners(view: bottomSettingsView, cornerSelection1: .layerMaxXMaxYCorner, cornerSelection2: .layerMinXMaxYCorner, cornerRadius: 15)
        arrangeCorners(view: collectionView, cornerSelection1: .layerMinXMinYCorner, cornerSelection2: .layerMaxXMinYCorner, cornerRadius: 15)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.allowsMultipleSelection = true
    }
    
    @IBAction func closePopup(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func checkButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func updateUI() {
        brandLabel.text = product?.brand
    }
    
    func arrangeShadows(view: UIView) {
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowRadius = 20
        view.layer.shadowOpacity = 0.7
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
//        view.layer.shouldRasterize = true
    }
    
    func arrangeCorners(view: UIView, cornerSelection1: CACornerMask, cornerSelection2: CACornerMask, cornerSelection3: CACornerMask?=nil, cornerSelection4: CACornerMask?=nil, cornerRadius: CGFloat) {
        view.clipsToBounds = true
        view.layer.cornerRadius = cornerRadius
        view.layer.maskedCorners = [cornerSelection1, cornerSelection2]
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailsCell", for: indexPath) as! ProductCollectionViewCell
        
        let p = indexPath.row
        
        if (product != nil) {
            cell.productDetails = self.productDetails[p]
            return cell
        } else {
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell: ProductCollectionViewCell? = collectionView.cellForItem(at: indexPath) as? ProductCollectionViewCell
        
        print("Selected Cell: \(indexPath.row)")
        
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn) {
            cell?.roundedView.backgroundColor = .orange
            cell?.roundedView.layer.borderColor = UIColor.white.cgColor
            cell?.cellButton.titleLabel?.textColor = .white
        }
        animator.startAnimation()

    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell: ProductCollectionViewCell? = collectionView.cellForItem(at: indexPath) as? ProductCollectionViewCell
        
        print("DE-selected Cell: \(indexPath.row)")
        
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn) {
            cell?.roundedView.backgroundColor = .white
            cell?.roundedView.layer.borderColor = UIColor.lightGray.cgColor
            cell?.cellButton.titleLabel?.textColor = .black
        }
        animator.startAnimation()

    }
    
}
