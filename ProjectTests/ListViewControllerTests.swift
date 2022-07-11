//
//  ProjectTests.swift
//  ProjectTests
//
//  Created by Navakanth Mesala on 6/23/22.
//

import XCTest
@testable import Project

class ListViewControllerTests: XCTestCase {
    
    var classUndertest: AddItemsViewController!
    let garmentsPersistentStore = GarmentsPersistentStore()
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        classUndertest = storyboard.instantiateViewController(withIdentifier: "AddItemsViewController") as? AddItemsViewController
        classUndertest.loadViewIfNeeded()
        clearDataStore()
        
    }
    
    override  func tearDown() {
        super.tearDown()
        clearDataStore()
    }
    
    
    func testAddTappedButtonStoresData_whenNonEmptySringIsPassed() {
        classUndertest.textfield.text = "First Item"
        classUndertest.addTapped()
        
        XCTAssertEqual(garmentsPersistentStore.getGarments().count, 1)
    }
    
    func testAddTappedButtonDoesNotStoreData_whenEmptySringIsPassed() {
        classUndertest.textfield.text = ""
        classUndertest.addTapped()

        XCTAssertEqual(garmentsPersistentStore.getGarments().count, 0)
    }
}

// Helper
extension ListViewControllerTests {
    
    func clearDataStore() {

        let objects = garmentsPersistentStore.getGarments()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        for object in objects {
            context.delete(object)
        }
        do {
            try context.save()
        } catch {
            print("Unable to delete Data")
        }
       
    }
}
