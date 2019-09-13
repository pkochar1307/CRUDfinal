//
//  ViewController.swift
//  NewSensorApp
//
//  Created by Capgemini on 10/09/19.
//  Copyright © 2019 Capgemini. All rights reserved.
//

import UIKit
import  CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
  // class CustomCell : UITableViewCell{
    
   @IBOutlet weak var id: UITextField!
    @IBOutlet weak var sensorname: UITextField!
    
    @IBOutlet weak var desc: UITextView!
    
    
    @IBOutlet weak var tableView: UITableView!
  //  }
    
    @IBAction func createData(_ sender: Any) {
        createData()
   }
    
    @IBAction func updateData(_ sender: Any) {
       // updateData(updatedDetail:Details)
      //  updateData()
    }
    
    var lastCount : Int = 0
    var window: UIWindow?
    var item :[Any] = []
    var dict = NSMutableDictionary()
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let context = appdelegate.persistentContainer.viewContext
        var locations = [Details]() // Login is your Entity name
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Details")
        fetchRequest.returnsObjectsAsFaults = false
        locations = try! context.fetch(fetchRequest) as! [Details]
        
        for location in locations
        {
            item.append(location) // item is your array
        }
        
        lastCount = item.count
    }
    
   let nscontext = ((UIApplication.shared.delegate) as!
        AppDelegate).persistentContainer.viewContext
  
    
    func registerTableViewCell(){
        let label1 = UINib(nibName: "SensorCell", bundle: nil);
        self.tableView.register(label1, forCellReuseIdentifier: "myCell")
    }
    func createData()
    {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Details",
                                                         into: nscontext)
        
        entity.setValue(sensorname.text, forKey:"sensorname") // sensorname is a Your Entity Key
        entity.setValue(desc.text, forKey: "desc")
        entity.setValue(Int(id.text!) , forKey: "id")
        do
        {
            try nscontext.save()
            sensorname.text = ""
            desc.text = ""
        }
        catch
        {
            
        }
        print("Record Inserted")
        self.navigationController?.popViewController(animated: true)
        
      /*  UIView.setAnimationsEnabled(false)
        self.tableView.beginUpdates()
        self.tableView.reloadSections(NSIndexSet(index: 1) as IndexSet, with: UITableViewRowAnimation.none)
        self.tableView.endUpdates()*/
        
        
    }
      
  
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int
    {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! SensorCellTableViewCell // CustomCell is your Cell File name
        let dic = item[indexPath.row] as! NSManagedObject
        //cell.sensorname?.text = dic.value(forKey: "sensorname" ) as? String
        //cell.desc?.text = dic.value(forKey: "desc" ) as? String
        cell.sensorName.text=dic.value(forKey: "sensorname" ) as? String;     cell.sensorDesc.text=dic.value(forKey: "desc" ) as? String
        let senId=dic.value(forKey: "id" ) as? Int64

        cell.sensorId.text = "\(String(describing: senId ?? 0))"

        return cell
    }
    
    //Update segue
    
    
     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "edit" {
            
            var path = tableView.indexPathForSelectedRow()
            
            var EditTableViewController = segue.destinationViewController as! EditTableViewController
            
            EditTableViewController.index = path?.row
            EditTableViewController.modelArray = models
            
        }
    
    

    
    //delete data
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            
            let dic = item[indexPath.row] as! NSManagedObject
            let senId=dic.value(forKey: "id" ) as? Int64
            
            let fetchRequest: NSFetchRequest<Details> = Details.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id== %d", senId!)
            let objects = try! nscontext.fetch(fetchRequest)
            for obj in objects {
                nscontext.delete(obj)
            }
            
            do {
                try nscontext.save() // <- remember to put this :)
            } catch {
                // Do something... fatalerror
            }
            
            
           item.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        }else if editingStyle == .insert{}
        
    }
    }
}


