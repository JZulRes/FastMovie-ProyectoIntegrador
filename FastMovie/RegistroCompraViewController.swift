//
//  RegistroCompraViewController.swift
//  FastMovie
//
//  Created by JuanFer on 18/03/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import UIKit

class RegistroCompraViewController: UIViewController, UIPickerViewDelegate {
    
    
    
    
    @IBOutlet weak var labelnametitle: UILabel!
    @IBOutlet weak var e1: UIImageView!
    @IBOutlet weak var e2: UIImageView!
    @IBOutlet weak var e3: UIImageView!
    @IBOutlet weak var e4: UIImageView!
    @IBOutlet weak var e5: UIImageView!
    
    var namepelicula:String = ""
    var califi:Int = 0
    //para el picker
    var Cinema = ["Cine Colombia CC.Molinos","Cine Colombia CC.Oviedo","Royal Films CC.PremiumPlaza","CineMark CC.ElTesoro"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namepelicula = NSUserDefaults.standardUserDefaults().objectForKey("namePelicula") as! String
        println("este es el nombre \(namepelicula)")
        califi = NSUserDefaults.standardUserDefaults().objectForKey("calificacion") as! Int
        calificar(califi)
        self.labelnametitle.text = namepelicula
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return Cinema.count // la longitud de Cinema
    }
     func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
    
        return Cinema[row]
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    func calificar(cal: Int) {
        switch cal {
        case 1:
            e1.image = UIImage(named: "estrellarellena.png")
        case 2:
            e1.image = UIImage(named: "estrellarellena.png")
            e2.image = UIImage(named: "estrellarellena.png")
            
        case 3:
            e1.image = UIImage(named: "estrellarellena.png")
            e2.image = UIImage(named: "estrellarellena.png")
            e3.image = UIImage(named: "estrellarellena.png")
        case 4:
            e1.image = UIImage(named: "estrellarellena.png")
            e2.image = UIImage(named: "estrellarellena.png")
            e3.image = UIImage(named: "estrellarellena.png")
            e4.image = UIImage(named: "estrellarellena.png")
        case 5:
            e1.image = UIImage(named: "estrellarellena.png")
            e2.image = UIImage(named: "estrellarellena.png")
            e3.image = UIImage(named: "estrellarellena.png")
            e4.image = UIImage(named: "estrellarellena.png")
            e5.image = UIImage(named: "estrellarellena.png")
        default:
            break;
        }
    }
    
    

}
