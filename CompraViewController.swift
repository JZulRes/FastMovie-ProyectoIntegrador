//
//  CompraViewController.swift
//  FastMovie
//
//  Created by JuanFer on 20/04/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import UIKit

class CompraViewController: UIViewController {


    
    var Horario = [""]
    var namepelicula:String = ""
    var cont:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        namepelicula = NSUserDefaults.standardUserDefaults().objectForKey("namePelicula") as! String
        
        if(namepelicula == "Corazon de león "){
            println("Entro a \(namepelicula)")
            Horario = ["2:30 pm", "4:30pm", "5:30pm", "7:30pm"]
        }else if(namepelicula == "Insurgente"){
            println("Entro a \(namepelicula)")
            Horario = ["3:00pm", "5:00pm", "7:00pm", "9:00pm"]
        }else if(namepelicula == "Home"){
            println("Entro a \(namepelicula)")
            Horario = ["12:30pm", "2:30pm","4:30pm", "6:30pm"]
        }else if(namepelicula == "Buscando a Hagen"){
            println("Entro a \(namepelicula)")
            Horario = ["12:30pm", "3:30pm", "6:30pm", "9:30pm"]
        }else if(namepelicula == "Mommy"){
            println("Entro a \(namepelicula)")
            Horario = ["1:00pm", "3:00pm","5:00pm", "7:00pm"]
        }
         
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return Horario.count // la longitud de Cinema
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        
        return Horario[row]
        
    }
    
    @IBAction func silla1(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla2(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla3(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla4(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla5(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla6(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla7(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla8(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla9(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla10(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla11(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla12(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla13(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla14(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla15(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla16(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla17(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla18(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla19(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla20(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla21(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla22(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla23(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla24(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla25(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla26(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla27(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla28(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla29(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla30(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla31(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla32(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla33(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla34(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla35(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla36(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla37(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla38(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla39(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla40(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla41(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla42(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla43(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla44(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla45(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla46(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla47(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
    @IBAction func silla48(sender: AnyObject) {
        sender.setImage(UIImage(named: "sillaocupada.png"), forState: .Normal)
        cont++
    }
      // pasotarjeta
    @IBAction func pasar(sender: AnyObject) {
        if(cont > 0){
            self.performSegueWithIdentifier("pasotarjeta", sender: nil)
        }else{
           MensajedeAlerta("Tienes que elegir por lo menos un puesto")
        }
    }
    
    func MensajedeAlerta(mensaje:String){
        var miAlerta = UIAlertController(title: "Alerta", message: mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        miAlerta.addAction(okAction)
        self.presentViewController(miAlerta, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
