//
//  Peliculas.swift
//  FastMovie
//
//  Created by JuanFer on 26/04/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import Foundation
import UIKit

public enum Pelicula{
    case Unated
    case Average
    case OK
    case Good
    case Brilliant
}

class Peliculas{
    
    var titulo: String
    var image: UIImage
    
    init(titulos: String, nomimage: String){
        self.titulo = titulos
        if let img = UIImage(named : nomimage){
            image = img
            
        }else{
            image = UIImage(named: "default")!
        }
        
    }
    
}
