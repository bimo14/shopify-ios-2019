//
//  Collection.swift
//  Shopify Summer 2019
//
//  Created by Bimal Bhagrath on 2019-01-17.
//  Copyright © 2019 Stack Companies Inc. All rights reserved.
//

import Foundation

enum CollectionError: Error {
    case jsonError(String)
}

class Collection {
    
    public let id: Int
    public let handle: String
    public let title: String
    public let bodyHTML: String
    public let imageSRC: String
    
    init(json: [String: Any]) throws {
        
        guard let id = json["id"] as? Int else {
            throw CollectionError.jsonError("id")
        }
        
        guard let handle = json["handle"] as? String else {
            throw CollectionError.jsonError("handle")
        }
        
        guard let title = json["title"] as? String else {
            throw CollectionError.jsonError("title")
        }
        
        guard let bodyHTML = json["body_html"] as? String else {
            throw CollectionError.jsonError("body_html")
        }
        
        guard let image = json["image"] as? [String: Any], let imageSRC = image["src"] as? String else {
            throw CollectionError.jsonError("image:src")
        }
        
        self.id = id
        self.handle = handle
        self.title = title
        self.bodyHTML = bodyHTML
        self.imageSRC = imageSRC
    }
}
