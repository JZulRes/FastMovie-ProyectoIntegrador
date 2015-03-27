//
//  Detalles.swift
//  FastMovie
//
//  Created by JuanFer on 16/03/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import UIKit

class Detalles: UIViewController {
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
        var url : String = "http://localhost:3000/movies/\(id_pelicula).json"
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
                    self.calificar(jsonResult["calificacion"] as Int)
                    self.generotext.text = jsonResult["genre"] as? String
                    
                    
                    //para traer las imagenes de la url
                    var url2: String = jsonResult["image"] as String
            
                    func requestImageWithStringURL(url2: String) {
                        let url = NSURL(string: url2)
                        let data = NSData(contentsOfURL: url!)
                        self.imagenPelicula.image = UIImage(data: data!)
                    }
                    
                    func addImage() {
                        self.imagenPelicula.image = UIImage(data: data!)
                        
                    }
                    
                    
           
                })
                
               
            } else {
                println("no se encontro .Json")
                
            }
            
            
        })
        //utilizamos la otra tabla para los balores que faltan 
        println(id_pelicula)
        var url2 : String = "http://localhost:3000/funtions/\(id_pelicula).json"
        var request2 : NSMutableURLRequest = NSMutableURLRequest()
        request2.URL = NSURL(string: url2)
        request2.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request2, queue: NSOperationQueue(), completionHandler:{ (response1:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error1: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            
            let jsonResult1: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error1) as? NSDictionary
            
            if (jsonResult1 != nil) {
                dispatch_async(dispatch_get_main_queue(), {
                    println(jsonResult1["hora"] as String)
                    self.horariotext.text = jsonResult1["Hora"] as? String
                })
            } else {
                println("no se encontro .json")
            }
        })
        
        
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        sinopsistex.text="Continúan las hazañas de la imparable franquicia de Rápidos y Furiosos. Vin Diesel, Paul Walker y Dwayne Johnson lideran el casting de actores de Rápidos Y Furiosos 7. James Wan dirige el nuevo capítulo de esta exitosa serie que incluye también a Michelle Rodriguez, Jordana Brewster, Tyrese Gibson, Chris “Ludracris” Bridges, Elsa Pataky y Lucas Black. Ello son acompañados por nuevas estrellas de acción internacionales que se unen a la franquicia como Jason Statham, Djimon Hounsou, Tony Jaa, Ronda Rousey, Nathalie Emmanuel y Kurt Russell. Además Neal H. Moritz, Vin Diesel y Michael Fottrel regresan para producir esta nueva entrega escrita por Chris Morgan."
        
//        cinesdisponibles.text="Cine Colombia los molinos \n Royal Films Premium plaza"
//        horariotext.text="12pm-2pm"
//        clasificaciontext.text = "Para mayores de 16"
//        generotext.text = "Accion"
        
          }
    
    func drawData(name: String) {
        self.sinopsistex.text = name;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
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
