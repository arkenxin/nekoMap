//
//  Animals.swift
//  nekoMap
//
//  Created by jinikuadmin on 3/9/17.
//  Copyright © 2017 xin. All rights reserved.
//

import UIKit

class Animals {
    
    var name: String
    var icon: UIImage?
    
    init?(name:String, icon:UIImage?) {
        
        if name.isEmpty {
            return nil
        }
        
        self.name = name
        self.icon = icon
    }

    
}
