//
//  Detalles.swift
//  FastMovie
//
//  Created by JuanFer on 16/03/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import UIKit

class DetallesViewController: UIViewController {
    var id_pelicula = 0
    
    
    @IBOutlet weak var imagenPelicula: UIImageView!
    @IBOutlet weak var sinopsistex: UITextView!
    @IBOutlet weak var generotext: UILabel!
    @IBOutlet weak var horariotext: UILabel!
    @IBOutlet weak var clasificaciontext: UITextView!
    @IBOutlet weak var e1: UIImageView!
    @IBOutlet weak var e2: UIImageView!
    @IBOutlet weak var e3: UIImageView!
    @IBOutlet weak var e4: UIImageView!
    @IBOutlet weak var e5: UIImageView!
    @IBOutlet weak var cinesdisponibles: UILabel!
    @IBOutlet weak var botonnext: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        
        var url : String = "https://murmuring-oasis-5413.herokuapp.com/movies/\(id_pelicula).json"
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
            
            if (jsonResult != nil) {
                dispatch_async(dispatch_get_main_queue(), {
                    self.sinopsistex.text = jsonResult["sinopsis"] as? String
                    self.clasificaciontext.text = jsonResult["clasificacion"] as? String
                    self.calificar(jsonResult["calificacion"] as! Int)
                    self.generotext.text = jsonResult["genre"] as? String
                    
                    
                    //para traer las imagenes de la url
                    var url2: String = jsonResult["image"] as! String
                    
                    func requestImageWithStringURL(url2: String) {
                        if let url = NSURL(string: url2) {
                            println(url2)
                            if let data = NSData(contentsOfURL: url){
                                self.imagenPelicula.contentMode = UIViewContentMode.ScaleAspectFit
                                self.imagenPelicula.image = UIImage(data: data)
                            }
                        }
                        
                    }
                    
                    
                    requestImageWithStringURL(url2)
                    
                })
            } else {
                println("no se encontro .Json")
                
            }
            
            
        })
        //utilizamos la otra tabla para los balores que faltan utilizando la tabla funciones
        println("numero acontinuacion es el id")
        println(id_pelicula)
        var url2 : String = "https://murmuring-oasis-5413.herokuapp.com/funtions/\(id_pelicula).json"
        var request2 : NSMutableURLRequest = NSMutableURLRequest()
        request2.URL = NSURL(string: url2)
        request2.HTTPMethod = "GET" 
        
        NSURLConnection.sendAsynchronousRequest(request2, queue: NSOperationQueue(), completionHandler:{ (response1:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error1: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            
            let jsonResult1: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error1) as? NSDictionary
            
            if (jsonResult1 != nil) {
                dispatch_async(dispatch_get_main_queue(), {
                    let format = NSDateFormatter()
                    let format2 = NSDateFormatter()
                    
                    format2.dateFromString("yyyy-MM-dd'T'HH:mm:ssZZ")
                    
                    let dats:String = jsonResult1["hora"] as! String
                    
                    let date = format2.dateFromString(dats)
                    
                    format.dateStyle = NSDateFormatterStyle.MediumStyle
                    format.timeStyle = NSDateFormatterStyle.ShortStyle
                    
                    println(date)
                    
                    self.horariotext.text = dats
                })
            } else {
                println("no se encontro .json")
            }
        })
        
        
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func drawData(name: String) {
        self.sinopsistex.text = name;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mostrarcompra" {
            let id = segue.destinationViewController as! tarjetaViewController
            id_pelicula = sender as! Int
        }

    }
    
*/    
    
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
