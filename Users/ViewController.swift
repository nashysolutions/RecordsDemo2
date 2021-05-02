import UIKit

// displays users from database
// backed by NSFetchedResultsController
final class ViewController: UIViewController {

    let userController = UserController<UserTableView>()
    
    private lazy var tableViewHandler = UserTableViewHandler(userController)
    
    @IBOutlet weak var tableView: UserTableView! {
        didSet {
            tableView.dataSource = tableViewHandler
            tableView.estimatedRowHeight = 50
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userController.delegate = tableView
        fetchParseSaveLoad()
    }
    
    // records are fetched over network and saved locally
    // if records are already saved locally , they will be loaded into UI
    // local records are updated if new data found over network
    // new records will be inserted if more data found over network
    // local records will not be deleted if nothing found over network
    private func fetchParseSaveLoad() {
        let context = Storage.sharedInstance.context
        try! JSONUser.archive(in: context)
        try! userController.reload()
    }
}
