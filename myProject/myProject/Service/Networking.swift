import Foundation

class Networking {
    
    enum Api: String {
        case users
        case posts
    }
    
    private let baseUrl = "https://jsonplaceholder.typicode.com/"
    
    func getUsers(_ completion: @escaping ([User]) -> Void) {
   
        guard let url = URL(string: baseUrl + Api.users.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("error get users")
            } else {
                guard let data = data else { return }
                let users = try? JSONDecoder().decode([User].self, from: data)
                    completion(users ?? [])
            }
        }.resume()
    }
    
    func getPosts(_ completion: @escaping ([Post]) -> Void) {
        
        guard let url = URL(string: baseUrl + Api.posts.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("error get posts")
            } else {
                guard let data = data else { return }
                let posts = try? JSONDecoder().decode([Post].self, from: data)
                completion(posts ?? [])
            }
        }.resume()
    }
    
    
}
