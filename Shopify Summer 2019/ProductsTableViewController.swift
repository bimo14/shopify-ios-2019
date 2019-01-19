//
//  ProductsTableViewController.swift
//  Shopify Summer 2019
//
//  Created by Bimal Bhagrath on 2019-01-18.
//  Copyright © 2019 Stack Companies Inc. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var collection: Collection?
    var products = [Product]()
    
    private func sortProducts() -> Void {
        products.sort { $0.title < $1.title }
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsets(top: 15.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        if collection != nil {
            navigationItem.title = collection!.title
            
            API.fetchProducts(collectionID: collection!.id, complete: { products in
                self.products = products
                self.sortProducts()
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let identifier = "ProductsCollectionTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ProductsCollectionTableViewCell
            
            cell.titleLabel.text = collection?.title ?? ""
            cell.bodyLabel.text = collection?.bodyHTML ?? ""
            
            if let src = URL(string: collection?.imageSRC ?? "") {
                cell.collectionImage.getImageFromURL(src: src)
            }
            
            return cell
        }
        else {
            let identifier = "ProductsTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ProductsTableViewCell
            
            let product = products[indexPath.row - 1]
            
            cell.titleLabel.text = product.title
            cell.vendorLabel.text = "by " + product.vendor
            cell.bodyLabel.text = product.bodyHTML
            cell.availableLabel.text = String(product.available) + " available"
            
            if let src = URL(string: product.imageSRC) {
                cell.productImage.getImageFromURL(src: src)
            }
            
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {}
    */

    /*
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {}
    */

    /*
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    // MARK: - Navigation

    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
    */
}
