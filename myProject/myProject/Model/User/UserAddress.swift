import Foundation

struct UserAddress: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: UserGEO?
}
