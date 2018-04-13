//
//  ViewController.swift
//  Mobisem-UI2
//
//  Created by mkolcalar on 11.04.2018.
//  Copyright © 2018 mkolcalar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // TableView Data
    private let products = Product.createProduct()
    
    // TableView Components
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        arrangeNavigationBar()
        
    }
    
    // Navigation Bar
    func arrangeNavigationBar() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }

}

// MARK - UITableViewDataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryIdentifier", for: indexPath) as! CategoryTableViewCell
        
        cell.product = self.products[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let p = indexPath.row
        let detailVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        
        detailVC.product = self.products[p]
        show(detailVC, sender: self)
        tableView.reloadData()
        
    }
    
}
