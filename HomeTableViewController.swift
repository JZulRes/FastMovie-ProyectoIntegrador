//
//  HomeTable.swift
//  FastMovie
//
//  Created by JuanFer on 16/03/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    

    var dict:NSArray = NSArray()
    var movieImage:UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url : String = "https://murmuring-oasis-5413.herokuapp.com/movies.json"
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            
            let jsonResult: NSArray! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSArray
             
            if (jsonResult != nil) {
                dispatch_async(dispatch_get_main_queue(), {
                    self.dict = jsonResult
                    //println(jsonResult)
                    
                    self.tableView.reloadData()
                })
            } else {
                // couldn't load JSON, look at error
                println("error")
            }
            
            
        })
        
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return dict.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        var url1: String = "https://murmuring-oasis-5413.herokuapp.com/movies.json"
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url1)
        
        //creacion del boton favorito
        
        let button:UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = CGRectMake(0, 0, 24, 24)
        button.setImage(UIImage(named: "Star-24"), forState: UIControlState.Normal);
        button.setImage(UIImage(named: "Estrellarellena"), forState: UIControlState.Highlighted)
        button.tag = indexPath.row
        
        //agregar la accion
        
        button.addTarget(self, action: "favoritos:", forControlEvents: UIControlEvents.TouchUpInside)
        cell.accessoryView = button;
        
        //imagen de las peliculas
        
        var DireccionImagen = dict[indexPath.row]["image"] as! String
        cell.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        cell.imageView?.image = requestImageWithStringURL(DireccionImagen)
        
        // Configure the cell...
        
        cell.textLabel?.text = dict[indexPath.row]["name"] as? String
        
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

    func Dbfavoritos(idpelicula:Int){

        let iduser = NSUserDefaults.standardUserDefaults().objectForKey("user_id") as! Int
        println("el user id necesario: \(iduser)")
        println("el id pelicula necesario \(idpelicula)")
        println("Entramos en la conexion")
        
        let  json = "{\"favorite\":{\"movie_id\":\"\(idpelicula)\",\"user_id\":\"\(iduser)\"}}"

       
        let URL: NSURL = NSURL(string: "https://murmuring-oasis-5413.herokuapp.com/favorites.json")!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:URL)
        request.HTTPMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.HTTPBody = json.dataUsingEncoding(NSUTF8StringEncoding);
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue())
            {
                (response, data, error) in
                //println(response)
        }
    }
    
    func favoritos(button: UIButton) {
        if(NSUserDefaults.standardUserDefaults().objectForKey("user_email") == nil){
            //mensaje de alerta indicandole al usuario que es neceario login
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Login"
            alertView.message = "Es necesario iniciar sesion" as String
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            return
        }else{
            let idpelicula = dict[button.tag]["id"] as! Int
            println("Se undio: \(idpelicula)")
            //hacer la conexion en la base de datos
            Dbfavoritos(idpelicula)
        }
        
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("details_segue2", sender: dict[indexPath.row]["id"])
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "details_segue2" {
            let vistaDetalles = segue.destinationViewController as! DetallesViewController
            vistaDetalles.id_pelicula = sender as! Int
        }
        
        
    }
}
