//
//  CustomNavigationController.swift
//  Mobisem-UI2
//
//  Created by mkolcalar on 13.04.2018.
//  Copyright © 2018 mkolcalar. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    var navButton: BurgerView!
    var menuStateOn: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        arrangeNavigationBar()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true

    }
    
    func arrangeNavigationBar() {
        //navbar anim test
        navButton = BurgerView(frame: CGRect(x: 0, y: 0, width: 30, height: 24))
        navButton.backgroundColor = .clear
        navButton.contentMode = .top
        navButton.translatesAutoresizingMaskIntoConstraints = false
        let navBarButtonItem = UIBarButtonItem(customView: navButton)
        self.navigationItem.rightBarButtonItem = navBarButtonItem
        //constraints
        navButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        navButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        let testTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(animButtonPressed(_:)))
        testTapRecognizer.delegate = self
        navButton.addGestureRecognizer(testTapRecognizer)
    }
    
    @IBAction func animButtonPressed(_ sender: Any) {
        if !menuStateOn {
            menuStateOn = true
            navButton.addBurgerToArrowAnimation { (finished) in
            }
        } else {
            menuStateOn = false
            navButton.addBurgerToArrowAnimation(reverseAnimation: true) { (finished) in
            }
        }
        
    }

}
