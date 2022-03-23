import UIKit
import Stevia

class PostsTableViewCell: UITableViewCell {
    
    static let id = "Post cell"
    
    private let userId = UILabel()
    private let id = UILabel()
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
    private let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAll()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAll() {
        setupStack()
        setupLayout()
    }
    
    private func setupStack() {
        stackView.addArrangedSubview(userId)
        stackView.addArrangedSubview(id)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(bodyLabel)
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        titleLabel.numberOfLines = 0
        bodyLabel.numberOfLines = 0
    }
    
    private func setupLayout() {
        contentView.subviews {
            stackView
        }
        stackView.Top == contentView.Top + 20
        stackView.Leading == contentView.Leading + 20
        stackView.Trailing == contentView.Trailing - 20
        stackView.Bottom == contentView.Bottom - 20
    }
    
    func setupCell(post: Post) {
        userId.text = "UserId: \(post.id.description)"
        id.text = "Id: \(post.id.description)"
        titleLabel.text = "Title: \(post.title)"
        bodyLabel.text = "Body: \(post.body)"
    }
}
