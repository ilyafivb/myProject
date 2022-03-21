import UIKit
import Stevia

class ViewController: UIViewController {
    var users: [User] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var tableView = UITableView() {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.id)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAll()
    }
    
    private func setupAll() {
        setupLayout()
    }
    
    private func setupLayout() {
        view.subviews {
            tableView
        }
        tableView.fillContainer()
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.id, for: indexPath) as! MyTableViewCell
        cell.nameLabel.text = "current row - \(indexPath.row)"
        return cell
    }
    
    
}
