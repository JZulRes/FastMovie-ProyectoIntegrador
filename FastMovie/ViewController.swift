//
//  ViewController.swift
//  FastMovie
//
//  Created by JuanFer on 16/03/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SideBarDelegate {

    var sideBar:SideBar = SideBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideBar = SideBar(sourceView: self.view, menuItems: ["Usuario", "Peliculas", "Boletos Comprados"])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func sideBarDidSelectedButtonAtIndex(index: Int) {
        
    }


}

