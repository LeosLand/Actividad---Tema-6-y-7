//
//  User.swift
//  Actividad 4 y 5
//
//  Created by Alumno IDS on 20/02/18.
//  Copyright © 2018 Alumno IDS. All rights reserved.
//

import Foundation

class User {
    var id: String?
    var name: String?
    var image: String?
    
    init(name: String, image: String){
        self.name = name
        self.image = image
        self.id = UUID().uuidString
    }
    
}
