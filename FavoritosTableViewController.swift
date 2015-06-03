//
//  FavoritosTableViewController.swift
//  FastMovie
//
//  Created by JuanFer on 3/05/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import UIKit

class FavoritosTableViewController: UITableViewController {
    
    var dict:NSArray = NSArray()
    var textuser:NSMutableArray! = NSMutableArray()
    let nombrePelis:NSMutableArray = NSMutableArray()
    let imagenesPelis:NSMutableArray = NSMutableArray()
    var id: Int = 0
    var imagenpeli:String = ""
    var nombrepeli:String = ""
    var arrayname = [""]
    
    //let iduser: Int = NSUserDefaults.standardUserDefaults().objectForKey("user_id") as! Int
    let iduser: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        segueloginfavorito()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.nombrePelis.removeAllObjects()
        self.imagenesPelis.removeAllObjects()
        
        
        self.textuser.removeAllObjects()
        self.textuser.addObject(NSUserDefaults.standardUserDefaults().objectForKey("user_username")!)
        self.textuser.addObject("Peliculas Favoritas")
        //colocamos los objetos de las peliculas favortas
        BaseDeDatosFavoritos()
        println("aqui est el nombre de la pelicila \(nombrepeli)")
        self.textuser.addObject(nombrepeli)
        self.tableView.reloadData()
    }
    func BaseDeDatosFavoritos(){
        if(NSUserDefaults.standardUserDefaults().objectForKey("user_email") != nil){
            println("aceptada")
            let iduser: Int = NSUserDefaults.standardUserDefaults().objectForKey("user_id") as! Int
            
            //una conexion a la base de datos "favoritos" para preguntar por el id pelicula.
            var url : String = "https://murmuring-oasis-5413.herokuapp.com/favorites/\(iduser).json"
            
            println("id usuario: \(iduser)")
            var request : NSMutableURLRequest = NSMutableURLRequest()
            request.URL = NSURL(string: url)
            request.HTTPMethod = "GET"
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                var error: NSError?
                
                let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: &error) as? NSDictionary
                
                //let success:NSInteger = jsonResult.valueForKey("success") as! NSInteger
                
                if let datos = jsonResult as? Dictionary<String, AnyObject>{
                    
                    let arr:NSArray = jsonResult["favorites"] as! NSArray
                    
                    for iterardict in arr {
                        let inner = iterardict as! Dictionary<String, AnyObject>
                        self.id = inner["movie_id"] as! Int
                        println("EL id de la pelicula: \(self.id)")
                        self.BaseDeDatosIdPelicula(self.id);
                       
                    }
                }
            })
            //otra conexion para preguntar a la tabla "Peliculas con el id pelicula obtenido por el nombre y colocarlo en el textuser
        }
    }
    func BaseDeDatosIdPelicula(id:Int){
        var url : String = "https://murmuring-oasis-5413.herokuapp.com/movies/\(id).json"
        println(url)

        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: NSError?
            
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: &error) as? NSDictionary
            println(jsonResult)
            
        let imagen: String = (jsonResult["image"] as? String)!
           self.imagenpeli = imagen
           let nombre: String = (jsonResult["name"] as? String)!
           self.nombrepeli = nombre
            
            self.nombrePelis.addObject(nombre)
            self.imagenesPelis.addObject(imagen)
            
            self.tableView.reloadData()
            
            //println(self.imagenpeli)
            //println(self.nombrepeli)
            
            
//
//            let imagen: String = (jsonResult["image"] as? String)!
//            self.imagenpeli = imagen
//
//            var i = 0
//            while(i < self.arrayname.count){
//                if(self.arrayname[i].isEmpty){
//                   self.arrayname[i] = self.imagenpeli
//                }else{
//                    i++
//                }
//            }
//           
//            
//            println(self.arrayname)
//            let nombre: String = (jsonResult["name"] as? String)!
//            self.nombrepeli = nombre
            
            
           
        })

        
    }
    
    
    @IBAction func SignOut(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().removeObjectForKey("user_email")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("user_username")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("user_name")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("user_id")
        segueloginfavorito()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NSUserDefaults.standardUserDefaults().objectForKey("user_username") as? String
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.nombrePelis.count
        
    }
    func segueloginfavorito(){
        if(NSUserDefaults.standardUserDefaults().objectForKey("user_email") == nil){
            self.performSegueWithIdentifier("favoritelogin", sender: nil)
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = nombrePelis.objectAtIndex(indexPath.row) as? String
        
        cell.imageView!.contentMode = UIViewContentMode.ScaleAspectFit
        
        cell.imageView!.image = self.requestImageWithStringURL(self.imagenesPelis.objectAtIndex(indexPath.row) as! String)
        
        
        
        return cell
    }
    
    func  requestImageWithStringURL(url2: String)  -> UIImage?{
        if let url = NSURL(string: url2) {
            if let data = NSData(contentsOfURL: url){
                return UIImage(data: data)!
            }
        }
        return nil
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "favoritelogin"{
    let login = segue.destinationViewController as! LoginFavoritosViewController
    }
    
    }
    */
    
    
}