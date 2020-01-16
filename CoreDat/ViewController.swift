//
//  ViewController.swift
//  CoreDat
//
//  Created by MacStudent on 2020-01-16.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate=UIApplication.shared.delegate as!AppDelegate
        
        // create context
        
        let context = appDelegate.persistentContainer.viewContext
        
        
        // 3rd step - write into context
        let newUser=NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        newUser.setValue("Raman", forKey: "name")
        newUser.setValue(4372226431, forKey: "phone")
        newUser.setValue("Kuldeep@gmail.c2", forKey: "email")
        newUser.setValue(21, forKey: "age")
        
        // 4th step - save context
        do{
            try context.save()
            print(newUser,"is saved")
        }catch{
            print(error)
        }
        
        
        
        // fetch data and load it
        let request=NSFetchRequest<NSFetchRequestResult>(entityName: "User")
       // request.predicate=NSPredicate(format: "email contains %@", ".com")
        request.predicate=NSPredicate(format: "name=%@", "Rakesh")
        request.returnsObjectsAsFaults=false
        
        // we find our data
        do{
            let results=try context.fetch(request)
            if results.count>0
            {
                for result in results as! [NSManagedObject]{
                    /*
                    if let email = result.value(forKey: "email"){
                        print(email)
                        
                        //
                        let email=email as! String
                        //update coredata
                        result.setValue(String(email.dropLast(2))+".com", forKey: "email")
                        do{
                            try context.save()
                            //print(newUser,"is saved")
                        }catch{
                            print(error)
                        }
                    }
                    */
                    //delete the user karan
                    
                    if let name=result.value(forKey: "name") as?
                        String{
                        context.delete(result)
                        do{
                                try context.save()
                                print(newUser,"is saved")
                            }catch{
                                print(error)
                            }
                        print(name,"is deleted")
                    }
                    
                }
            }
            
        }
        catch{
            print(error)
        }
        
        
        
    }
    
    
}

