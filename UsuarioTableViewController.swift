//
//  UsuarioTableViewController.swift
//  FastMovie
//
//  Created by JuanFer on 23/04/15.
//  Copyright (c) 2015 JuanFer. All rights reserved.
//

import UIKit

class UsuarioTableViewController: UITableViewController {

    var dict:NSArray = NSArray()
    var textuser: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().objectForKey("user_id") != nil{
            self.textuser.addObject(NSUserDefaults.standardUserDefaults().objectForKey("user_id")!)}
        
        if NSUserDefaults.standardUserDefaults().objectForKey("user_username") != nil{
            self.textuser.addObject(NSUserDefaults.standardUserDefaults().objectForKey("user_username")!)}
        
        if NSUserDefaults.standardUserDefaults().objectForKey("user_email") != nil{
        self.textuser.addObject(NSUserDefaults.standardUserDefaults().objectForKey("user_email")!)}
    
        if NSUserDefaults.standardUserDefaults().objectForKey("user_name") != nil {
            self.textuser.addObject(NSUserDefaults.standardUserDefaults().objectForKey("user_name")!)}
        

        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
         seguelogin()
    }
     
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    func seguelogin(){
        self.performSegueWithIdentifier("pasologin", sender: nil)
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

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        if(indexPath.row == 0){
            cell.textLabel?.text = "Nombre de Usuario"
            cell.detailTextLabel?.text = self.textuser.objectAtIndex(indexPath.row + 1) as? String
        }else if (indexPath.row == 1){
            cell.textLabel?.text = "Correo"
            cell.detailTextLabel?.text = self.textuser.objectAtIndex(indexPath.row + 1) as? String
        }else if (indexPath.row >= 2){
            cell.textLabel?.text = "Peliculas Favoritas"
            cell.detailTextLabel?.text = ""
            //aqui se colocan las pelicuals fovoritas de los usuairios
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    

}
