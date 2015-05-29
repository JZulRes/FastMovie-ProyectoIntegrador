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
    var saveidpelicula: NSArray = NSArray()
    var numerodepelicula: Int = 0
    var favorites: NSDictionary?
    var idpeliculafavo: AnyObject?
    //let iduser: Int = NSUserDefaults.standardUserDefaults().objectForKey("user_id") as! Int
    let iduser: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        segueloginfavorito()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
    }
    
    override func viewDidAppear(animated: Bool) {
        self.textuser.removeAllObjects()
        self.textuser.addObject(NSUserDefaults.standardUserDefaults().objectForKey("user_username")!)
        self.textuser.addObject("Peliculas Favoritas")
        BaseDeDatosFavoritos()
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
                    
                        let id = inner["movie_id"]
                        println("EL id de la pelicula: \(id)")
                    
                }
                
//                if let dict = jsonResult["favorites"] as? Dictionary<String, AnyObject>{
//                    for iterardict in dict{
//                        let id = iterardict["movie_id"]
//                        println("EL id de la pelicula: \(id)")
//                        let b = dict["movie_id"]
//                       println(b)
//                    }
//                }
//                
            }
        })
        
        println("el id de la pelicula es: \(saveidpelicula)")
        
        
        //otra conexion para preguntar a la tabla "Peliculas con el id pelicula obtenido por el nombre y colocarlo en el textuser
            
        }
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
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.textuser.count
       
    }
    func segueloginfavorito(){
        if(NSUserDefaults.standardUserDefaults().objectForKey("user_email") == nil){
            self.performSegueWithIdentifier("favoritelogin", sender: nil)
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        if(indexPath.row == 0){
            cell.textLabel?.text = "Nombre de Usuario"
            cell.detailTextLabel?.text = self.textuser.objectAtIndex(indexPath.row ) as? String
        }else if (indexPath.row == 1){
            cell.textLabel?.text = self.textuser.objectAtIndex(indexPath.row) as? String
            cell.detailTextLabel?.text = "base de datos"
        }
        
        return cell
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