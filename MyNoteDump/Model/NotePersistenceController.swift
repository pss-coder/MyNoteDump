////
////  NotePersistenceController.swift
////  MyNoteDump
////
////  Created by Pawandeep Singh on 6/8/24.
////
//
//import CoreData
//import Foundation
//
//class NotePersistenceController {
//
//    static let shared = NotePersistenceController()
//    let container: NSPersistentContainer
//
//    init() {
////        Get Model thru name
//        container = NSPersistentContainer(name: "Model")
//
//        // load and check for error
//        container.loadPersistentStores { storeDescription, error in
//            if let error {
//                print("Could not load Core Data persistence stores.", error.localizedDescription)
//            }
//        }
//    }
//
//    init(inMemory: Bool = false) {
//        container = NSPersistentContainer(name: "Model")
//
//        if inMemory {
//            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
//        }
//
//        container.loadPersistentStores { description, error in
//            if let error {
//                print("Could not load Core Data persistence stores.", error.localizedDescription)
//                fatalError()
//            }
//        }
//    }
//
//    func saveChanges() {
//        let context = container.viewContext
//
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                print("Could not save changes to Core Data.", error.localizedDescription)
//            }
//        }
//    }
//
//    func create(title: String, description: String) {
//        // create a NSManagedObject, will be saved to DB later
//        let note = Note(context: container.viewContext)
//
//        note.id = UUID()
//        note.title = title
//        note.text = description
//        note.createdAt = Date()
//
//        // save Changes to DB
//        saveChanges()
//    }
//
//    //e.g of predicateFormat - "title == 'Grocery List'"
//    //If you don’t pass these two values, all records will be fetched
//    // function to fetch notes from DB
//    func read(predicateFormat: String? = nil, fetchLimit: Int? = nil) -> [Note] {
//        // create a temp array to save fetched notes
//        var results: [Note] = []
//        // initialize the fetch request
//        let request = NSFetchRequest<Note>(entityName: "Note")
//
//        // define filter and/or limit if needed
//        if predicateFormat != nil {
//            request.predicate = NSPredicate(format: predicateFormat!)
//        }
//        if fetchLimit != nil {
//            request.fetchLimit = fetchLimit!
//        }
//
//        // fetch with the request
//        do {
//            results = try container.viewContext.fetch(request)
//        } catch {
//            print("Could not fetch notes from Core Data.")
//        }
//
//        // return results
//        return results
//    }
//
//    func update(entity: Note, title: String? = nil, description: String? = nil) {
//        // create a temp var to tell if an attribute is changed
//        var hasChanges: Bool = false
//
//        // update the attributes if a value is passed into the function
//        if title != nil {
//            entity.title = title!
//            hasChanges = true
//        }
//        if description != nil {
//            entity.text = description!
//            hasChanges = true
//        }
//
//        // save changes if any
//        if hasChanges {
//            saveChanges()
//        }
//    }
//
//    func delete(_ note: Note) {
//        container.viewContext.delete(note)
//        saveChanges()
//    }
//
//
//
//}
