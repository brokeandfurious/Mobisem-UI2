//
//  DetailViewController.swift
//  Mobisem-UI2
//
//  Created by mkolcalar on 11.04.2018.
//  Copyright © 2018 mkolcalar. All rights reserved.
//

import UIKit
import QuartzCore
import Lottie

class DetailViewController: UIViewController, UIGestureRecognizerDelegate {

    // Outlets for views
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var basketImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
        
    @IBOutlet weak var greyBarView: UIView!
    
    // Animators
    let animationView = LOTAnimationView.init(name: "heart")
    var heartShrinkAnimator = UIViewPropertyAnimator()
    var heartEnlargeAnimator = UIViewPropertyAnimator()
    
    var basketImageViewAnimator:UIViewPropertyAnimator?
    var barAnimator: UIViewPropertyAnimator?
    
    //TODO: make it readonly computed property
    var initialDistanceBetweenItems: CGFloat {
        get {
            return fabs(self.basketImageView.frame.minY - self.productImageView.frame.maxY)
        }
    }
    
    
    // Necessary variables
    var product: Product?
    var navButton: BurgerView!
    
    var menuStateOn: Bool = false
    var favoritesOn: Bool = false
    
    @objc var fuckingTranslation = CGPoint()
    private var myContext = 0
    var displayLink = CADisplayLink()
    var modularValue = CGFloat()
    
    // Some test variables
    var panGesture:UIPanGestureRecognizer!
    var isIntersecting = false
    
    private func basketSizeAnimation(_ bigSize:Bool){
        
        if bigSize {
            basketImageViewAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
                self.basketImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }
        }else{
            basketImageViewAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
                self.basketImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        }
        basketImageViewAnimator?.startAnimation()
        
    }
    
    private func barSizeAnimation(_ bigSize: Bool) {
        
        if bigSize {
            barAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut, animations: {
                self.productImageView.transform = CGAffineTransform(scaleX: 0.45, y: 0.45)
                self.greyBarView.transform = CGAffineTransform(scaleX: 1.0, y: 0.000001)
            })
        } else {
            barAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut, animations: {
                self.productImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.greyBarView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        }
        barAnimator?.startAnimation()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
//        arrangeNavigationBar()
        
        // Navigation Bar Settings TEMPORARY
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        // Pan Gesture
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(DetailViewController.draggedView(_:)))
        productImageView.isUserInteractionEnabled = true
        productImageView.addGestureRecognizer(panGesture)
        panGesture.delegate = self
        
        // LOTTIE ANIMATION STUFF
        animationView.contentMode = .scaleAspectFit
        animationView.isUserInteractionEnabled = true
        self.view.addSubview(animationView)
            //constraints
            animationView.translatesAutoresizingMaskIntoConstraints = false
            animationView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            animationView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 55).isActive = true
            animationView.widthAnchor.constraint(equalToConstant: 75).isActive = true
            animationView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        // SECRET BUTTON
        let secretButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        self.view.addSubview(secretButton)
            //constraints
            secretButton.translatesAutoresizingMaskIntoConstraints = false
            secretButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            secretButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 55).isActive = true
            secretButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
            secretButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        secretButton.addTarget(self, action: #selector(heartAnimationPlay), for: .allEvents)
        
        // DISPLAY LINK TEST
        displayLink = CADisplayLink(target: self, selector: #selector(displayLinkFunctionTest))
        
        // OBSERVER STUFF
        fuckingTranslation = productImageView.frame.origin
        
        self.productImageView.addObserver(self, forKeyPath: "center", options: .new, context: &myContext)
    }
    
    
    @objc func displayLinkFunctionTest() {
        if modularValue <= 100 {
            basketSizeAnimation(true)
            print("is this working")
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let _keyPath = keyPath, _keyPath == "center" else { return }
        
        let imagePosition = self.productImageView.frame.maxY
        let basketPosition = self.basketImageView.frame.minY
//        let distanceToBottom = fabs(basketPosition - imagePosition) // always > 0
        let distanceToBottom = basketPosition - imagePosition
        let kalan = basketPosition - distanceToBottom
        
//        print("DISTANCE TO BOTTOM: ", distanceToBottom)
//        print("IMG POS: ", imagePosition, " - BASKET POS: ", basketPosition)
        
        // with every change increase basket scale
            // starting with high distance low size, and goes to low distance high size
                // distance 100 - scale 1.0
                    // scale has to be a value that keeps increasing while distance is decreasing
                        // dis 100, scale 0.5 - dis 50, scale 0.75,
        
        
//        basketImageView.transform = CGAffineTransform(scaleX: CGFloat(roundf(Float(distanceToBottom/100))), y: CGFloat(roundf(Float(distanceToBottom/100))))
//        print("FLOAT: ", CGFloat(roundf(Float(-distanceToBottom/100))))
        
        basketImageView.transform = CGAffineTransform(scaleX: (kalan/1000)*2.5, y: (kalan/1000)*2.5)
//        print("KALAN: ", (kalan/1000)*2.5)
        
        if distanceToBottom > 0 && distanceToBottom < 10 {
            debugPrint("You're so close to bottom")
//        } else if distanceToBottom >= 10 && distanceToBottom < 40 {
//            debugPrint("Hang on! You're almost there")
        } else if distanceToBottom < 0 {
            debugPrint("You're in my fucking face man!")
        } else if distanceToBottom >= 150 {
            basketImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            debugPrint("work harder!")
        }
    }
    
    @objc func heartAnimationPlay() {
        if !favoritesOn {
            favoritesOn = true
            animationView.play(fromProgress: 0, toProgress: 0.5, withCompletion: nil)
            animationView.animationSpeed = 2
        } else if favoritesOn {
            favoritesOn = false
            animationView.play(fromProgress: 0.5, toProgress: 0, withCompletion: nil)
            animationView.animationSpeed = 2
        }
    }
    
    @objc func draggedView(_ sender: UIPanGestureRecognizer) {
        self.view.bringSubview(toFront: productImageView)
        let translation = sender.translation(in: self.view)
        
        productImageView.center = CGPoint(x: productImageView.center.x + translation.x, y: productImageView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        let state = sender.state
        
        switch state {
        case .began:
            self.barSizeAnimation(true)
            break
        case .changed:
            // Basket Animation
//            self.managerBasketAnimation(productImageView.frame.intersects(basketImageView.frame))
            
            // Heart Animation
            if productImageView.frame.intersects(animationView.frame) {
                
                heartEnlargeAnimator = UIViewPropertyAnimator(duration: 0.25, dampingRatio: 0.7) {
                    self.animationView.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
                }
                heartEnlargeAnimator.startAnimation()
                
            } else {
                heartShrinkAnimator = UIViewPropertyAnimator(duration: 0.25, dampingRatio: 0.7, animations: {
                    self.animationView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                })
                heartShrinkAnimator.startAnimation()
            }
            
            // TRANSLATION TESTS
            let animationViewCoordinates = animationView.convert(animationView.frame.origin, to: self.view)
//            print("Animation View Coordinates: ", animationViewCoordinates)
            if translation.y <= animationViewCoordinates.y {
//                print("HMMMMMMMMMMMMMMM")
            }
            
            break
        case .ended:
            
            // Basket animation
            if productImageView.frame.intersects(basketImageView.frame) {
                self.managerBasketAnimation(false)
            }
            
            // Heart animation
            if !favoritesOn {
                if productImageView.frame.intersects(animationView.frame) {
                    favoritesOn = true
                    heartShrinkAnimator = UIViewPropertyAnimator(duration: 0.25, dampingRatio: 0.7) {
                        self.animationView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    }
                    
                    heartShrinkAnimator.startAnimation()
                    animationView.play()
                }
            } else if favoritesOn {
                if productImageView.frame.intersects(animationView.frame) {
                    favoritesOn = false
                    heartShrinkAnimator = UIViewPropertyAnimator(duration: 0.25, dampingRatio: 0.7, animations: {
                        self.animationView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    })
                    
                    heartShrinkAnimator.startAnimation()
                    animationView.play(fromProgress: 0.3, toProgress: 0, withCompletion: nil)
                }
            }
            

            
            // Bar size animation
            self.barSizeAnimation(false)
            
            // Get the product to enlarge with animation back to its original size
            UIView.animate(withDuration: 0.5) {
                self.productImageView.setNeedsUpdateConstraints()
                self.view.layoutIfNeeded()
            }

            break
        case .cancelled,.failed:
            
            // Heart animation
            if productImageView.frame.intersects(animationView.frame) {
                animationView.play()
            }
            
            self.managerBasketAnimation(productImageView.frame.intersects(basketImageView.frame))
        default:
            debugPrint("default executed")
            break
        }

    }
   
    private func managerBasketAnimation(_ isIntersected:Bool){
        self.basketSizeAnimation(isIntersected)
    }
    
    func updateUI() {
        self.titleLabel.text = product?.title
        self.priceLabel.text = product?.price
        self.productImageView.image = product?.image
        
        self.title = product?.brand
    }
    
//    func arrangeNavigationBar() {
//        //navbar anim test
//        navButton = BurgerView(frame: CGRect(x: 0, y: 0, width: 30, height: 24))
//        navButton.backgroundColor = .clear
//        navButton.contentMode = .top
//        navButton.translatesAutoresizingMaskIntoConstraints = false
//        let navBarButtonItem = UIBarButtonItem(customView: navButton)
//        self.navigationItem.rightBarButtonItem = navBarButtonItem
//        //constraints
//        navButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
//        navButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
//        
//        let testTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(animButtonPressed(_:)))
//        testTapRecognizer.delegate = self
//        navButton.addGestureRecognizer(testTapRecognizer)
//    }
//    
//    @IBAction func animButtonPressed(_ sender: Any) {
//        if !menuStateOn {
//            menuStateOn = true
//            navButton.addBurgerToArrowAnimation { (finished) in
//            }
//        } else {
//            menuStateOn = false
//            navButton.addBurgerToArrowAnimation(reverseAnimation: true) { (finished) in
//            }
//        }
//
//    }
    

}
