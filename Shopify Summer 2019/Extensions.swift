//
//  Extensions.swift
//  Shopify Summer 2019
//
//  Created by Bimal Bhagrath on 2019-01-18.
//  Copyright © 2019 Stack Companies Inc. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @objc func shape() -> Void {
        self.layer.cornerRadius = 3.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 0.65
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.5)
        self.layer.masksToBounds = false
    }
}

extension UIImageView {
    
    func getImageFromURL(src: URL) -> Void {
        URLSession.shared.dataTask(with: src, completionHandler: { data, res, err in
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }).resume()
    }
}
