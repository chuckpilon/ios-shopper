//
//  NewListViewController.swift
//  shopper
//
//  Created by Chuck Pilon on 1/20/20.
//  Copyright © 2020 Pilon Apps, Inc. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NewListViewController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext? = nil
    
//    @IBOutlet weak var name: UITextField?
//    @IBOutlet weak var address1: UITextField?
//    @IBOutlet weak var address2: UITextField?
//    @IBOutlet weak var city: UITextField?
//    @IBOutlet weak var state: UITextField?
//    @IBOutlet weak var zip: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "New List"
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(_:)))
        navigationItem.leftBarButtonItem = cancelButton

        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save(_:)))
        navigationItem.rightBarButtonItem = saveButton
        
        
//        let borderColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
//        name?.addBottomBorder(color: borderColor)
//        address1?.addBottomBorder(color: borderColor)
//        address2?.addBottomBorder(color: borderColor)
//        city?.addBottomBorder(color: borderColor)
//        state?.addBottomBorder(color: borderColor)
//        zip?.addBottomBorder(color: borderColor)

    }

    @objc
    func cancel(_ sender: Any) {
        dismiss(animated: true, completion: {})
    }

    @objc
    func save(_ sender: Any) {

//        let context: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

//        let newStore = StoreBuilder(context: context!)
//            .name(name: name!.text!)
//            .address1(address1: address1!.text!)
//            .address2(address2: address2!.text!)
//            .city(city: city!.text!)
//            .state(state: state!.text!)
//            .zip(zip: zip!.text!)
//            .latitude(latitude: latitude)
//            .longitude(longitude: longitude)
//            .build();
//
//
//        // Add a new list just for testing.
//        // TODO: Remove this
//
//        let newItem1 = ItemBuilder(context: context!)
//            .name(name: name!.text! + " List 1 Item 1")
//            .sku(sku: "799589023")
//            .build()
//
//        let newItem2 = ItemBuilder(context: context!)
//            .name(name: name!.text! + " List 1 Item 2")
//            .sku(sku: "799589023")
//            .build()
//
//        let newList1 = ListBuilder(context: context!)
//            .name(name: name!.text! + " List 1")
//            .open(open: true)
//            .store(store: newStore)
//            .build()
//
//        _ = ListItemBuilder(context: context!)
//            .item(item: newItem1)
//            .quantity(quantity: 3)
//            .list(list: newList1)
//            .build()
//
//        _ = ListItemBuilder(context: context!)
//            .item(item: newItem2)
//            .quantity(quantity: 3)
//            .list(list: newList1)
//            .build()
//
//        //            insertList(name: target.name! + " List 1", open: true, store: target)
//
//
//
//        // Save the context.
//        do {
//            try context!.save()
//        } catch {
//            // Replace this implementation with code to handle the error appropriately.
//            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            let nserror = error as NSError
//            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//        }

        dismiss(animated: true, completion: {})
    }
    
}
