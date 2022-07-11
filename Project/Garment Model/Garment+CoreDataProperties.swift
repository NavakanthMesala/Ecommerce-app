//
//  Garment+CoreDataProperties.swift
//  Project
//
//  Created by Navakanth Mesala on 6/23/22.
//
//

import Foundation
import CoreData


extension Garment: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Garment> {
        return NSFetchRequest<Garment>(entityName: "Garment")
    }

    @NSManaged public var name: String?
    @NSManaged public var timeAdded: Date?

}

extension Array where Element == Garment {
    mutating func sortAlphabetically() {
        self = self.sorted{$0.name?.compare($1.name ?? "", options: .caseInsensitive) == .orderedAscending}
    }
    
    mutating func sortChronologically() {
        self  = self.sorted{ $0.timeAdded?.compare($1.timeAdded ?? Date()) == .orderedAscending }
    }
}

