//
//  AddItemsViewController.swift
//  Project
//
//  Created by Navakanth Mesala on 6/23/22.
//

import UIKit
import CoreData

class AddItemsViewController: UIViewController {
    
    let persistentStore = GarmentsPersistentStore()
    
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTapped() {
        
        guard let name = textfield.text,
              !(textfield.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) else {
                  return
        }
        
        persistentStore.addGarment(name: name)
        dismiss(animated: true, completion: nil)
    }
}


