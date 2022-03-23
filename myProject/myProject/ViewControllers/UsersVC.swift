import UIKit
import Stevia

class UsersVC: UIViewController {
    
    private var tableView = UITableView()
    private let networking = Networking()
    
    var user: User?
    private var users: [User] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAll()
    }
    
    private func setupAll() {
        networking.getUsers { users in
            DispatchQueue.main.async {
                self.users = users
            }
        }
        setupLayout()
        setupTable()
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UsersTableViewCell.self, forCellReuseIdentifier: UsersTableViewCell.id)
    }
    
    private func setupLayout() {
        view.subviews {
            tableView
        }
        tableView.fillContainer()
    }
    
    private func showUserInfo(user: User) {
        let userInfo = UserInfoVC()
        userInfo.user = user
        navigationController?.pushViewController(userInfo, animated: true)
        
    }
}

extension UsersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.id, for: indexPath) as! UsersTableViewCell
        cell.setupCell(user: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        showUserInfo(user: user)
    }
}
