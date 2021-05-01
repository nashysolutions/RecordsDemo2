import UIKit
import Dequeue

final class UserTableViewCell: UITableViewCell, DequeueableComponentIdentifiable {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        textLabel?.numberOfLines = 0
    }
    
    private static let icon = UIImage(systemName: "person.fill")
    
    func update(with user: User) {
        imageView?.image = Self.icon
        textLabel?.text = user.title
        detailTextLabel?.text = "Registered: \(user.isComplete)"
    }
}
