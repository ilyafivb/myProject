import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: UserAddress?
    var phone: String
    var website: String
    var company: UserCompany?
}
