import Foundation
import Records

final class UserController<D: FetchedResultsControllerDelegate>: FetchedResultsController<D> where D.Record: User {
    
    convenience init() {
        try! self.init(context: Storage.sharedInstance.context)
    }
}
