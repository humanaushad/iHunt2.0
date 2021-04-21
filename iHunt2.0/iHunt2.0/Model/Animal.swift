//
//  Animal.swift
//  iHunt
//
//  Created by Huma Naushad on 2021-04-10.
//

import UIKit

struct Animal {
    
    var name : String
    var label : String
    var photo : UIImage?
    var file : String
    
    init(name: String, label: String, photo: UIImage?, file: String) {
        
        self.name = name
        self.label = label
        self.photo = photo
        self.file = file
    }
}






