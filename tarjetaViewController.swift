//
//  tarjetaViewController.swift
//  FastMovie
//
//  Created by JuanFer on 22/04/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import UIKit

class tarjetaViewController: UIViewController {

    @IBOutlet weak var numerodetarjeta: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancelarBoton(sender: UIButton) {
        
    segueForUnwindingToViewController(toViewController: nil, fromViewController: nil, identifier: details_segue)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
