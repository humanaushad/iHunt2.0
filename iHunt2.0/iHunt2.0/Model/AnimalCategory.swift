//
//  AnimalCategory.swift
//  iHunt2.0
//
//  Created by Huma Naushad on 2021-04-15.
//

import UIKit

struct AnimalCategory {
    
    var type : AnimalType
    var animalArr : [Animal]
    var label : String
    var photo : UIImage?
    
    init(type: AnimalType, animalArr: [Animal] , label: String, photo: UIImage?) {
        
        self.type = type
        self.animalArr = animalArr
        self.label = label
        self.photo = photo
    }
}

enum AnimalType : String{
    case Dog, Cat, Hedgehog, Rabbit, Duck
}



