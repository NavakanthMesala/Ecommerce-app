//
//  ListViewController.swift
//  Project
//
//  Created by Navakanth Mesala on 6/23/22.
//

import UIKit

class ListViewController: UIViewController {
    
    let persistentStore = GarmentsPersistentStore()
    
    @IBOutlet weak var tableView: UITableView!
    
    var garments = [Garment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        garments = persistentStore.getGarments()
        garments.sortAlphabetically()
        tableView.reloadData()
    }
    
    @IBAction func segmentedControl(_ sender: Any) {
        if let control = sender as? UISegmentedControl {
            switch control.selectedSegmentIndex {
            case 0:
                garments.sortAlphabetically()
            case 1:
                garments.sortChronologically()
            default: return
            }
            tableView.reloadData()
        }
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = garments[indexPath.row].name
        
        return cell
    }
}

