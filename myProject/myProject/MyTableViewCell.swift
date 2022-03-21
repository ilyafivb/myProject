import UIKit
import Stevia

class MyTableViewCell: UITableViewCell {
    static let id = "My cell"
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAll()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAll() {
        setupLayout()
    }
    
    private func setupLayout() {
        contentView.subviews {
            nameLabel
        }
        nameLabel.Top == contentView.Top + 20
        nameLabel.Leading == contentView.Leading + 20
        nameLabel.Bottom == contentView.Bottom - 20
    }
    
    func setupCell() {
        nameLabel.numberOfLines = 0
    }
    
}
