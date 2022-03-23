import UIKit
import Stevia

class PostsVC: UIViewController {
    
    private let tableView = UITableView()
    private let networking = Networking()
    
    var posts: [Post] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAll()
    }
    
    private func setupAll() {
        networking.getPosts { posts in
            DispatchQueue.main.async {
                self.posts = posts
            }
        }
        setupLayout()
        setupTable()
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostsTableViewCell.self, forCellReuseIdentifier: PostsTableViewCell.id)
    }
    
    private func setupLayout() {
        view.subviews {
            tableView
        }
        tableView.fillContainer()
    }

}

extension PostsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.id, for: indexPath) as! PostsTableViewCell
        cell.setupCell(post: posts[indexPath.row])
        return cell
    }
}
