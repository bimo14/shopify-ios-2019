//
//  Product.swift
//  Shopify Summer 2019
//
//  Created by Bimal Bhagrath on 2019-01-18.
//  Copyright © 2019 Stack Companies Inc. All rights reserved.
//

import Foundation

enum ProductError: Error {
    case jsonError(String)
}

class Product {
    
    public let id: Int
    public let title: String
    public let vendor: String
    public let bodyHTML: String
    public let imageSRC: String
    public let available: Int
    
    init(json: [String: Any]) throws {
        
        guard let id = json["id"] as? Int else {
            throw ProductError.jsonError("id")
        }
        
        guard let title = json["title"] as? String else {
            throw ProductError.jsonError("title")
        }
        
        guard let vendor = json["vendor"] as? String else {
            throw ProductError.jsonError("vendor")
        }
        
        guard let bodyHTML = json["body_html"] as? String else {
            throw ProductError.jsonError("body_html")
        }
        
        guard let image = json["image"] as? [String: Any], let imageSRC = image["src"] as? String else {
            throw ProductError.jsonError("image:src")
        }
        
        guard let variants = json["variants"] as? [[String: Any]] else {
            throw ProductError.jsonError("variants")
        }
        
        var available = 0
        
        for case let object in variants {
            if let quantity = object["inventory_quantity"] as? Int {
                available += quantity
            }
        }
        
        self.id = id
        self.title = title
        self.vendor = vendor
        self.bodyHTML = bodyHTML
        self.imageSRC = imageSRC
        self.available = available
    }
}
