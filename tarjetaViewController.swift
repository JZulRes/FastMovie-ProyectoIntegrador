//
//  tarjetaViewController.swift
//  FastMovie
//
//  Created by JuanFer on 22/04/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import UIKit



class tarjetaViewController: UIViewController{
    
 

    @IBOutlet weak var numerodetarjeta: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "pasopuesto" {
            let id = segue.destinationViewController as! RegistroCompraViewController
            id.id_pelicula = sender as! Int
            
        }
    }
    */

}
