import UIKit
import Dequeue
import Records

final class UserTableView: UITableView, DequeueableTableView, FetchedResultsTableView, FetchedResultsControllerDelegate {
    
    func updateCell(at indexPath: IndexPath, for entity: User) {
        dequeue(at: indexPath, for: entity)
    }
    
    @discardableResult
    func dequeue(at indexPath: IndexPath, for entity: User) -> UserTableViewCell {
        let cell = dequeueCell(at: indexPath) as UserTableViewCell
        cell.update(with: entity)
        return cell
    }
}
