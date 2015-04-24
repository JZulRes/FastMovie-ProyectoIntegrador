//
//  CrearUsuarioViewController.swift
//  FastMovie
//
//  Created by JuanFer on 15/04/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import UIKit
import Foundation

class CrearUsuarioViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate {
    
    @IBOutlet weak var nombretextbox: UITextField!
    @IBOutlet weak var correotextbox: UITextField!
    @IBOutlet weak var contraseñatextbox: UITextField!
    @IBOutlet weak var usernametextbox: UITextField!
    @IBOutlet weak var repitacontratextbox: UITextField!
    
    override func viewDidLoad() {
        nombretextbox.delegate = self
        correotextbox.delegate = self
        contraseñatextbox.delegate = self
        usernametextbox.delegate = self
        repitacontratextbox.delegate = self
        
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        nombretextbox.resignFirstResponder()
        correotextbox.resignFirstResponder()
        contraseñatextbox.resignFirstResponder()
        usernametextbox.resignFirstResponder()
        repitacontratextbox.resignFirstResponder()
    }
    
    @IBAction func botonRegistrar(sender: AnyObject) {
        
        var nombre = nombretextbox.text
        var correo = correotextbox.text
        var contraseña = contraseñatextbox.text
        var username = usernametextbox.text
        var repetircontra = repitacontratextbox.text
        var conterror = 0
        
        //si hay espacios en blanco
        if(nombre.isEmpty || correo.isEmpty || contraseña.isEmpty || username.isEmpty || repetircontra.isEmpty){
            //mostramos un mensaje de alerta
            MensajedeAlerta("Todos los campos son requeridos");
            conterror = conterror + 1;
            return
        }
        if(contraseña != repetircontra){
            //mostramos un mensaje de error
            MensajedeAlerta("Contraseñas no coinciden");
            conterror = conterror + 1;
            return
        }
        if(conterror == 0){
            //conexion en la base de datos
            println("entro al if json " + String(conterror));
        
            
            let  json = "{\"user\":{\"name\":\"\(nombre)\",\"email\":\"\(correo)\",\"password\":\"\(contraseña)\",\"username\":\"\(username)\"}}"
            
            
            let URL: NSURL = NSURL(string: "https://murmuring-oasis-5413.herokuapp.com/users.json")!
            let request:NSMutableURLRequest = NSMutableURLRequest(URL:URL)
            request.HTTPMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.HTTPBody = json.dataUsingEncoding(NSUTF8StringEncoding);
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue())
                {
                    (response, data, error) in
                    println(response)
                   
                    

            }
            
        MensajedeResgistro("El registro se ha realizado con exito")
            
        }
     /*
        //mostrar alerta con confirmacion
         var miAlerta = UIAlertController(title: "Alerta", message: "El registro fue exitoso", preferredStyle: UIAlertControllerStyle.Alert)
        // para que el segue modal se quite
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default){
            action in
            self.dismissViewControllerAnimated(true, completion: nil) // con esta funcion el segue modal se  quita
        }
     */
    }
    
    @IBAction func tengocuenta(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func MensajedeAlerta(mensaje:String){
        var miAlerta = UIAlertController(title: "Alerta", message: mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        miAlerta.addAction(okAction)
        self.presentViewController(miAlerta, animated: true, completion: nil)
        
    }
    func MensajedeResgistro(mensaje:String){
        //mostrar alerta con confirmacion
        
        var miAlerta = UIAlertController(title: "Alerta", message: mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        
        //miAlerta.delegate = self
        // para que el segue modal se quite
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:nil)
         miAlerta.addAction(okAction)
        
        self.dismissViewControllerAnimated(true, completion: nil) // con esta funcion el segue modal se  quita
        

    }
    
    func textFieldDidEndEditing(textField: UITextField){
        textField.resignFirstResponder()
    }
}
