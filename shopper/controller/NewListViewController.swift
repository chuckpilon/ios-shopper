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

class NewListViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, NSFetchedResultsControllerDelegate {
    
    var managedObjectContext: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

    @IBOutlet weak var storePickerView: UIPickerView!
    @IBOutlet weak var name: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "New List"
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(_:)))
        navigationItem.leftBarButtonItem = cancelButton

        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save(_:)))
        navigationItem.rightBarButtonItem = saveButton
        
        storePickerView.delegate = self
        storePickerView.dataSource = self
        
        let borderColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        name?.addBottomBorder(color: borderColor)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![component]
        return sectionInfo.numberOfObjects
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let indexPath = IndexPath(row: row, section: component)
        let store = fetchedResultsController.object(at: indexPath)
        return store.name
    }
    
    @objc
    func cancel(_ sender: Any) {
        dismiss(animated: true, completion: {})
    }

    @objc
    func save(_ sender: Any) {
        
        let context: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        
        let component = 0
        let selectedRow = storePickerView.selectedRow(inComponent: component)
        let indexPath = IndexPath(row: selectedRow, section: component)
        let store = fetchedResultsController.object(at: indexPath)

        _ = ListBuilder(context: context!)
            .name(name: name!.text!)
            .open(open: true)
            .store(store: store)
            .build()
        
        // Save the context.
        do {
            try context!.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }

        dismiss(animated: true, completion: {})
    }
    
    // MARK: - Fetched results controller

    var fetchedResultsController: NSFetchedResultsController<Store> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        NSFetchedResultsController<NSFetchRequestResult>.deleteCache(withName: nil)
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Sort by list created
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        let aFetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: self.managedObjectContext!,
            sectionNameKeyPath: nil,
            cacheName: "StoreCache")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
             // Replace this implementation with code to handle the error appropriately.
             // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             let nserror = error as NSError
             fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    var _fetchedResultsController: NSFetchedResultsController<Store>? = nil
}
