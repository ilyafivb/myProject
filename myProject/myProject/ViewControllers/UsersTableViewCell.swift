import UIKit
import Stevia

class UsersTableViewCell: UITableViewCell {
    static let id = "User cell"
    
    //var id: Int
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    //let address: UserAddress?
    private let phoneLabel = UILabel()
    private let websiteLabel = UILabel()
    //let company: UserCompany?
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
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(usernameLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(phoneLabel)
        stackView.addArrangedSubview(websiteLabel)
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
    }
    
    private func setupLayout() {
        contentView.subviews {
            stackView
        }
        stackView.Top == contentView.Top + 20
        stackView.Leading == contentView.Leading + 20
        stackView.Bottom == contentView.Bottom - 20
    }
    
    func setupCell(user: User) {
        nameLabel.text = "Name: \(user.name)"
        usernameLabel.text = "Username: \(user.username)"
        emailLabel.text = "Email: \(user.email)"
        phoneLabel.text = "Phone: \(user.phone)"
        websiteLabel.text = "Website: \(user.website)"
    }
}
