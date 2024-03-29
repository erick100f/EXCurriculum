//
//  UIImage+Extensions.swift
//  EXCurriculum
//
//  Created by Erick Cienfuegos on 10/4/19.
//  Copyright © 2019 Erick Cienfuegos. All rights reserved.
//

import UIKit

public extension UIImageView {

    func load(_ url: URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }else {
                self?.image = UIImage(named: "noImage")
            }
        }
    }
    
    func load(url: URL?){
        guard let url = url else {
            self.image = UIImage(named: "noImage")
            return
        }
        load(url)
    }
}
