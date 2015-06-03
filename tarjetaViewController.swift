//
//  tarjetaViewController.swift
//  FastMovie
//
//  Created by JuanFer on 22/04/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import UIKit



class tarjetaViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate{
    
 
 
    @IBOutlet weak var numerodetarjeta: UITextField!
    @IBOutlet weak var validomes: UITextField!
    @IBOutlet weak var validoaño: UITextField!
    @IBOutlet weak var codigo: UITextField!
    @IBOutlet weak var propietario: UITextField!
    @IBOutlet weak var cuotas: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seguelogin()
        numerodetarjeta.delegate = self
        validomes.delegate = self
        validoaño.delegate = self
        codigo.delegate = self
        propietario.delegate = self
        cuotas.delegate = self
        
       
    }
    
    func seguelogin(){
        if(NSUserDefaults.standardUserDefaults().objectForKey("user_email") == nil){
        self.performSegueWithIdentifier("login", sender: nil)
        }
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        numerodetarjeta.resignFirstResponder()
        validomes.resignFirstResponder()
        validoaño.resignFirstResponder()
        codigo.resignFirstResponder()
        propietario.resignFirstResponder()
    }
    
    @IBAction func compra(sender: AnyObject) {
        var numerotarjeta = numerodetarjeta.text
        var validom = validomes.text
        var validoa = validoaño.text
        var codi = codigo.text
        var propie = propietario.text
        var cuo = cuotas.text
        
        // espacios en blanco 
        if(numerotarjeta.isEmpty || validom.isEmpty || validoa.isEmpty || codi.isEmpty || propie.isEmpty || cuo.isEmpty){
            //mostramos alerta
            MensajedeAlerta("Todos los campos son requeridos");
            return
        }else{
            MensajedeAlerta("Compra Realizada, Los datos se le seran enviados al correo")
        }
        
    }
    
    func MensajedeAlerta(mensaje:String){
        var miAlerta = UIAlertController(title: "Alerta", message: mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        miAlerta.addAction(okAction)
        self.presentViewController(miAlerta, animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(textField: UITextField){
        textField.resignFirstResponder()
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
