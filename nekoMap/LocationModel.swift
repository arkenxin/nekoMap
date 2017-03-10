//
//  LocationModel.swift
//  nekoMap
//
//  Created by jinikuadmin on 3/10/17.
//  Copyright © 2017 xin. All rights reserved.
//

import Foundation

class LocationModel: NSObject {
    
    //properties
    
    var animal: String?
    var city: String?
    var name: String?
    var googleplaceid: String?

    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with parameters
    
    init(animal: String, city: String, name: String, address: String, googleplaceid: String, price30wd: String) {
        
        self.animal = animal
        self.city = city
        self.name = name
        self.googleplaceid = address

        
        
    }
    
    //prints object's current state
    
    override var description: String {
        return "Animal: \(animal), Name: \(name), Googleplaceid: \(googleplaceid), City: \(city)"
        
    }
    
    
}
