import UIKit

final class UserTableViewHandler: NSObject {
    
    private let userController: UserController<UserTableView>
    
    init(_ userController: UserController<UserTableView>) {
        self.userController = userController
    }
}

extension UserTableViewHandler: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return userController.fetchedResultsController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userController.fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return userController.fetchedResultsController.sections?[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableView = tableView as! UserTableView
        let entity = userController.fetchedResultsController.object(at: indexPath)
        return tableView.dequeue(at: indexPath, for: entity)
    }
}
