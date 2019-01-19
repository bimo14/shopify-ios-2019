//
//  API.swift
//  Shopify Summer 2019
//
//  Created by Bimal Bhagrath on 2019-01-18.
//  Copyright © 2019 Stack Companies Inc. All rights reserved.
//

import Foundation

class API {
    
    private static let session = URLSession(configuration: .default)
    
    private static func getCollectionsURL() -> URL {
        let urlString = "https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
        
        return URL(string: urlString)!
    }
    
    private static func getCollectsURL(collectionID: Int) -> URL {
        let urlString = "https://shopicruit.myshopify.com/admin/collects.json?collection_id=" + String(collectionID) + "&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
        
        return URL(string: urlString)!
    }
    
    private static func getProductsURL(productIDs: [Int]) -> URL {
        let idStrings = productIDs.map { String($0) }
        let urlString = "https://shopicruit.myshopify.com/admin/products.json?ids=" + idStrings.joined(separator: ",") + "&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
        
        return URL(string: urlString)!
    }
    
    public static func fetchCollections(complete: @escaping ([Collection]) -> Void) -> Void {
        let url = getCollectionsURL()
        
        session.dataTask(with: url, completionHandler: { data, res, err in
            var collections = [Collection]()
            
            if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any], let jsonCollections = json["custom_collections"] as? [[String: Any]] {
                for case let object in jsonCollections {
                    if let collection = try? Collection(json: object) {
                        collections.append(collection)
                    }
                }
            }
            
            complete(collections)
        }).resume()
    }
    
    public static func fetchProducts(collectionID: Int, complete: @escaping ([Product]) -> Void) -> Void {
        let collectsURL = getCollectsURL(collectionID: collectionID)
        
        session.dataTask(with: collectsURL, completionHandler: { data, _, _ in
            var productsIDs: [Int] = []
            
            if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any], let jsonCollects = json["collects"] as? [[String: Any]] {
                for case let object in jsonCollects {
                    if let productID = object["product_id"] as? Int {
                        productsIDs.append(productID)
                    }
                }
            }
            
            let productsURL = getProductsURL(productIDs: productsIDs)
            
            session.dataTask(with: productsURL, completionHandler: { data2, _, _ in
                var products = [Product]()
                
                if let data2 = data2, let json2 = try? JSONSerialization.jsonObject(with: data2, options: []) as! [String: Any], let jsonProducts = json2["products"] as? [[String: Any]] {
                    for case let object in jsonProducts {
                        if let product = try? Product(json: object) {
                            products.append(product)
                        }
                    }
                }
                
                complete(products)
            }).resume()
        }).resume()
    }
}
