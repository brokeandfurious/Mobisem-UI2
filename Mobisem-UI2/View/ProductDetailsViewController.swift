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
    
    // VIEW
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var brandLabel: UILabel!
    var curtainLayer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        arrangeShadows(view: containerView)
        
        // CURTAIN
        let curtainAnimator = UIViewPropertyAnimator()
        curtainAnimator.addAnimations {
            self.addCurtain()
        }
        curtainAnimator.addCompletion {_ in 
            print("completion")
            self.curtainLayer.alpha = 0.5
        }
        
        
//        UIView.animate(withDuration: 0.5, animations: {
//            self.addCurtain()
//        }) { (finished: Bool) in
//            print("completion test")
//            self.curtainLayer.alpha = 0.4
//        }
    }
    
    @IBAction func closePopup(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addCurtain() {
        curtainLayer.isOpaque = false
        curtainLayer.alpha = 0
        curtainLayer.frame = self.view.frame
        curtainLayer.backgroundColor = .black
        self.view.addSubview(curtainLayer)
        self.view.sendSubview(toBack: curtainLayer)
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailsCell", for: indexPath) as! ProductCollectionViewCell
        
        if (product != nil) {
            print("PRODUCT ISN'T NIL")
            cell.testButton.setTitle(product?.title, for: .normal)
            return cell
        } else {
            print("PRODUCT IS NIL")
            return cell
        }
        
    }
    
}
