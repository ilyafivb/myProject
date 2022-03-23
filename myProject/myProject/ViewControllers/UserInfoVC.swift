import UIKit
import Stevia

class UserInfoVC: UIViewController {
    
    private let scrollView = UIScrollView()
    private let userInfoLabel = UILabel()
    private let infoStackView = UIStackView()
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    private let websiteLabel = UILabel()
    private let addressInfolabel = UILabel()
    private let addressStackView = UIStackView()
    private let addressStreetLabel = UILabel()
    private let addressSuiteLabel = UILabel()
    private let addressCityLabel = UILabel()
    private let addressZipcodeLabel = UILabel()
    private let geoLatLabel = UILabel()
    private let geoLngLabel = UILabel()
    private let companyStackView = UIStackView()
    private let companyInfoLabel = UILabel()
    private let companyNameLabel = UILabel()
    private let companyCatchPhraseLabel = UILabel()
    private let companyBsLabel = UILabel()
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAll()
    }
    
    private func setupInfoStack() {
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(usernameLabel)
        infoStackView.addArrangedSubview(emailLabel)
        infoStackView.addArrangedSubview(phoneLabel)
        infoStackView.addArrangedSubview(websiteLabel)
        
        infoStackView.axis = .vertical
        infoStackView.alignment = .fill
        infoStackView.distribution = .equalSpacing
        infoStackView.spacing = 30
        
        nameLabel.text = "Name: \(user?.name ?? "")"
        usernameLabel.text = "Username: \(user?.username ?? "")"
        emailLabel.text = "Email: \(user?.email ?? "")"
        phoneLabel.text = "Phone: \(user?.phone ?? "")"
        websiteLabel.text = "Website: \(user?.website ?? "")"
    }
    
    private func setupAddressStack() {
        addressStackView.addArrangedSubview(addressStreetLabel)
        addressStackView.addArrangedSubview(addressSuiteLabel)
        addressStackView.addArrangedSubview(addressCityLabel)
        addressStackView.addArrangedSubview(addressZipcodeLabel)
        addressStackView.addArrangedSubview(geoLatLabel)
        addressStackView.addArrangedSubview(geoLngLabel)
        
        addressStackView.axis = .vertical
        addressStackView.alignment = .fill
        addressStackView.distribution = .equalSpacing
        addressStackView.spacing = 30
        
        addressStreetLabel.text = "Street: \(user?.address?.street ?? "")"
        addressSuiteLabel.text = "Suite: \(user?.address?.suite ?? "")"
        addressCityLabel.text = "City: \(user?.address?.city ?? "")"
        addressZipcodeLabel.text = "Zip code: \(user?.address?.zipcode ?? "")"
        geoLatLabel.text = "GEO lat.: \(user?.address?.geo?.lat ?? "")"
        geoLngLabel.text = "GEO lng.: \(user?.address?.geo?.lng ?? "")"
    }
    
    private func setupCompanyStack() {
        companyStackView.addArrangedSubview(companyNameLabel)
        companyStackView.addArrangedSubview(companyCatchPhraseLabel)
        companyStackView.addArrangedSubview(companyBsLabel)
        companyCatchPhraseLabel.numberOfLines = 0
        
        companyStackView.axis = .vertical
        companyStackView.alignment = .fill
        companyStackView.distribution = .equalSpacing
        companyStackView.spacing = 30
        
        companyNameLabel.text = "Name: \(user?.company?.name ?? "")"
        companyCatchPhraseLabel.text = "Catch Phrase: \(user?.company?.catchPhrase ?? "")"
        companyBsLabel.text = "BS: \(user?.company?.bs ?? "")"
    }
    
    private func setupTitle() {
        userInfoLabel.text = "User Info"
        userInfoLabel.font = UIFont.boldSystemFont(ofSize: 30)
        addressInfolabel.text = "Address Info"
        addressInfolabel.font = UIFont.boldSystemFont(ofSize: 30)
        companyInfoLabel.text = "Company Info"
        companyInfoLabel.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    private func setupAll() {
        setupTitle()
        setupInfoStack()
        setupAddressStack()
        setupCompanyStack()
        setuplayout()
    }
    
    private func setuplayout() {
        view.subviews {
            scrollView
        }
        scrollView.fillContainer()
        scrollView.backgroundColor = .white
        scrollView.subviews {
            userInfoLabel
            infoStackView
            addressInfolabel
            addressStackView
            companyInfoLabel
            companyStackView
        }
        userInfoLabel.Top == scrollView.Top + 20
        userInfoLabel.CenterX == view.CenterX
        infoStackView.Top == userInfoLabel.Bottom + 20
        infoStackView.Leading == view.Leading + 10
        infoStackView.Trailing == view.Trailing - 10
        addressInfolabel.Top == infoStackView.Bottom + 20
        addressInfolabel.CenterX == userInfoLabel.CenterX
        addressStackView.Top == addressInfolabel.Bottom + 20
        addressStackView.Leading == infoStackView.Leading
        addressStackView.Trailing == infoStackView.Trailing
        companyInfoLabel.Top == addressStackView.Bottom + 20
        companyInfoLabel.CenterX == userInfoLabel.CenterX
        companyStackView.Top == companyInfoLabel.Bottom + 20
        companyStackView.Leading == infoStackView.Leading
        companyStackView.Trailing == infoStackView.Trailing
        companyStackView.Bottom == scrollView.Bottom
    }
}
