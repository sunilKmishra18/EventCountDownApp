//
//  CoreDataManager.swift
//  EventCountDownApp
//
//  Created by Sunil Mishra on 16/09/22.
//

import CoreData
import UIKit

final class CoreDataManager{
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "EventCountDownApp")
        persistentContainer.loadPersistentStores{_, error in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func get<T: NSManagedObject>(_ id: NSManagedObjectID) -> T?{
        do {
            return try moc.existingObject(with: id) as? T
        }catch {
            print(error)
        }
        return nil
    }
    
    func getAll<T: NSManagedObject>() -> [T]{
            do{
                let fetchRequest = NSFetchRequest<T>(entityName: "\(T.self)")
                return try moc.fetch(fetchRequest)
            }catch{
                print(error)
                return []
            }
        }
    
    func save(){
        do{
            try moc.save()
        }catch{
            print(error)
        }
    }
}
