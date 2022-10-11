//
//  Storage Manager.swift
//  ToDo App
//
//  Created by Stanislav Demyanov on 10.10.2022.
//

import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDo_App")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data Saving support
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveData(_ data: String?) -> Task? {
        let entityDescription = NSEntityDescription.entity(forEntityName: "Task", in: context)
        let task = NSManagedObject(entity: entityDescription!, insertInto: context) as? Task
        task!.title = data

        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                print(error)
            }
        }

        return task
    }
    
    func fetchData(_ data: [Task]) -> [Task] {
        var dataArray = data
        let fetchRequest = Task.fetchRequest()
        
        do {
            dataArray = try context.fetch(fetchRequest)
            return dataArray
        } catch let error {
            print("Failed to fetch data", error)
            return [Task]()
        }
    }
    
    func deleteData(_ data: [Task], index: Int) {
        print(index)
        context.delete(data[index])
        
        do {
            try context.save()
        } catch let error {
            print(error)
        }
    }
    
    private init() {}
}

