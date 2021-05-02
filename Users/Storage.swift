import Foundation
import CoreData

final class Storage {
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private let persistentContainer: NSPersistentContainer
    
    static let sharedInstance = Storage()
    
    private init() {
        persistentContainer = try! StackBuilder().load()
    }
}

private final class StackBuilder {
        
    private static let modelName = "Users"
    
    public func load() throws -> NSPersistentContainer {
        var errors = [Error]()
        let persistentContainer = NSPersistentContainer(name: StackBuilder.modelName)
        persistentContainer.persistentStoreDescriptions = [description]
        persistentContainer.loadPersistentStores { (value, error) in
            if error != nil {
                errors.append(error!)
            }
        }
        if errors.count > 0 {
            throw errors.first!
        }
        return persistentContainer as NSPersistentContainer
    }
    
    private let description: NSPersistentStoreDescription = {
        let folder = try! FileManager.default.url(
            for: .applicationSupportDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )
        let url = folder.appendingPathComponent(StackBuilder.modelName + ".sqlite")
        let desc = NSPersistentStoreDescription(url: url)
        desc.shouldInferMappingModelAutomatically = true
        desc.shouldMigrateStoreAutomatically = true
        desc.type = NSSQLiteStoreType
        return desc
    }()
}
