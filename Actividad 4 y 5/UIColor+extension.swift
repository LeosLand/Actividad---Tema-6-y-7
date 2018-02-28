//
//  UIColor+extension.swift
//  Actividad 4 y 5
//
//  Created by Alumno IDS on 20/02/18.
//  Copyright © 2018 Alumno IDS. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        self.init(red:r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
