//
//  LoginViewController.swift
//  FastMovie
//
//  Created by JuanFer on 16/04/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailtextbox: UITextField!
    @IBOutlet weak var contraseñatextbox: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func entrar(sender: AnyObject)  {
        
        if(emailtextbox.text.isEmpty || contraseñatextbox.text.isEmpty){
            MensajedeAlerta("Todos los campos son requeridos");
            return
        }
        
        //conexion a la base de datos
        var correo = emailtextbox.text
        var contraseña = contraseñatextbox.text
        var cont = 0
        
         let  json = "{\"user\":{\"email\":\"\(correo)\",\"password\":\"\(contraseña)\"}}"
        
         println(json.dataUsingEncoding(NSUTF8StringEncoding))
            
        let URL: NSURL = NSURL(string: "https://murmuring-oasis-5413.herokuapp.com/login")!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:URL)
        request.HTTPMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
                
                
        request.HTTPBody = json.dataUsingEncoding(NSUTF8StringEncoding);
        var error:NSError?;
        var response:NSURLResponse?;
        
        NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &error)
        
        if (error != nil) {
            
            self.MensajedeAlerta("Email o Contraseña incorrecto")
            
        }
       
        self.dismissViewControllerAnimated(true, completion: nil)
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
    
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "mostrarcompra" {
            let acompra = segue.destinationViewController as! CompraViewController
            
        }

    }
    */
    
}
