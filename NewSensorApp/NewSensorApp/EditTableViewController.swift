//
//  EditTableViewController.swift
//  NewSensorApp
//
//  Created by Capgemini on 13/09/19.
//  Copyright © 2019 Capgemini. All rights reserved.
//

import UIKit
import  CoreData

class EditTableViewController: UITableViewController {

    @IBOutlet weak var editDesc: UITextField!
    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editId: UITextField!
    @IBAction func saveToViewController (segue:UIStoryboardSegue) {
        let EditTableViewController = segue.source as! EditTableViewController
        
        let index = EditTableViewController.index
        
        let modelString = EditTableViewController.editedModel
        
        models[index!] = modelString!
        
        tableView.reloadData()
        
    }
    var index:Int?
    
    var modelArray:[String]!
    
    var editedModel:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editId.text = modelArray[index!]
         editName.text = modelArray[index!]
         editDesc.text = modelArray[index!]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            editId.becomeFirstResponder()
            editName.becomeFirstResponder()
            editDesc.becomeFirstResponder()
            
        }
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "save" {
            editedModel = editId.text
        }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}
