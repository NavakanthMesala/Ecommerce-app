//
//  GarmentsPersistentStore.swift
//  Project
//
//  Created by Navakanth Mesala on 6/23/22.
//

import UIKit

class GarmentsPersistentStore {
    
    let coreDateContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getGarments() -> [Garment] {
        var garments = [Garment]()
        do {
            garments = try coreDateContext.fetch(Garment.fetchRequest())
        } catch {
            print("Unable to fetch Data")
        }
        return garments
    }
    
    func addGarment(name: String) {
        let newGarment = Garment(context: coreDateContext)
        newGarment.name = name
        newGarment.timeAdded = Date()
        do {
            try coreDateContext.save()
        } catch {
            print("Unable to Save Garment")
        }
    }
    
    
}
