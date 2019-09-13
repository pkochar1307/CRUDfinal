//
//  DisplayVC.swift
//  NewSensorApp
//
//  Created by Capgemini on 10/09/19.
//  Copyright © 2019 Capgemini. All rights reserved.
//

import UIKit
import CoreData
var currentUserInfo = String()

class DisplayVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate
{
    
    @IBOutlet var tbl_reload: UITableView!
    var window: UIWindow?
    var item :[Any] = []
    var dict = NSMutableDictionary()
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let context = appdelegate.persistentContainer.viewContext
        var locations  = [Details]() // Where Locations = your NSManaged Class
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Details")
        fetchRequest.returnsObjectsAsFaults = false
        locations = try! context.fetch(fetchRequest) as! [Details]
        for location in locations
        {
            item.append(location)
        }
        print(item)
        tbl_reload.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK : Table ViewMehod
    override func viewWillAppear(_ animated: Bool)
    {
        self.tbl_reload.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return item.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        let dic = item[indexPath.row]  as! NSManagedObject
      //  cell.id?.text = dic.value(forKey: "id" ) as? Int16
        cell.sensorname?.text = dic.value(forKey: "sensorname" ) as? String
        cell.desc?.text = dic.value(forKey: "desc" )  as? String
        return cell
    }
    
    
    
    /*func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            let updatevc = self.storyboard?.instantiateViewController(withIdentifier: "UpdatenaVC") as! UINavigationController
            let temp = self.item[indexPath.row] as! NSManagedObject
            getrecord = temp
            self.present(updatevc, animated: true, completion: nil)
            //self.navigationController?.pushViewController(updatevc, animated: true)
        })
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            let temp = self.item[indexPath.row] as! NSManagedObject
            let userNAME = temp.value(forKey: "email")
            let context = self.appdelegate.persistentContainer.viewContext
            let entitydec = NSEntityDescription.entity(forEntityName: "Login", in: context)
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Login")
            request.entity = entitydec
            let pred = NSPredicate(format: "email = %@", userNAME as! CVarArg)
            request.predicate = pred
            do
            {
                let result = try context.fetch(request)
                if result.count > 0
                {
                    let manage = result[0] as! NSManagedObject
                    context.delete(manage)
                    try context.save()
                    print("Record Deleted")
                }
                else
                {
                    print("Record Not Found")
                }
            }
            catch {}
            self.item.remove(at: indexPath.row)
            self.tbl_reload.deleteRows(at: [indexPath], with: .middle)
            self.tbl_reload.reloadData()
            
        })
        
        return [deleteAction, editAction]
    }
    
    
    @IBAction func btn_next(_ sender: UIBarButtonItem)
    {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(navigation, animated: true)
    }
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}*/

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
}
